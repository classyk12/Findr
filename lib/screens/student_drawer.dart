import 'package:findr/screens/Accounts/student_profile.dart';
import 'package:findr/screens/Onboarding/landing_page.dart';
import 'package:findr/screens/bookmark_screen.dart';
import 'package:findr/screens/favourite_screen.dart';
import 'package:findr/screens/login_screen.dart';
import 'package:findr/screens/setting_screen.dart';
import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentDrawer extends StatelessWidget {
  final String title;
  StudentDrawer({@required this.title});

  final List<String> titles = ['Dashboard', 'Profile', 'Bookmarks', 'Favourites', 'Block Users', 'About us', 'Settings', 'Help'];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: darkAccent,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30),
              color: darkAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: darkAccent,
                              borderRadius: BorderRadius.circular(60.0),
                              border: Border.all(color: lightPrimary, width: 2.5),
                            ),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                            ),
                          ),
                        ),
                        Text('Ogbonna Ikenna',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        YMargin(4),
                        Text('thefuckingflag@gmail.com',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.normal,
                                fontSize: 14)),
                        YMargin(4),
                        Text('+23490898767',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.normal,
                                fontSize: 14))
                      ],
                    ),
                  ),

//            YMargin(40.0),
                  Container(
                    child: Column(
                      children: <Widget>[

                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 30,  bottom: 5),
                          color: title == titles[0] ? Colors.white : darkAccent,
                          child: InkWell(
                            onTap: () {
                              if(title != titles[0]) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DashboardScreen()));
                              }else{
                                Navigator.pop(context);
                              }
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(LineIcons.dashboard, color: title != titles[0] ? Colors.white : darkAccent),
                                XMargin(15),
                                Text(
                                  titles[0],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: title != titles[0] ? Colors.white : darkAccent,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                              // child: Text('Dashboard')),
                            ),
                          ),
                        ),

                        // YMargin(20),
                        Container(
                          color: title == titles[1] ? Colors.white : darkAccent,
                          padding: const EdgeInsets.only(top: 5, left: 30,  bottom: 5),
                          child: InkWell(
                            onTap: () {
                              if(title != titles[1]) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        StudentProfileScreen()));
                              }else{
                                Navigator.pop(context);
                              }
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.account_circle, color: title != titles[1] ? Colors.white : darkAccent),
                                XMargin(15),
                                Text(
                                  titles[1],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: title != titles[1] ? Colors.white : darkAccent,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                              // child: Text('Dashboard')),
                            ),
                          ),
                        ),

                        Container(
                          color: title == titles[2] ? Colors.white : darkAccent,
                          padding: const EdgeInsets.only(top: 5, left: 30,  bottom: 5),
                          child: InkWell(
                            onTap: () {
                              if(title != titles[2]) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BookmarkScreen()));
                              }else{
                                Navigator.pop(context);
                              }
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.bookmark, color: title != titles[2] ? Colors.white : darkAccent,),
                                XMargin(15),
                                Text(
                                  titles[2],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: title != titles[2] ? Colors.white : darkAccent,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                              // child: Text('Dashboard')),
                            ),
                          ),
                        ),

                        Container(
                          color: title == titles[3] ? Colors.white : darkAccent,
                          padding: const EdgeInsets.only(top: 5, left: 30,  bottom: 5),
                          child: InkWell(
                            onTap: () {
                              if(title != titles[3]) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        FavouriteScreen()));
                              }else{
                                Navigator.pop(context);
                              }
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(LineIcons.heart_o, color: title != titles[3] ? Colors.white : darkAccent),
                                XMargin(15),
                                Text(
                                  titles[3],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: title != titles[3] ? Colors.white : darkAccent,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                              // child: Text('Dashboard')),
                            ),
                          ),
                        ),

//                        Container(
//                          color: title == titles[4] ? Colors.white : darkAccent,
//                          padding: const EdgeInsets.only(top: 5, left: 30,  bottom: 5),
//                          child: InkWell(
//                            onTap: () {
//                              if(title != titles[4]) {
//                                Navigator.of(context).push(MaterialPageRoute(
//                                    builder: (BuildContext context) =>
//                                        StudentDashboardScreen()));
//                              }else{
//                                Navigator.pop(context);
//                              }
//                            },
//                            child: Row(
//                              children: <Widget>[
//                                Icon(Icons.block, color: title != titles[4] ? Colors.white : darkAccent),
//                                XMargin(15),
//                                Text(
//                                  titles[4],
//                                  style: TextStyle(
//                                      fontSize: 15,
//                                      color: title != titles[4] ? Colors.white : darkAccent,
//                                      fontWeight: FontWeight.w500
//                                  ),
//                                )
//                              ],
//                              // child: Text('Dashboard')),
//                            ),
//                          ),
//                        ),



                        Container(
                          color: title == titles[6] ? Colors.white : darkAccent,
                          padding: const EdgeInsets.only(top: 5, left: 30,  bottom: 5),
                          child: InkWell(
                            onTap: () {
                              if(title != titles[6]) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SettingScreen()));
                              }else{
                                Navigator.pop(context);
                              }
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(LineIcons.cog, color: title != titles[6] ? Colors.white : darkAccent,),
                                XMargin(15),
                                Text(
                                  titles[6],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: title != titles[6] ? Colors.white : darkAccent,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                              // child: Text('Dashboard')),
                            ),
                          ),
                        ),

//                        Container(
//                          color: title == titles[7] ? Colors.white : darkAccent,
//                          padding: const EdgeInsets.only(top: 5, left: 30,  bottom: 5),
//                          child: InkWell(
//                            onTap: () {
//                              if(title != titles[7]) {
//                                Navigator.of(context).push(MaterialPageRoute(
//                                    builder: (BuildContext context) =>
//                                        StudentDashboardScreen()));
//                              }else{
//                                Navigator.pop(context);
//                              }
//                            },
//                            child: Row(
//                              children: <Widget>[
//                                Icon(LineIcons.question_circle, color: title != titles[7] ? Colors.white : darkAccent,),
//                                XMargin(15),
//                                Text(
//                                  titles[7],
//                                  style: TextStyle(
//                                      fontSize: 15,
//                                      color: title != titles[7] ? Colors.white : darkAccent,
//                                      fontWeight: FontWeight.w500
//                                  ),
//                                )
//                              ],
//                              // child: Text('Dashboard')),
//                            ),
//                          ),
//                        ),

//                        Container(
//                          color: title == titles[5] ? Colors.white : darkAccent,
//                          padding: const EdgeInsets.only(top: 5, left: 30,  bottom: 5),
//                          child: InkWell(
//                            onTap: () {
//                              if(title != titles[5]) {
//                                Navigator.of(context).push(MaterialPageRoute(
//                                    builder: (BuildContext context) =>
//                                        AboutUsScreen()));
//                              }else{
//                                Navigator.pop(context);
//                              }
//                            },
//                            child: Row(
//                              children: <Widget>[
//                                Icon(LineIcons.users, color: title != titles[5] ? Colors.white : darkAccent,),
//                                XMargin(15),
//                                Text(
//                                  titles[5],
//                                  style: TextStyle(
//                                      fontSize: 15,
//                                      color: title != titles[5] ? Colors.white : darkAccent,
//                                      fontWeight: FontWeight.w500
//                                  ),
//                                )
//                              ],
//                            ),
//                          ),
//                        ),
                      ],
                    ),
                  ),



                  Container(
                    padding: const EdgeInsets.only(
                        top: 40, left: 30, bottom: 10),
                    child: InkWell(
                      onTap: () async{
                       SharedPreferences pref = await SharedPreferences.getInstance();
                              pref.remove("token");
                              pref.remove("id");
                              pref.remove("fullName");

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => LandingScreen()));
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(LineIcons.sign_out, color: Colors.white),
                          XMargin(15),
                          Text(
                            'Sign Out',
                            style: sideBarTextStyle,
                          )
                        ],
                        // child: Text('Dashboard')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
