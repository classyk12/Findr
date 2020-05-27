import 'package:findr/screens/Accounts/user_profile.dart';
import 'package:findr/screens/onboarding/landing_page.dart';
import 'package:findr/screens/splash_screen.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
//      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        // When navigating to the "/landing" route, build the landing_page widget.
//        '/login': (context) => LoginScreen(),
        '/landing': (context) => LandingScreen(),
        '/user-profile': (context) => UserProfileScreen()
      },
    );
  }
}
