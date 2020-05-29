import 'package:findr/screens/student_drawer.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/house_item.dart';
import 'package:findr/widgets/search_field.dart';
import 'package:flutter/material.dart';

class StudentDashboardScreen extends StatefulWidget{

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}
class _StudentDashboardState extends State<StudentDashboardScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkAccent,
        iconTheme: new IconThemeData(color: Colors.white),
        title: SearchField(searchController: TextEditingController()),
      ),
        drawer: StudentDrawer(),
        
        body: Padding(padding: EdgeInsets.all(15.0).add(EdgeInsets.only(left: 5, right: 5)),
        child: ListView.builder(
          itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) => HouseItem()),)
    );
  }
}