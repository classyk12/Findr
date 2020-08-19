import 'dart:convert';
import 'dart:io';

import 'package:findr/models/agent.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/providers/agent_provider.dart';
import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/button.dart';
import 'package:findr/widgets/file_upload_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class AgentVerificationScreen extends StatefulWidget {
  @override
  _AgentVerificationScreenState createState() =>
      _AgentVerificationScreenState();
}

class _AgentVerificationScreenState extends State<AgentVerificationScreen> {
  Future<dynamic> file;
  String base64Image;
  String fileName;
  String filePath;
  final picker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.0,
            ),
            Text('Back',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0,
                ))
          ]),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0).add(EdgeInsets.only(left: 5, right: 5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ID verification',
              style: TextStyle(
                color: darkBG,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            YMargin(80),
            Text(
              'Submit your ID here(Government ID/Agent ID)',
              style: TextStyle(
                  color: darkBG, fontSize: 15.0, fontWeight: FontWeight.w500),
            ),
            YMargin(10),

            UploadButton(onPressed: () {
              displayDialog();
            }),          
            FutureBuilder(
                builder: (context, data) {
                  if (data.hasData) {
                    // setState(() {
                    base64Image =
                        base64Encode(File(data.data.path).readAsBytesSync());
                    fileName = 'upload.' + data.data.path.split(".").last;
                    filePath = data.data.path.split(".").last;
                    print(base64Image);
                    print(fileName);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              fileName ?? '',
                              style: TextStyle(fontSize: 15),
                            ),
                            IconButton(
                                icon: Icon(LineIcons.times,
                                    color: Colors.red, size: 25),
                                onPressed: () {
                                  setState(() {
                                    // base64Image = '';
                                    //fileName = '';
                                    // file = null;
                                  });
                                })
                          ]),
                    );
                  } else {
                    return Text('no image selected',
                        style: TextStyle(fontSize: 15));
                  }
                },
                future: file),


            //  Consumer<AuthProvider>(
            // builder: (ctx, provider, widget) => Button(text: 'Continue', onPressed: () async {





            YMargin(30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  ChangeNotifierProvider(
                     create: (context) => AgentProvider(),
                      child: Consumer<AgentProvider>(
              builder: (ctx, provider, widget) => Button(text: 'Upload',height: 50, width: 100 ,onPressed: () async {
                   if (base64Image == null || base64Image.isEmpty) {
                      final snackBar =
                       SnackBar(content: Text('upload image or press skip to continue without an ID'));
                      // Find the Scaffold in the widget tree and use it to show a SnackBar.
                      Scaffold.of(context).showSnackBar(snackBar);
                      return;
                    }
                    else{

                       showDialog(context: ctx,
                    builder: (ctx) => AlertDialog(
                      content: Container(child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SpinKitCircle(color: darkAccent),
                        ],
                      )),
                    ));

                     String full64 = 'data:image/$fileName;base64,' + base64Image;
                 // String full64 = 'data:image/jpeg;base64';
                  AgentUploadModel uploadModel = AgentUploadModel(full64);

                BaseResponse<UserInfo> response = await provider.uploadID(uploadModel);

                if(response.status == Status.COMPLETED){
                 // pref.setString("image", response.data.image);
                  print(response.message);   

                  //GET AGENT INFORMATION with agent provider
                   AgentProvider agentProvider = Provider.of<AgentProvider>(context, listen: false);
                    await agentProvider.getDashboard();
                    
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
                  
                  // _pageController.animateToPage(_currentPage + 1,
                  //     duration: Duration(milliseconds: 300),
                  //     curve: Curves.linearToEaseOut);              
                }
                
                 else{
                  Navigator.pop(context);
                  print(response.message);
                  // SnackBar snackbar =  SnackBar(content: response.message ?? Text('upload failed, try again'));
                  // snackbar.
                }
                    }
              }))
                // Button(
                //   text: "upload",
                //   height: 50,
                //   width: 100,
                //   onPressed: () {
                //     if (base64Image.isEmpty) {
                //       final snackBar =
                //           SnackBar(content: Text('upload image or press skip to continue without an ID'));

                //              // Find the Scaffold in the widget tree and use it to show a SnackBar.
                //             Scaffold.of(context).showSnackBar(snackBar);
                //       return;
                //     }
                //     else{

                //     }

                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //             StudentDashboardScreen()));
                //   },
                ),
                YMargin(20),
                Center(
                  child: Consumer<AgentProvider>(builder: (ctx, provider, widget) =>
                   FlatButton(
                    splashColor: lightAccent.withOpacity(0.2),
                    onPressed: () {

                       //GET USER INFORMATION with agent provider    
                        AgentProvider agentProvider = Provider.of<AgentProvider>(context, listen: false);
                        agentProvider.getDashboard();
 
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DashboardScreen()));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                   )
                  
                 
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  displayDialog() {
    //build widget to collect code from user
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Quick actions?',
                style: TextStyle(color: darkBG, fontSize: 20)),
            content: Text('Choose from the options below'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () async {
                    file = picker
                        .getImage(source: ImageSource.camera)
                        .whenComplete(() {
                      setState(() {
                        //  if(image != null){
                        // file = File(image.path);

                        //   }
                        //file = null;
                      });
                      //base64Image = base64Encode();
                      //fileName = file.path.split("/").last;
                      // print(base64Image);
                      // print(fileName);
                    });
                    // var image =  await picker.getImage(source: ImageSource.camera);
                    // print(image);
                  },
                  child: Text('use camera',
                      style: TextStyle(color: darkBG, fontSize: 20))),
              FlatButton(
                  onPressed: () async {
                    file = picker
                        .getImage(source: ImageSource.gallery)
                        .whenComplete(() {
                      setState(() {
                        //  if(image != null){
                        // file = File(image.path);

                        //   }
                        //file = null;
                      });
                      //base64Image = base64Encode();
                      //fileName = file.path.split("/").last;
                      // print(base64Image);
                      // print(fileName);
                    });
                    // var image =  await picker.getImage(source: ImageSource.camera);
                    // print(image);
                  },
                  child: Text('choose from gallery',
                      style: TextStyle(color: darkBG, fontSize: 20)))
            ],
          );
        });
  }
}
