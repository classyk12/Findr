import 'package:findr/screens/student_drawer.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/house_item.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget{

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<BookmarkScreen>{

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: darkAccent,
          brightness: Brightness.dark,
          iconTheme: new IconThemeData(color: Colors.white),
          title: Text('Bookmarks', style: TextStyle(color: Colors.white),),
        ),
        drawer: StudentDrawer(title: 'Bookmarks'),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: ListView.builder(
            itemCount: 10,
              itemBuilder: (context, index) => HouseItem(),
          ),
        ),
      );
  }
}