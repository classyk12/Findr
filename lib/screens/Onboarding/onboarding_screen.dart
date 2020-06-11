import 'package:findr/models/auth.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/providers/auth_provider.dart';
import 'package:findr/screens/Accounts/agent_profile.dart';
import 'package:findr/screens/agent_verification_screen.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/button.dart';
import 'package:findr/widgets/phone_field.dart';
import 'package:findr/widgets/pin_field.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:findr/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;


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
                _profile(),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AgentProfileScreen()));
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
            'Phone number',
            style: TextStyle(
                fontSize: 15,
                color: darkBG,
                fontWeight: FontWeight.w600),
          ),
          PhoneField(hintText: '(0) 7089175605', onChanged: (value){
            phoneNumberController.text = value;
          }, controller:  phoneNumberController,),
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
//          Container(
//            decoration: BoxDecoration(
//              boxShadow: [
//                new BoxShadow(
//                  offset: Offset(0, 8),
//                  spreadRadius: -10,
//                  color: darkBG.withOpacity(0.3),
//                  blurRadius: 24,
//                ),
//              ],
//            ),
//            child: Material(
//              child: TextFormField(
//                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: darkBG, letterSpacing: 10.0),
////          cursorColor: Colors.white,
//                keyboardType: TextInputType.number,
//                controller: null,
//                validator: (value){
//                  return null;
//                },
//
//                inputFormatters: [
//                  limiter.LengthLimitingTextInputFormatter(4)
//                ],
//
//                decoration: InputDecoration(
//
//                  hintText: '****',
//                  hintStyle: TextStyle(fontSize: 16),
//                  contentPadding: EdgeInsets.all(10.0),
//                  border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(20.0),
//                    borderSide: BorderSide(color: Colors.transparent,),
//                  ),
//                  enabledBorder: OutlineInputBorder(
//                    borderSide: BorderSide(color: Colors.transparent,),
//                    borderRadius: BorderRadius.circular(20.0),
//                  ),
//
//                  focusedBorder: OutlineInputBorder(
//                    borderSide: BorderSide(color: Colors.transparent,),
//                    borderRadius: BorderRadius.circular(20.0),
//                  ),
//
//                ),
//              ),
//            ),
//          ),
          YMargin(30),
          Consumer<AuthProvider>(
            builder: (ctx, provider, widget) => Button(text: 'Continue', onPressed: () async {

              showDialog(context: ctx,
                  builder: (ctx) => AlertDialog(
                    content: SpinKitCircle(color: darkAccent),
                  ));

              RegisterModel registerModel = RegisterModel(phoneNumber: phoneNumberController.text, email: emailController.text,
              password: pinController.text, fullName: 'Sample name', userType: userType);

              BaseResponse<UserData> response = await provider.register(registerModel);

              if(response.status == Status.COMPLETED){
                print(response.message);
                Navigator.pop(context);
                _pageController.animateToPage(_currentPage + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut);
              }else{
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

  Widget _profile(){
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
          Center(child: ProfilePicture(onPressed: (){}, showCamera: true,),),
          YMargin(20),
          Text(
            'Full name',
            style: TextStyle(
                fontSize: 15,
                color: darkBG,
                fontWeight: FontWeight.w600),
          ),
          TextInput(controller: null, hintText: 'Adekunle Ciroma',),
          YMargin(30),
          Consumer<AuthProvider>(
            builder: (ctx, provider, widget) => Button(text: 'Create Profile', onPressed: () async {
              //show loading dialog


              Navigator.push(context, MaterialPageRoute(builder: (_)=>AgentVerificationPage()));
            }, height: 50,),
          ),
          YMargin(10),
          FlatButton(
            splashColor: lightAccent.withOpacity(0.2),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AgentVerificationPage()));

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



        ],
      ),
    );
  }

 // TextEditingController controller = TextEditingController();
//   Widget _onBoarding2() {
//     return Container(
//       color: Color(0xffe7e7e7),
//       child: Column(
//         children: <Widget>[
// //        PinField(pinController: null),
//           YMargin(10),
// //        ProfilePicture(onPressed: (){},showCamera: true,),

//           HouseItem(),

//           YMargin(10),
//           Container(
//               padding: EdgeInsets.all(15),
//               color: darkAccent,
//               child: SearchField(searchController: controller)),
//         ],
//       ),
//     );
//   }
}
