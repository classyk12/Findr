import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/phone_field.dart';
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
      backgroundColor: lightPrimary,
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

            Row(
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
                      fontSize: 16.0,
                    )),
              ],
            ),

//            Spacer(),
            Text(
              'Edit Profile',
              style: TextStyle(fontSize: 20.0),
            ),
                FlatButton(
                  padding: EdgeInsets.only(left: 30),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.green, fontSize: 16.0),
                    ))
          ]),
        ),

      ),
      body: Column(
//            shrinkWrap: true,
      mainAxisSize: MainAxisSize.max,
        children: <Widget>[
      Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.22,
          child: Center(
              child: ProfilePicture(onPressed: () {}, showCamera: true))),
      YMargin(20.0),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left:15.0, right: 15.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'First Name',
                  style: TextStyle(
                      fontSize: 15,
                      color: darkBG,
                      fontWeight: FontWeight.w600),
                ),
              ),
              TextInput(controller: null),
              YMargin(10),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Last Name',
                  style: TextStyle(
                      fontSize: 15,
                      color: darkBG,
                      fontWeight: FontWeight.w600),
                ),
              ),
              TextInput(controller: null),
              YMargin(10),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                      fontSize: 15,
                      color: darkBG,
                      fontWeight: FontWeight.w600),
                ),
              ),
              TextInput(controller: null),
              YMargin(10),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                      fontSize: 15,
                      color: darkBG,
                      fontWeight: FontWeight.w600),
                ),
              ),
              PhoneField(hintText: 'Phone number', onChanged: null),
              YMargin(20),
              Center(
                  child: FlatButton(
                child: Text('Cancel',
                    style: TextStyle(color: Colors.red, fontSize: 16)),
                onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
                },
              ))
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}
