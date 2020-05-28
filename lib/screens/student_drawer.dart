import 'package:findr/screens/Accounts/student_profile.dart';
import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/margin.dart';
import 'package:flutter/material.dart';

class StudentDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              YMargin(30),
              InkWell(
                  onTap: () {


                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => StudentDashboardScreen()));
                  },
                  child: Text('Dashboard')),
              YMargin(20),
              InkWell(
                  onTap: () {


                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => StudentProfileScreen()));
                  },
                  child: Text('Student profile')),

            ],
          ),
        ),
      );
  }
}