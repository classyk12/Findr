
import 'package:findr/utils/margin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _smsVerificationCode = '';
  final TextEditingController _codeController = new TextEditingController();
   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    Future<bool> verifyPhoneNumber(String phoneNumber, BuildContext context) async {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber, 
        timeout: Duration(seconds: 5),
        verificationCompleted: (AuthCredential credential) => _verificationComplete(credential, context), 
        verificationFailed: (authException) => _verificationFailed(authException, context),
        codeSent: (verificationId, [code]) => _smsCodeSent(verificationId,context, code),
        codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId));
    }

    //this method is called only when automatic verification of otp code is done
     _verificationComplete (AuthCredential credential, BuildContext context) async{
      _auth.signInWithCredential(credential).then((authResult) {
        //dismss dialog box from code sent
        Navigator.of(context).pop();
        print('verified automatically');
     // final snackBar = SnackBar(content: Text("Awesome!...that went well!"));
     // Scaffold.of(context).showSnackBar(snackBar);
      //navigate or show the appropraite widget or screen
      });
  }

  //this method is called for the manual input of verification code
  _smsCodeSent(String verificationId, BuildContext context,[int forceResendingToken]) {
   //this is not proper.. but make we run am like that..

    //build widget to collect code from user
    showDialog(context: context,barrierDismissible: false, builder: (context){
      return AlertDialog(
        title: Text("Please enter the code you recieved"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             TextField(controller: _codeController, keyboardType: TextInputType.number),
            YMargin(20),
             FlatButton(onPressed: (){
                final code = _codeController.text.trim();
            AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);
            if(credential != null){
              print('verified');
              Navigator.of(context).pop();
              // final snackBar = SnackBar(content: Text("Awesome!...that went well!"));
               // Scaffold.of(context).showSnackBar(snackBar);
            }
            else{
              print('error occured');
             // final snackBar = SnackBar(content: Text("An Error occured, try again"), backgroundColor: Colors.red,);
              // Scaffold.of(context).showSnackBar(snackBar);
            }  
             }, child: Text("Verify Code"))
          ]
        ),
      );
    });
    
  }

 //this method is called when user provide wrong number or wrong code or verifiction failed generally
  _verificationFailed(AuthException authException, BuildContext context) {
    print('error');
   // final snackBar = SnackBar(backgroundColor: Colors.red,content: Text("Ooops!... " + authException.message.toString(), style: TextStyle(color: Colors.white)));
    //Scaffold.of(context).showSnackBar(snackBar);
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
    print(_smsVerificationCode);
  }
}