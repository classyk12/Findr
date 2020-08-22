
import 'dart:convert';
import 'dart:io';
import 'package:findr/models/agent.dart';
import 'package:findr/models/auth.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/models/user.dart';
import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/auth_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/screens/agent_verification_screen.dart';
import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/button.dart';
import 'package:findr/widgets/phone_field.dart';
import 'package:findr/widgets/pin_field.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:findr/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

 // FirebaseServices _services = locator<FirebaseServices>();

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Future<dynamic> file;
  String base64Image;
  String fileName;
  final picker = ImagePicker();
  



  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 11.0 : 8.0,
      width: isActive ? 11.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? darkAccent : lightAccent.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  String userType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: lightPrimary,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: _currentPage > 0
            ? InkWell(
                onTap: () {
                  setState(() {
                    _pageController.animateToPage(_currentPage - 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linearToEaseOut);
                  });
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
              )
            : InkWell(
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0).add(EdgeInsets.only(right: 10)),
            child: Text('${_currentPage + 1}/${_buildPageIndicator().length}',
                style: TextStyle(fontSize: 16)),
          )
        ],
      ),


      body: Stack(
//              fit: StackFit.expand,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
//              YMargin(30),
          Container(
            color: lightPrimary,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[            
                _onBoarding1(),
                 _signup(),  
                _profile(context),           
                                
                
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
          ),

//              YMargin(30),
        ],
      ),
    );
  }

  Widget _onBoarding1() {
    return Padding(
      padding:
          const EdgeInsets.all(15.0).add(EdgeInsets.only(left: 5, right: 5)),
      child: ListView(
        shrinkWrap: true,
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Getting Started',
                    style: TextStyle(
                      color: darkBG,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image.asset('assets/images/Findr_logo.png',
                      height: 30.0, width: 30.0),
                ],
              ),
              YMargin(10),
              Text(
                'Choose from the following options below',
                style: TextStyle(color: darkBG, fontSize: 12.0),
              ),
            ],
          ),
          YMargin(80),
          Text(
            'Register as',
            style: TextStyle(color: darkBG, fontSize: 16.0),
          ),
          YMargin(40),
          Button(
              onPressed: () {
                setState(() {
                  userType = 'Agent';
                });
                _pageController.animateToPage(_currentPage + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut);
              },
              text: 'an agent',
              height: 50.0),
          YMargin(20),
          Button(
              onPressed: () {
                setState(() {
                  userType = 'Student';
                });
                _pageController.animateToPage(_currentPage + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              text: 'a student',
              height: 50.0),
        ],
      ),
    );
  }


  Widget _signup() {
    return Padding(
      padding: const EdgeInsets.all(15.0).add(
        EdgeInsets.only(left: 5, right: 5),
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Sign up',
                style: TextStyle(
                  color: darkBG,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset('assets/images/Findr_logo.png',
                  height: 30.0, width: 30.0),
            ],
          ),
          YMargin(80),
          Text(
            'Full name',
            style: TextStyle(
                fontSize: 15,
                color: darkBG,
                fontWeight: FontWeight.w600),
          ),
          TextInput(controller: fullNameController, hintText: 'Adekunle Ciroma',),
          YMargin(20),
          Text(
            'Phone number',
            style: TextStyle(
                fontSize: 15,
                color: darkBG,
                fontWeight: FontWeight.w600),
          ),

          PhoneField(hintText: '(0) 7089175605', onChanged: (value){
            phoneNumberController.text = value;
          }, controller:  phoneNumberController ,),


          YMargin(20),
          Text(
            'E-mail',
            style: TextStyle(
                fontSize: 15,
                color: darkBG,
                fontWeight: FontWeight.w600),
          ),
          TextInput(controller: emailController, hintText: 'Adekunle_ciroma@zmail.ng',),
          YMargin(20),
          Text(
            'Four digit pin',
            style: TextStyle(
                fontSize: 15,
                color: darkBG,
                fontWeight: FontWeight.w600),
          ),
          YMargin(10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: PinField(pinController: pinController),
          ),
          YMargin(30),
          Consumer<AuthProvider>(
            builder: (ctx, provider, widget) => Button(text: 'Continue', onPressed: () async {

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

              RegisterModel registerModel = RegisterModel(phoneNumber: phoneNumberController.text, email: emailController.text,
              password: pinController.text, fullName: fullNameController.text, userType: userType);

              BaseResponse<UserData> response = await provider.register(registerModel);

              if(response.status == Status.COMPLETED){
                print(response.message);
                //store user information in shared preference
                  SharedPreferences pref =  await SharedPreferences.getInstance();


                pref.setString('fullName', response.data.fullName);
                pref.setString('token', response.data.accessToken);
                pref.setInt('id', response.data.id);

                print(pref.get('token'));
                
                Navigator.pop(context);
                _pageController.animateToPage(_currentPage + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut);

                    //attempt to send the otp to the user device
                  //bool res = await _services.verifyPhoneNumber(phoneNumberController.text, context);
                  //print(res);
              }
              
              
              else{
                Navigator.pop(context);
                print(response.message);
              }


            }, height: 50,),
          ),

          YMargin(10),
          FlatButton(
            splashColor: lightAccent.withOpacity(0.2),
            onPressed: (){
              _pageController.animateToPage(_currentPage - 1, duration: Duration(milliseconds: 300),
                  curve: Curves.linearToEaseOut);
            },
            child: Text(
              'Back',
              style: TextStyle(
                color: darkBG,
                fontSize: 16.0,
              ),
            ),
          ),

        ],
      ),
    );
  }


  Widget _profile(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(15.0).add(
        EdgeInsets.only(left: 5, right: 5),
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Create profile',
                style: TextStyle(
                  color: darkBG,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset('assets/images/Findr_logo.png',
                  height: 30.0, width: 30.0),
            ],
          ),
          YMargin(80),

          Center(child: ProfilePicture(
            child: FutureBuilder(builder: (context,data){
              if(data.hasData){
                // setState(() {
                base64Image = base64Encode(File(data.data.path).readAsBytesSync());
                 fileName = data.data.path.split(".").last;
                // print(fileName);
               // print(fileName);
               
                
               return Image.file(File(data.data.path), fit: BoxFit.fitWidth, width: 120);
              }
              else{
                return Text('no image selected',style:TextStyle(fontSize: 12));
              }
              
            },
            future: file
            ),

            onPressed: (){
            displayDialog();

          }, showCamera: true)),
//          YMargin(20),
//          Text(
//            'Full name',
//            style: TextStyle(
//                fontSize: 15,
//                color: darkBG,
//                fontWeight: FontWeight.w600),
//          ),
//          TextInput(controller: null, hintText: 'Adekunle Ciroma',),
          YMargin(30),
          
           Consumer<AgentProvider>(
              builder: (ctx, provider, widget) => Button(text: 'Create Profile', onPressed: () async {
                //upload image 
                if(base64Image == null || base64Image.isEmpty){

                  if(userType.toLowerCase() == "agent"){
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>AgentVerificationScreen()));
                  }
                 else{
                    
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
                 }
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

                    SharedPreferences pref = await SharedPreferences.getInstance();

                  var fullName = pref.getString("fullName");
                  String full64 = 'data:image/$fileName;base64,' + base64Image;
                 // String full64 = 'data:image/jpeg;base64';
                  UserUpdateModel uploadModel = UserUpdateModel(image: full64,
                  fullName: fullName);

                BaseResponse<UserInfo> response = await provider.updateProfile(uploadModel);

                if(response.status == Status.COMPLETED){
                  pref.setString("image", response.data.image);
                  print(response.message);
                  if(userType.toLowerCase() == 'agent'){

                      Navigator.push(context, MaterialPageRoute(builder: (_)=>AgentVerificationScreen()));
                  }
                  else{
                    //NAVIGATE TO DASHBOARD and get USER INFORMATION

                  provider.getDashboard(); //get user logged in information
                
                  HouseProvider houseProvider = Provider.of<HouseProvider>(context, listen: false);
                  houseProvider.getHouses(); //get hpuses for student


                     Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
                  }
                  
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
              }, height: 50,),
            ),


          YMargin(10),

            Consumer<AgentProvider>(builder: (ctx, provider, widget) =>  FlatButton(
              splashColor: lightAccent.withOpacity(0.2),
              onPressed: (){
                if(userType.toLowerCase() == 'agent'){
               
                Navigator.push(context, MaterialPageRoute(builder: (_)=>AgentVerificationScreen()));
                }
                else{      
                  //NAVIGATE TO DASHBOARD and get USER INFORMATION

                  provider.getDashboard(); //get user logged in information
                
                  HouseProvider houseProvider = Provider.of<HouseProvider>(context, listen: false);
                  houseProvider.getHouses(); //get hpuses for student



                Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
                }

//              _pageController.animateToPage(_currentPage - 1, duration: Duration(milliseconds: 300),
//                  curve: Curves.linearToEaseOut);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: darkBG,
                  fontSize: 16.0,
                ),
              ),
            ), 
            
            )
            
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
                     setState(()  {                 
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
                 child: Text('use camera', style: TextStyle(color: darkBG, fontSize: 20))),

                FlatButton(onPressed: () async{
                  file = picker.getImage(source: ImageSource.gallery).whenComplete(() {
                     setState(()  {                 
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
                 
                }, child: Text('choose from gallery',style: TextStyle(color: darkBG, fontSize: 20)))
             ],

             );

    });
    }




}
