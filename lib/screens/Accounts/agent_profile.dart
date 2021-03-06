import 'package:findr/providers/agent_provider.dart';
import 'package:findr/screens/Accounts/edit_profile.dart';
import 'package:findr/screens/student_drawer.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class AgentProfileScreen extends StatefulWidget {
  @override
  _AgentProfileScreenState createState() => _AgentProfileScreenState();
}

class _AgentProfileScreenState extends State<AgentProfileScreen> {
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
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   centerTitle: false,
      //   title: InkWell(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      //       Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //         size: 20.0,
      //       ),
      //       Text('Back',
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             color: Colors.black,
      //             fontSize: 16.0,
      //           ))
      //     ]),
      //   ),
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(12.0).add(EdgeInsets.only(right: 6)),
      //       child: Image.asset(
      //         'assets/images/Findr_logo.png',
      //         height: 60,
      //         width: 60,
      //       ),
      //     )
      //   ],
      // ),


      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[

                      ProfilePicture(onPressed: () {}, showCamera: false,
                       image: agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.image),

                      Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 3.0),
                          child: Text(agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.fullName,
                              style: TextStyle(
                                color: darkBG,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: <
                            Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.userType,
                              style: TextStyle(
                                  color: darkBG.withOpacity(0.7),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          
                          agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.isVerified?.toLowerCase() == "verified"
                              ? Container(
                            decoration: BoxDecoration(
                              color: darkAccent,
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                              Border.all(color: lightPrimary, width: 1.5),
                            ),
                            padding: EdgeInsets.all(4.0),
                            child:
                            Icon(Icons.done, color: lightPrimary, size: 10),
                          )
                              : 
                              
                              Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                              Border.all(color: Colors.grey[800], width: 1.5),
                            ),
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.done,
                                color: Colors.grey[200], size: 10),
                          ),
                        ])
                      ])
                    ],
                  ),

                  YMargin(30.0),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(LineIcons.phone_square, color: Colors.grey, size: 20),
                      XMargin(10.0),
                      Text(
                        agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.phoneNumber,
                        //'(+234)-903-566-1212',
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
                      Text(agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.email,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),

                  YMargin(10.0),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(LineIcons.cc_mastercard, color: Colors.grey),
                      XMargin(10.0),
                      agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.isVerified?.toLowerCase() != "verified"
                          ? Text('Not Verified',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))
                          : Text('Verified',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),


            Divider(
              color: Colors.grey[600],
              thickness: 1.0,
              height: 30,
            ),

            Container(

              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
              color: Colors.greenAccent.withOpacity(0.2),
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
            YMargin(5),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Column(
                children: <Widget>[



                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(LineIcons.share, color: Colors.black, size: 20.0,),
                      XMargin(10.0),
                      Text('Share',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),

                  YMargin(20),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(LineIcons.lock, color: Colors.black, size: 20.0,),
                      XMargin(10.0),
                      Text('Change pin',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
            YMargin(6),

            Divider(
              color: Colors.grey[600],
              thickness: 1.0,
              height: 30,
            ),



            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(LineIcons.power_off, color: Colors.red, size: 20,),
                  XMargin(10.0),
                  Text('Sign out',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
