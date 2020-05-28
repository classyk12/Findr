
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, '/landing'));
//        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingScreen())));


  }


//  Timer t;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
             Hero(
               tag: 'findr_logo',
                 child: Image.asset('assets/images/Findr2.png',height: 200.0, width: 200),),
          ]
        ),
    ));
  }

  @override
  void dispose() {
//    t.cancel();
    super.dispose();

  }
}
