import 'package:findr/screens/Onboarding/onboarding_screen.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';

import '../../widgets/button.dart';

class LandingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPrimary,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Findr2.png', height: 200.0, width: 200),
            SizedBox(height: 100),
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
                  onPressed: (){},
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
