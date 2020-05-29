import 'package:findr/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             Lottie.asset('assets/lottie/emptyHouse.json', height: 300),
             Text('Nothing Found Here!', style: TextStyle(color:Colors.green[900], fontSize: 20)),
             YMargin(10),
             RaisedButton(onPressed: (){
                Navigator.of(context).pop();
             }, child: Text('Go Back', style: TextStyle(color:Colors.white, fontSize: 15),),)
            ],
          ),
        );
            
  }
}
