import 'dart:convert';
import 'dart:io';
import 'package:findr/models/agent.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/models/user.dart';
import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/screens/Accounts/agent_profile.dart';
import 'package:findr/screens/Accounts/student_profile.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:findr/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
 AgentProvider agentProvider;
HouseProvider houseProvider;
TextEditingController fullNameController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
//TextEditingController phoneNumberController = new TextEditingController();

Future<dynamic> file;
  String base64Image;
  String fileName;
  final picker = ImagePicker();

 @override
  void initState() {
   agentProvider = Provider.of<AgentProvider>(context, listen: false);
   if(agentProvider.agentDashboardResponse.data.userType.toLowerCase() == 'agent'){
      emailController.text = agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.email ;
    fullNameController.text = agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.fullName;
   }
   else{
      emailController.text = agentProvider?.agentDashboardResponse?.data?.studentData?.email ;
    fullNameController.text = agentProvider?.agentDashboardResponse?.data?.studentData?.fullName;
   }
    // getProfile();   
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
   houseProvider = Provider.of<HouseProvider>(context, listen: false);                                                                                                                                                                                
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

                    Consumer<AgentProvider>(builder: (ctx, provider, widget) =>  FlatButton(
                                padding: EdgeInsets.only(left: 30),
                          onPressed: () async {
                            if(emailController.text.isEmpty || fullNameController.text.isEmpty){
                              //display snackbar/alert
                              print('fields cannot be empty');
                              return;
                            }
                            else{
                              //loader
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


                  UserUpdateModel uploadModel = UserUpdateModel(image: base64Image.isEmpty ? null : base64Image,
                  fullName: fullNameController.text);

                BaseResponse<UserInfo> response = await provider.updateProfile(uploadModel);

                if(response.status == Status.COMPLETED){              
                  print(response.message);
                   provider.getDashboard();
                  if(agentProvider?.agentDashboardResponse?.data?.userType?.toLowerCase() == 'agent'){
                      Navigator.pop(context);
                    //  Navigator.pop(context);
                     // Navigator.push(context, MaterialPageRoute(builder: (_)=>AgentVerificationScreen()));
                  }
                  else{
                    //NAVIGATE TO DASHBOARD and get USER INFORMATION

                 // provider.getDashboard(); //get user logged in information
                
                //  HouseProvider houseProvider = Provider.of<HouseProvider>(context, listen: false);
                  houseProvider.getHouses(); //get hpuses for student
                   Navigator.pop(context);

                   //  Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
                  }
                  
                }
                
                 else{
                  Navigator.pop(context);
                  print(response.message);
                  // SnackBar snackbar =  SnackBar(content: response.message ?? Text('upload failed, try again'));
                  // snackbar.
                }
                  }
                    },
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.green, fontSize: 16.0),
                          )),
                    )
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
                  base64Image = 'data:image/$fileName;base64,' + base64Encode(File(data.data.path).readAsBytesSync());
                   fileName = data.data.path.split(".").last;
                   print(base64Image);
                  // Navigator.pop(context);
                   return Image.file(File(data.data.path), fit: BoxFit.fitWidth, width: 120);
                }
                else{
                   if(agentProvider?.agentDashboardResponse?.data?.userType?.toLowerCase() == 'agent'){
                    return Image.network(
                      agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.image ?? 'https://via.placeholder.com/150', fit: BoxFit.fitWidth, width: 120);
                    }

                    else{
                      return Image.network(agentProvider?.agentDashboardResponse?.data?.studentData?.image ??  'https://via.placeholder.com/150');
                      
                    }

                  
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
    showDialog(context: context,barrierDismissible: true, builder: (context){
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
                     setState(()  {

                      });
                   
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

                  if(agentProvider?.agentDashboardResponse?.data?.agentData?.agentdetails?.userType?.toLowerCase() == "agent"){
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


