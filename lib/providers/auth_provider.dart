import 'package:findr/models/auth.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:findr/services/service_locator.dart';

class AuthProvider extends ChangeNotifier{

  AuthService _authService = locator<AuthService>();

  BaseResponse<LoginResponse> loginResponse = BaseResponse<LoginResponse>.completed();
  BaseResponse<UserData> registerResponse = BaseResponse<UserData>.completed();

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



}