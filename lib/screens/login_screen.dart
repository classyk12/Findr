
import 'package:findr/models/auth.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/auth_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/screens/Onboarding/onboarding_screen.dart';
import 'package:findr/screens/student_dashboard.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/button.dart';
import 'package:findr/widgets/phone_field.dart';
import 'package:findr/widgets/pin_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: lightPrimary,
        centerTitle: false,
        title: Navigator.canPop(context)
            ? InkWell(
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
              )
            : XMargin(0),
      ),
      backgroundColor: lightPrimary,
      body: Padding(
        padding:
            const EdgeInsets.all(15.0).add(EdgeInsets.only(left: 5, right: 5)),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Log in',
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
                  fontSize: 15, color: darkBG, fontWeight: FontWeight.w600),
            ),
            PhoneField(hintText: '(0) 7089175605', onChanged: (value) {
              phoneController.text = value;
            }, controller: phoneController,),
            YMargin(20),
            Text(
              '4-digit pin',
              style: TextStyle(
                  fontSize: 15, color: darkBG, fontWeight: FontWeight.w600),
            ),
            YMargin(10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: PinField(pinController: pinController),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Forgot pin',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            YMargin(20),

            Consumer<AuthProvider>(
              builder: (ctx, provider, widget) => Button(
                text: 'Log in',
                onPressed: () async {

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
                  LoginModel loginModel = LoginModel(phoneNumber: phoneController.text.trim(), password: pinController.text.trim());
                  BaseResponse<LoginResponse> response = await provider.login(loginModel);

                  if(response.status == Status.COMPLETED && (response.data?.accessToken ?? '').isNotEmpty){
//                    print(response.data.accessToken);

                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setString('token', response.data.accessToken);

                  
                    AgentProvider agentProvider = Provider.of<AgentProvider>(context, listen: false);
                    agentProvider.getProfileData(pref.getInt("id"));

                  HouseProvider houseProvider = Provider.of<HouseProvider>(context, listen: false);
                    houseProvider.getHouses();

                    Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardScreen()));
                  }
                  else{
                    Navigator.pop(context);
                    print(response.message);
                  }



                },
                height: 50,
              ),
            ),

            
            YMargin(30),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Dont have an account? ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
                          }
                        },
                      style: TextStyle(
                          color: darkBG, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
