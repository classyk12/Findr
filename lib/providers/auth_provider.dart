import 'package:findr/models/auth.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:findr/services/service_locator.dart';

class AuthProvider extends ChangeNotifier{

  AuthService _authService = locator<AuthService>();
 // FirebaseServices _otpService = locator<FirebaseServices>();
  BuildContext context;

  BaseResponse<LoginResponse> loginResponse = BaseResponse<LoginResponse>.completed();
  BaseResponse<UserData> registerResponse = BaseResponse<UserData>.completed();
  BaseResponse<bool> otpResponse =  BaseResponse<bool>.completed();

  Future<BaseResponse<LoginResponse>> login(LoginModel model) async{
    loginResponse = BaseResponse<LoginResponse>.loading(message: '');
    notifyListeners();

    loginResponse = await _authService.login(model);
    notifyListeners();

    return loginResponse;
  }


  Future<BaseResponse<UserData>> register(RegisterModel model) async{
    registerResponse = BaseResponse<UserData>.loading(message: '');
    notifyListeners();
  
    registerResponse = await _authService.register(model);
    notifyListeners();

    return registerResponse;
  }

  // Future<bool> otpAction (String phoneNumber ) async{
  //   otpResponse = BaseResponse<bool>.loading(message: '');
  //   notifyListeners();

  //   otpResponse = await _otpService.verifyPhoneNumber(phoneNumber, context);      
  //   notifyListeners();

  //   return otpResponse;
  // }


}