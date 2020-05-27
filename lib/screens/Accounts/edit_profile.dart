import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:findr/widgets/text_input.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title:InkWell(   
          onTap: (){
              Navigator.pop(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
              children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.0,
            ),
            Text('Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16.0,)),
               Spacer(),
              Center(child: Text('Edit Profile', style: TextStyle(fontSize: 20.0),))

          ]),
        ),

        actions: <Widget>[
        
          Padding(
            padding: const EdgeInsets.all(12.0).add(EdgeInsets.only(right: 6, left: 20)),
            child: FlatButton(onPressed: (){}, child: Text('Save', style: TextStyle(color:Colors.green, fontSize: 18.0),))
            
          )
        ],
      ),

body: Container(
  child: Column(
    children: <Widget>[
      Container(color: Colors.white, height: MediaQuery.of(context).size.height * 0.22, 
      child: Center(child: ProfilePicture(onPressed: (){}, showCamera: true))),
      YMargin(20.0),
      
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('First Name', style: TextStyle(fontSize: 15,color: darkBG ,fontWeight: FontWeight.w600),),
            ),
            TextInput(controller: null),
            YMargin(10),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('Last Name', style: TextStyle(fontSize: 15,color: darkBG , fontWeight: FontWeight.w600),),
           ),
            TextInput(controller: null),
            YMargin(4),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('E-mail', style: TextStyle(fontSize: 15,color: darkBG , fontWeight: FontWeight.w600),),
           ),
            TextInput(controller: null),
            YMargin(4),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text('Phone Number', style: TextStyle(fontSize: 15,color: darkBG , fontWeight: FontWeight.w600),),
             ),
            TextInput(controller: null),
            YMargin(40),

           Center(
             child: FlatButton(child: Text('Cancel', style:TextStyle(color: Colors.red, fontSize: 25)), onPressed: (){},)
           )

          ],

        ),
    ),



    ],
  )
),
    );
  }
}