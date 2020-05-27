import 'package:findr/screens/Accounts/edit_profile.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
bool _isVerified = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title:InkWell(   
          onTap: (){
              Navigator.pop(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
              children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.0,
            ),
            Text('Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16.0,))
          ]),
        ),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0).add(EdgeInsets.only(right: 6)),
            child: Image.asset('assets/images/Findr_logo.png',
            height: 60, width: 60, ),
          )
        ],
      
      ),
      body: Container(          
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,20.0,0.0,10.0),
              child: Row(
               children: <Widget>[
                 ProfilePicture(onPressed: (){}, showCamera: true),
                 Column(
                   children:<Widget>[
                     Padding(
                       padding: const EdgeInsets.fromLTRB(15.0,8.0,0.0,3.0),
                       child: Text('Olushola Peters', style: TextStyle(
                          color: darkBG,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,)),
                     ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          
                          children:<Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Agent', style: TextStyle(color: darkBG, fontSize:15.0, fontWeight:FontWeight.w600),textDirection: TextDirection.ltr,),
                        ),
                        _isVerified ? Container(
                decoration:  BoxDecoration(
                  color: darkAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: lightPrimary, width: 2.5),
                ),
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.done, color: lightPrimary, size: 18),

              ) : Container(
                decoration:  BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: lightPrimary, width: 2.5),
                ),
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.schedule, color: lightPrimary, size: 18),
               
              ),
                          ]
                        )
                   ]
                 )
               ],
              ),
            ),
            // YMargin(30.0),

            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,20.0,5.0,10.0),
              child: Row(mainAxisSize: MainAxisSize.max,children: <Widget>[
               Icon(Icons.phone, color:Colors.grey),XMargin(10.0),
               Text('(+234)-903-566-1212', style: TextStyle(color: Colors.grey, fontSize:20.0, fontWeight:FontWeight.w300)),
               Spacer(),
               FlatButton(onPressed: (){}, child: Text('Hide', style: TextStyle(color:Colors.green, fontSize: 15.0),))
              ],),
            ),

                //  YMargin(5.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,5.0,0.0,10.0),
              child: Row(mainAxisSize: MainAxisSize.max,children: <Widget>[
               Icon(Icons.mail, color:Colors.grey),XMargin(10.0),
               Text('sholapeters@gmail.com', style: TextStyle(color: Colors.grey, fontSize:20.0, fontWeight:FontWeight.w300)),
           
              ],),
            ),

                //  YMargin(10.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,10.0,0.0,10.0),
              child: Row(mainAxisSize: MainAxisSize.max,children: <Widget>[
               Icon(Icons.assignment, color:Colors.grey),XMargin(10.0),
           _isVerified ?  Text('Not Verified', style: TextStyle(color: Colors.red, fontSize:16.0, fontWeight:FontWeight.w600)) :
              Text('Verified', style: TextStyle(color: Colors.green, fontSize:16.0, fontWeight:FontWeight.w600)),
           
              ],),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15.0),
              child: SizedBox(height: 1, child: Container(color: Colors.grey[600]),),


            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0,0.0,0.0,10.0),
              child: Container(
                color: Colors.green[100],
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(children: <Widget>[
                    XMargin(25.0),
                    Icon(Icons.edit, color: Colors.black), XMargin(10.0),
                    FlatButton(child: Text('Edit profile', style: TextStyle(color: Colors.black, fontSize:16.0, fontWeight:FontWeight.w600),
              ), onPressed: (){
                
                    Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen()));
              },)]
                  ),
                )
              ),
            ),


                //  YMargin(5.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,10.0,5.0,10.0),
              child: Row(mainAxisSize: MainAxisSize.max,children: <Widget>[
               Icon(Icons.share, color:Colors.black),XMargin(10.0),
               Text('Share', style: TextStyle(color: Colors.black, fontSize:20.0, fontWeight:FontWeight.w300)),
           
              ],),
            ),

   Padding(
              padding: const EdgeInsets.fromLTRB(30.0,15.0,5.0,10.0),
              child: Row(mainAxisSize: MainAxisSize.max,children: <Widget>[
               Icon(Icons.lock, color:Colors.black),XMargin(10.0),
               Text('Change pin', style: TextStyle(color: Colors.black, fontSize:20.0, fontWeight:FontWeight.w300)),
           
              ],),
            ),
            
            
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15.0),
              child: SizedBox(height: 1, child: Container(color: Colors.grey[500]),),


            ),
 
              Padding(
              padding: const EdgeInsets.fromLTRB(30.0,20.0,5.0,10.0),
              child: Row(mainAxisSize: MainAxisSize.max,children: <Widget>[
               Icon(Icons.settings_power, color:Colors.red),XMargin(10.0),
               Text('Sign out', style: TextStyle(color: Colors.red, fontSize:20.0, fontWeight:FontWeight.w300)),
           
              ],),
            ),
            


            ],
          
        
        )
          ),

    );
  }
}