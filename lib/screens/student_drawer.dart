import 'package:findr/screens/Accounts/student_profile.dart';
import 'package:findr/screens/Onboarding/landing_page.dart';
import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class StudentDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return Drawer(
        // elevation: 50.0,
        child: Container(
          color: darkAccent,
          // padding: const EdgeInsets.all(20.0),
          child: ListView(
            padding: const EdgeInsets.all(40.0),
            children: <Widget>[
              YMargin(30),
      
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:10),
            child: ProfilePicture(onPressed: (){}),
          ),
          Text('Ogbonna Ikenna', style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 20)),
          Text('thefuckingflag@gmail.com', style: TextStyle(color:Colors.white60, fontWeight: FontWeight.normal,fontSize: 14)),
          Text('+23490898767', style: TextStyle(color:Colors.white60, fontWeight: FontWeight.normal,fontSize: 14))
        ],
      ),
YMargin(40.0),

              Padding(
                padding: const EdgeInsets.only(top:0, left: 30, right: 10, bottom: 10),
                child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentDashboardScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(LineIcons.dashboard, color:Colors.white),
                    XMargin(15),
                    Text('Dashboard', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
                ),
              ),

              // YMargin(20),
   Padding(
                padding: const EdgeInsets.only(top:10, left: 30, right: 10, bottom: 10),
     child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentProfileScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(Icons.account_circle, color:Colors.white),
                     XMargin(15),
                    Text('Profile', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
                ),
   ),

               Padding(
                padding: const EdgeInsets.only(top:10, left: 30, right: 10, bottom: 10),
                 child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentProfileScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(Icons.bookmark, color:Colors.white),
                     XMargin(15),
                    Text('Bookmarks', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
              ),
               ),

               Padding(
                padding: const EdgeInsets.only(top:10, left: 30, right: 10, bottom: 10),
                 child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentProfileScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(Icons.favorite, color:Colors.white),
                     XMargin(15),
                    Text('Favorites', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
              ),
               ),

               Padding(
                padding: const EdgeInsets.only(top:10, left: 30, right: 10, bottom: 10),
                 child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentProfileScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(Icons.block, color:Colors.white),
                     XMargin(15),
                    Text('Blocked Users', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
              ),
               ),

               Padding(
                padding: const EdgeInsets.only(top:10, left: 30, right: 10, bottom: 10),
                 child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentProfileScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(Icons.info, color:Colors.white),
                     XMargin(15),
                    Text('About us', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
              ),
               ),

               Padding(
                padding: const EdgeInsets.only(top:10, left: 30, right: 10, bottom: 10),
                 child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentProfileScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(Icons.settings, color:Colors.white),
                     XMargin(15),
                    Text('Settings', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
              ),
               ),

               Padding(
                padding: const EdgeInsets.only(top:10, left: 30, right: 10, bottom: 10),
                 child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentProfileScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(LineIcons.question_circle, color:Colors.white),
                     XMargin(15),
                    Text('Help', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
              ),
               ),


 Padding(
                padding: const EdgeInsets.only(top:70, left: 30, right: 10, bottom: 10),
                 child: InkWell(
                     onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LandingScreen()));
                      },
                                child: Row( children: <Widget>[
                    Icon(LineIcons.sign_out, color:Colors.white),
                     XMargin(15),
                    Text('Sign Out', style: sideBarTextStyle,)
                  ],
                      // child: Text('Dashboard')),
                  ),
              ),
               ),

            ],
          ),
        ),
      );
  }
}