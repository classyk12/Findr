
import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//  @override
//  void initState() {
//    super.initState();
//
//  }

  Timer t;

  @override
  Widget build(BuildContext context) {
    t = Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/landing'));

    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
             Image.asset('assets/images/Findr2.png',height: 200.0, width: 200),
          ]
        ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    t.cancel();
  }
}
