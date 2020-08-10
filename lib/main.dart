import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/auth_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/screens/Accounts/agent_profile.dart';
import 'package:findr/screens/Onboarding/landing_page.dart';
import 'package:findr/screens/login_screen.dart';
import 'package:findr/screens/splash_screen.dart';
import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:findr/services/service_locator.dart';


void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_)=> AuthProvider()),
        ChangeNotifierProvider<HouseProvider>(create: (_)=> HouseProvider()),
        ChangeNotifierProvider<AgentProvider>(create: (_)=> AgentProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Findr',
        theme: lightTheme,
//      darkTheme: darkTheme,
        initialRoute: '/',
        routes: {         
          '/': (context) => SplashScreen(),
          // When navigating to the "/landing" route, build the landing_page widget.
          '/login': (context) => LoginScreen(),
          '/landing': (context) => LandingScreen(),
          '/user-profile': (context) => AgentProfileScreen(),
          '/dashboard': (context) => DashboardScreen()
        },
      ),
    );
  }
}
