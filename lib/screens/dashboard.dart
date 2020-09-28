import 'package:findr/models/agent.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/screens/student_drawer.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/house_item.dart';
import 'package:findr/widgets/loader.dart';
import 'package:findr/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  HouseProvider houseProvider;
  AgentProvider agentProvider;

  @override
  Widget build(BuildContext context) {
    houseProvider = Provider.of<HouseProvider>(context);
    agentProvider = Provider.of<AgentProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkAccent,
          iconTheme: new IconThemeData(color: Colors.white),
          title: SearchField(searchController: TextEditingController()),
          brightness: Brightness.dark,
        ),
        drawer: StudentDrawer(title: 'Dashboard'),
//        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(LineIcons.plus),),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: _pageBody());
  }

  Widget _pageBody() {
    //display dashboard based on user-type
//  if((agentProvider.agentDashboardResponse?.data?.userType ?? '').toLowerCase()  == "agent"){
    if (agentProvider.agentDashboardResponse.status == Status.LOADING) {
      return Loading(isLargeLoading: true);
    } else if (agentProvider?.agentDashboardResponse?.status ==
            Status.COMPLETED &&
        agentProvider.agentDashboardResponse.data != null) {
      if ((agentProvider.agentDashboardResponse?.data?.userType ?? '')
              .toLowerCase() ==
          "agent") {
        Listings agentHouses =
            agentProvider.agentDashboardResponse.data.agentData.agentlistings;
        if (agentHouses.data.length > 0) {
          return Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Column(children: <Widget>[
                Text('Im the new guy here'),
                YMargin(20),
                ListView.builder(
                    itemCount: agentHouses.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => HouseItem(
                          house: agentHouses.data[index],
                        )),
              ]));
        } else {
          return Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                //  Lottie.asset('assets/lottie/emptyHouse.json', height: 100, width: 100),
                Text('no listings here!'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/create-listing');
                    },
                    child: Text('Add a listing'),
                  ),
                )
                //Button(text: 'Add a Listing', onPressed: (){}, height: 100, width: 100)
              ]));
        }
      } else {
        if (houseProvider?.houseResponse?.status == Status.LOADING) {
          return Loading();
        } else if (houseProvider.houseResponse.status == Status.COMPLETED &&
            houseProvider?.houseResponse?.data != null) {
          List houses = houseProvider.houseResponse.data;
          if (houses.length > 0) {
            return Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Column(
                children: <Widget>[
                  Text('i am the student header'),
                  YMargin(20),
                  ListView.builder(
                      itemCount: houses.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => HouseItem(
                            house: houses[index],
                          ))
                ],
              ),
            );
          } else {
            return Center(
              child: Text('student Empty list'),
            );
          }
        } else {
          return Center(
            child: Text('student Error'),
          );
        }
      }
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(' agent Error'),
            RaisedButton(
                color: darkBG, onPressed: () {}, child: Text('Reload')),
          ],
        ),
      );
    }

//  } else{
  }

//  }

}
