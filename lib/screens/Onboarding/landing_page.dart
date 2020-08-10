import 'package:findr/screens/Onboarding/onboarding_screen.dart';
import 'package:findr/screens/login_screen.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';

import '../../widgets/button.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPrimary,
      body: Center(
        child: ListView(
//          mainAxisAlignment: MainAxisAlignment.center,
        shrinkWrap: true,
            children: <Widget>[
              Hero(
                  tag: 'findr_logo',
                  child: Image.asset('assets/images/Findr2.png', height: 200.0, width: 200)),
              SizedBox(height: 80),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Button(
                      text: 'Get Started',
                      onPressed: () {
//                      Navigator.pushNamed(context, '/agent-student');
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen()));
                      },
                      height: 50,
                    ),
                  ),
                  FlatButton(
                    splashColor: lightAccent.withOpacity(0.2),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: darkBG,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
      bottomSheet: Container(
        color: lightPrimary,
        width: screenWidth(context),
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Terms and conditions',
          textAlign: TextAlign.center,
          style: TextStyle(color: darkBG, fontSize: 12.0),
        ),
      ),
    );
  }
}
