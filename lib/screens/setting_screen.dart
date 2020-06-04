
import 'package:findr/screens/student_drawer.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SettingScreen extends StatefulWidget{

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: false,
        backgroundColor: darkAccent,
        brightness: Brightness.dark,
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Settings', style: TextStyle(color: Colors.white),),
      ),
      drawer: StudentDrawer(title: 'Settings'),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[
            
            _SettingTile(text: 'Change Password', onPressed: (){}, icon: LineIcons.lock,),
            _SettingTile(text: 'Notifications', onPressed: (){}, icon: LineIcons.bell,),
            _SettingTile(text: 'Blocked Users', onPressed: (){}, icon: Icons.block,),
            _SettingTile(text: 'Help', onPressed: (){}, icon: LineIcons.question_circle,),


          ],
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget{

  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  _SettingTile({@required this.text, @required this.onPressed, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.only(top: 10.0),

      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Icon(icon),
              XMargin(10),
              Text(text, style: TextStyle(fontSize: 16),),
            ],
          ),
        ),
      ),
    );
  }
}