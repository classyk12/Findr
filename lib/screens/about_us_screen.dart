import 'package:findr/screens/student_drawer.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: false,
        backgroundColor: darkAccent,
        brightness: Brightness.dark,
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('About Us', style: TextStyle(color: Colors.white),),
      ),
      drawer: StudentDrawer(title: 'About us'),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[




          ],
        ),
      ),
    );
  }
}