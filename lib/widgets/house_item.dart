

import 'package:findr/models/house.dart';
import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/screens/agent_details_screen.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HouseItem extends StatelessWidget {

  final HouseList house;
  

  HouseItem({this.house}): assert(house != null);

  @override
  Widget build(BuildContext context) {
    AgentProvider agentProvider  = Provider.of<AgentProvider>(context);

    String img ;
    if(house.image.length > 0) {     
      img = house.image[1];
      //get a random image from list of house image
      //display the first image in the list of images


     // img = house.image[Random().nextInt(house.image.length)];
   // }
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))
      ),
      child: Container(
//        constraints: BoxConstraints(minHeight: 120),
        child: Row(
          mainAxisSize: MainAxisSize.min,
//        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IntrinsicHeight(
              child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  FadeInImage.assetNetwork(image: img,
                  placeholder: 'assets/images/Findr_logo.png', width: screenWidth(context, percent: 0.3),
                  height: 128,
                  fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(4),
                      color: Color(0xffc5c708),
                      child: Text('New', style: TextStyle(color: Colors.white, fontSize: 8),),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${house.houseType ?? 'To Let'}',
                        style: TextStyle(
                          color: darkBG,
                          fontSize: 13,
                        ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,),
                        YMargin(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(LineIcons.map_marker,
                                color: Colors.grey, size: 12,),
                                XMargin(2),
                                Text('${house.houseArea}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,

                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text('${DateFormat("dd-MM-yyyy hh:mm").format(DateTime.parse("${house.createdAt}"))}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,

                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,),
                            ),


                          ],
                        ),
//                    YMargin(6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('N${house.price}',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 14,
                              ),),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: InkWell(
                                    onTap: (){},
                                    child: Icon(LineIcons.bookmark, color: Colors.grey[700], size: 22,),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: InkWell(
                                    onTap: (){},
                                    child: Icon(LineIcons.wechat, color: Colors.grey[700],size: 22,),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: InkWell(
                                    onTap: (){},
                                    child: Icon(LineIcons.heart_o, color: Colors.grey[700], size: 22,),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> AgentDetailsScreen()));

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Contact',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 13,
                              ),),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey[400],
                          width: 0,
                        ),

                         Consumer<HouseProvider>(
                            builder: (ctx, provider, widget) => InkWell(
                            onTap: (){
                              provider.getById(house.id);
                              Navigator.pushNamed(context, '/house-details');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('View Details',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 13,
                                ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  else{
    return Center(
    child: agentProvider.agentDashboardResponse.data.userType.toLowerCase() == 'agent' ? Text('This agent does not have a listing yet!') : Text('No listing found')
    );
  }
  }
}