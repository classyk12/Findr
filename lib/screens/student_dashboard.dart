import 'package:findr/models/base_response.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/screens/student_drawer.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/house_item.dart';
import 'package:findr/widgets/loader.dart';
import 'package:findr/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentDashboardScreen extends StatefulWidget{

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}
class _StudentDashboardState extends State<StudentDashboardScreen>{
  
  HouseProvider houseProvider;

  @override
  Widget build(BuildContext context) {
    houseProvider = Provider.of<HouseProvider>(context);
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
        
        body: _pageBody()
    );
  }
  
  Widget _pageBody(){
    if(houseProvider.houseResponse.status == Status.LOADING){
      return Loading();
    }else if(houseProvider.houseResponse.status == Status.COMPLETED && 
        houseProvider.houseResponse.data != null){
      List houses = houseProvider.houseResponse.data;
      if(houses.length > 0){
        return Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),

          child: ListView.builder(
              itemCount: houses.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => HouseItem()),);
      }else{
        return Center(child: Text('Empty list'),);
      }

    }else{
      return Center(child: Text('Error'),);
    }
  }
}