
import 'package:findr/screens/Onboarding/onboarding_screen.dart';
import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/button.dart';
import 'package:findr/widgets/phone_field.dart';
import 'package:findr/widgets/pin_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: lightPrimary,
        centerTitle: false,
        title: Navigator.canPop(context)
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
                      ))
                ]),
              )
            : XMargin(0),
      ),
      backgroundColor: lightPrimary,
      body: Padding(
        padding:
            const EdgeInsets.all(15.0).add(EdgeInsets.only(left: 5, right: 5)),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Log in',
                  style: TextStyle(
                    color: darkBG,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.asset('assets/images/Findr_logo.png',
                    height: 30.0, width: 30.0),
              ],
            ),
            YMargin(80),
            Text(
              'Phone number',
              style: TextStyle(
                  fontSize: 15, color: darkBG, fontWeight: FontWeight.w600),
            ),
            PhoneField(hintText: '(0) 7089175605', onChanged: (value) {}),
            YMargin(20),
            Text(
              '4-digit pin',
              style: TextStyle(
                  fontSize: 15, color: darkBG, fontWeight: FontWeight.w600),
            ),
            YMargin(10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: PinField(pinController: null),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Forgot pin',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            YMargin(20),
            Button(
              text: 'Log in',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => StudentDashboardScreen()));

              },
              height: 50,
            ),
            YMargin(30),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
                          }
                        },
                      style: TextStyle(
                          color: darkBG, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
