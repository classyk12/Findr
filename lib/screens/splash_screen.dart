
import 'dart:async';
import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),
    
    //check if user is currently logged in
    () async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      print(pref.containsKey("token"));
      //print(pref.containsKey("id"));

      if(pref.containsKey("token")){
        //print(pref.getString(${pref.getString("key")}));
        AgentProvider agentProvider = Provider.of<AgentProvider>(context, listen: false);
        agentProvider.getDashboard();
        

        HouseProvider houseProvider = Provider.of<HouseProvider>(context, listen: false);
        houseProvider.getHouses();

          Navigator.pushReplacementNamed(context, '/dashboard');    
      }    

      else{
        Navigator.pushReplacementNamed(context, '/landing');
      }
    }

      

    

    );}
    
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
                 child: Image.asset('assets/images/Findr2.png',height: 200.0, width: 200)),
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