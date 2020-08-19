import 'dart:convert';
import 'dart:io';
import 'package:findr/providers/agent_provider.dart';
import 'package:findr/screens/Accounts/agent_profile.dart';
import 'package:findr/screens/Accounts/student_profile.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:findr/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
 AgentProvider agentProvider;
TextEditingController fullNameController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
//TextEditingController phoneNumberController = new TextEditingController();

Future<dynamic> file;
  String base64Image;
  String fileName;
  final picker = ImagePicker();

 @override
  void initState() {
   agentProvider = Provider.of<AgentProvider>(context);
    emailController.text = agentProvider?.agentDashboardResponse?.data?.agentdetails?.email;
    fullNameController.text = agentProvider?.agentDashboardResponse?.data?.agentdetails?.fullName;
    // getProfile();   
    super.initState();
  }

    // void getProfile() {
    //   emailController.text = agentProvider?.agentDashboardResponse?.data?.agentdetails?.email;
    //   fullNameController.text = agentProvider?.agentDashboardResponse?.data?.agentdetails?.fullName;

    // }
  

  @override
  Widget build(BuildContext context) {
  // agentProvider = Provider.of<AgentProvider>(context);
    //emailController.text = agentProvider?.agentDashboardResponse?.data?.agentdetails?.email;
     //fullNameController.text = agentProvider?.agentDashboardResponse?.data?.agentdetails?.fullName;
                                                                                                                                                                                   
    return Scaffold(
        backgroundColor: lightPrimary,
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SingleChildScrollView(
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[

                Row(
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
                          fontSize: 16.0,
                        )),
                  ],
                ),

//            Spacer(),
                Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 20.0),
                ),
                    FlatButton(
                      padding: EdgeInsets.only(left: 30),
                        onPressed: () {
                          print(emailController.text);
                           print(fullNameController.text);

                            print(agentProvider?.agentDashboardResponse?.data?.agentdetails?.fullName);
                           print(agentProvider?.agentDashboardResponse?.data?.agentdetails?.email);
                           
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.green, fontSize: 16.0),
                        ))
              ]),
            ),
          ),

        ),
        body: Column(

//            shrinkWrap: true,
        mainAxisSize: MainAxisSize.max,
          children: <Widget>[
        Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.22,
            child: Center(
                child: ProfilePicture(
                  child: FutureBuilder(builder: (context,data){
                if(data.hasData){
                  // setState(() {
                  base64Image = base64Encode(File(data.data.path).readAsBytesSync());
                   fileName = data.data.path.split(".").last;
                 return Image.file(File(data.data.path), fit: BoxFit.fitWidth, width: 120);
                }
                else{
                  return Image.network(agentProvider?.agentDashboardResponse?.data?.agentdetails?.image, 
                   fit: BoxFit.fitWidth, width: 120);
                  //return Text('no image selected',style:TextStyle(fontSize: 12));
                }
                
              },
              future: file
              ),
                  onPressed: () {
                 displayDialog();
                }, showCamera: true, 
                ))),



        YMargin(20.0),
      
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:15.0, right: 15.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Full Name',
                    style: TextStyle(
                        fontSize: 15,
                        color: darkBG,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                TextInput(controller: fullNameController),
                YMargin(30),

              
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'E-mail',
                    style: TextStyle(
                        fontSize: 15,
                        color: darkBG,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                TextInput(controller: emailController),

              //  YMargin(30),
                // Padding(
                //   padding: const EdgeInsets.all(4.0),
                //   child: Text(
                //     'Phone Number',
                //     style: TextStyle(
                //         fontSize: 15,
                //         color: darkBG,
                //         fontWeight: FontWeight.w600),
                //   ),
                // ),
                // PhoneField(hintText: 'Phone number', onChanged: null,
                //  controller: TextEditingController(text: agentProvider?.agentDashboardResponse?.data?.agentdetails?.phoneNumber)),
                YMargin(30),
                Center(
                    child: FlatButton(
                  child: Text('Cancel',
                      style: TextStyle(color: Colors.red, fontSize: 16)),
                  onPressed: () {
                    // //check if the values have last changed before cancelling
                    //    if(agentProvider?.agentDashboardResponse?.data?.agentdetails?.fullName!= fullNameController.text ||
                    //     agentProvider?.agentDashboardResponse?.data?.agentdetails?.email != emailController.text || base64Image.isNotEmpty){
                    //       showConfirmDialog();
                    //       //display alert
                    //     // return;
                    //    }
                       
                       Navigator.pop(context);
                       // Navigator.pop(context, MaterialPageRoute(builder: (_)=> AgentProfileScreen()));
                  },
                ))
              ],
            ),
          ),
        ),
          ],
        ),
      );
  }

     displayDialog(){
    //build widget to collect code from user
    showDialog(context: context,barrierDismissible: false, builder: (context){
       return AlertDialog(
              title: Text('Quick actions?', style: TextStyle(color: darkBG, fontSize:20)),
              content: Text('Choose from the options below'),
              actions: <Widget>[
                FlatButton(onPressed: () async{
                  file = picker.getImage(source: ImageSource.camera).whenComplete(() {
                     setState(()  {  });
                   
                  });
               
                },
                 child: Text('use camera', style: TextStyle(color: darkBG, fontSize: 20))),

                FlatButton(onPressed: () async{
                  file = picker.getImage(source: ImageSource.gallery).whenComplete(() {
                     setState(()  { });
                   
                  });
              
                }, child: Text('choose from gallery',style: TextStyle(color: darkBG, fontSize: 20)))
             ],

             );

    });
    }

    showConfirmDialog(){
    //build widget to collect code from user
    showDialog(context: context,barrierDismissible: true, builder: (context){
       return AlertDialog(
              title: Text('Quick actions?', style: TextStyle(color: darkBG, fontSize:20)),
              content: Text('One or more fields have changed, proceed to cancel?'),
              actions: <Widget>[
                FlatButton(onPressed: () async{

                  if(agentProvider?.agentDashboardResponse?.data?.agentdetails?.userType?.toLowerCase() == "agent"){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AgentProfileScreen()));
                  }
                  else{
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> StudentProfileScreen()));
                  }
                  //Navigator.pop(context);
                  
                },
                 child: Text('cancel', style: TextStyle(color: darkBG, fontSize: 20))),

                FlatButton(onPressed: () async{
                 return;
                }, child: Text('continue editing',style: TextStyle(color: darkBG, fontSize: 20)))
             ],

             );

    });
    }
}


