import 'package:flutter/material.dart';
import '../../utils/margin.dart';
import '../../widgets/button.dart';




class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(   
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SafeArea(
                          child: Row(children: <Widget>[
                  Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.0,),
                  Text('Back', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 20.0, decoration: TextDecoration.none))
                ]),
              ),
            ),
            YMargin(50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,5.0,70.0,10.0),
                    child: Text('Getting Started', style: TextStyle(color: Colors.grey, fontSize: 30.0, fontWeight: FontWeight.w900, 
                    decoration: TextDecoration.none)),
                  ),
                  Image.asset('assets/images/Findr_logo.png',height: 40.0, width: 40),
                ],),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Choose from the following options below',style: TextStyle(color:Colors.grey, 
                  decoration: TextDecoration.none, fontSize: 12.0),),
                ),
              ],
            ),
          YMargin(80),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Register as',style: TextStyle(color:Colors.grey, 
                    decoration: TextDecoration.none, fontSize: 20.0),),
          ),
          YMargin(30),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Button(onPressed: (){}, text: 'AGENT', height: 70.0),
          ),
         
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Button(onPressed: (){}, text: 'STUDENT', height: 70.0),
          )
          ],
        ),
      ),
    );
  }
}

