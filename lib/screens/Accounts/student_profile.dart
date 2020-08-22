import 'package:findr/providers/agent_provider.dart';
import 'package:findr/screens/Accounts/edit_profile.dart';
import 'package:findr/screens/student_drawer.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class StudentProfileScreen extends StatefulWidget {
  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
 // bool _isVerified = true;
  AgentProvider agentProvider;

  @override
  Widget build(BuildContext context) {

    agentProvider = Provider.of<AgentProvider>(context);
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        backgroundColor: darkAccent,
//        backgroundColor: Colors.transparent,
        elevation: 0,
//        automaticallyImplyLeading: false,
        centerTitle: false,
        brightness: Brightness.dark,
        title: Text('Profile', style: TextStyle(color: Colors.white),),
      ),


      drawer: StudentDrawer(title: 'Profile'),

      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 15.0, top:20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // CircleAvatar(
                      //         radius: 40,
                      //         backgroundImage: NetworkImage( 
                      //           agentProvider?.agentDashboardResponse?.data?.agentdetails?.image ?? 'https://via.placeholder.com/150'),
                      //       ),
                          ProfilePicture(onPressed: () {}, 
                          showCamera: false, image: agentProvider?.agentDashboardResponse?.data?.studentData?.image),
                      Column(children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 3.0),
                          child: Text(agentProvider?.agentDashboardResponse?.data?.studentData?.fullName ?? 'loading...',
                              style: TextStyle(
                                color: darkBG,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 3.0),
                          child: Text(
                            agentProvider?.agentDashboardResponse?.data?.studentData?.userType ?? 'loading...',
                            style: TextStyle(
                                color: darkBG.withOpacity(0.7),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600),
                            textDirection: TextDirection.ltr,
                          ),
                        )
                      ])
                    ],
                  ),

                  YMargin(30.0),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(LineIcons.phone_square, color: Colors.grey, size: 20),
                      XMargin(10.0),
                      Text(agentProvider?.agentDashboardResponse?.data?.studentData?.phoneNumber ?? 'loading...',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300)),
                      Spacer(),
                      InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0, right: 8.0),
                            child: Text(
                              'Hide',
                              style: TextStyle(color: Colors.green, fontSize: 14.0),
                            ),
                          ))
                    ],
                  ),

                  YMargin(10.0),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(LineIcons.envelope, color: Colors.grey, size: 20.0,),
                      XMargin(10.0),
                      Text(agentProvider?.agentDashboardResponse?.data?.studentData?.email ?? 'loading...',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),

                  YMargin(10.0),


                ],
              ),
            ),


            Divider(
              color: Colors.grey[600],
              thickness: 1.0,
              height: 30,
            ),

            Container(

              padding: const EdgeInsets.only(left: 30.0, right: 15.0, top: 10.0, bottom: 10.0),
              color: Colors.greenAccent.withOpacity(0.1),
              child: Row(children: <Widget>[
                Icon(LineIcons.pencil, color: Colors.black, size: 20,),
                XMargin(10.0),
                InkWell(
                  child: Text(
                    'Edit profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => EditProfileScreen()));
                  },
                )
              ]),
            ),

            YMargin(10),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 15.0, top: 10.0),
              child: Column(
                children: <Widget>[



                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(LineIcons.users, color: Colors.black, size: 20.0,),
                      XMargin(10.0),
                      Text('Tell a friend',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),

                  YMargin(10),

                ],
              ),
            ),


            Divider(
              color: Colors.grey[600],
              thickness: 1.0,
              height: 30,
            ),



            Padding(
              padding: const EdgeInsets.only(left:30.0, right: 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(LineIcons.power_off, color: Colors.red, size: 20,),
                  XMargin(10.0),
                  Text('Log out',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
