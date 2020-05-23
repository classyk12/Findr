import 'package:flutter/material.dart';

import '../../widgets/button.dart';




class LandingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
         child: Expanded(
          // heightFactor: 500,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[  
               Image.asset('assets/images/Findr2.png',height: 200.0, width: 200),
               SizedBox(height:100),
               Column(
                 children: <Widget>[
             
                     Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Button(text: 'Get Started', onPressed: (){
                         Navigator.pushNamed(context, '/agent-student');
                       },height: 70,),
                     ),
                 
                 
                   Text('Sign in',style: TextStyle(color: Colors.black,decoration:TextDecoration.none, fontSize: 20.0),), 
                 ],    
               ),
               
           
             
                   Text('Terms and conditions',style: TextStyle(color: Colors.grey,decoration:TextDecoration.none, fontSize: 20.0),),
                   
            
            ])
      // ),
    ));
  }
}

