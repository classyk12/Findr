import 'package:findr/utils/margin.dart';
import 'package:findr/widgets/button.dart';
import 'package:findr/widgets/password_input.dart';
import 'package:findr/widgets/text_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Text('Hi!', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),),
          YMargin(4),
          Text('Please login with your account',),
          YMargin(20),
          TextInput(controller: null),
          YMargin(10),
          PasswordInput(controller: null, hintText: "Password",),
          YMargin(20),
          Button(text: 'Login', onPressed: (){}),

        ],

      ),
    );
  }
}