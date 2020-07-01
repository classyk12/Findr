import 'dart:convert';

import 'package:findr/models/auth.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/services/api_helper.dart';
//import 'package:http/http.dart' as _http;

class AuthService {
  Map<String, String> headers = {
    'Content-Type': 'application/json'
  };
  ApiHelper _apiHelper = ApiHelper();

//  AuthService(){
//    endpoint = ""; //endpoint here
//  }

  Future<BaseResponse<UserData>> register(RegisterModel model) async {
    return await _apiHelper
        .post(endpoint: 'register', body: model.toMap(), header: headers)
        .then((result) {
      if (result.statusCode == 201) {
        //testing to see the content of api response
        final jsonData = json.decode(result.body)['data'];
        final userdata = UserData.jsonConvert(jsonData);
        print(userdata);
        return BaseResponse<UserData>.completed(
            message: 'registration success', data: userdata);
      }

      //todo: display api error message directly to user
      return BaseResponse<UserData>.error(
          message: "something went wrong: ${result.body}");

      //catch the error
    }).catchError((e) => BaseResponse<UserData>.error(message: e.toString()));
  }

  Future<BaseResponse<LoginResponse>> login(LoginModel model) async {
    return await _apiHelper
        .post(
            endpoint: 'login',
            body: model.toMap(),
            header: headers)
        .then((result) {
      if (result.statusCode == 200) {
        final jsonData = json.decode(result.body);
        final response = LoginResponse.jsonConvert(jsonData['data']);
//        print(response);
        //response value will be stored in a shared preference or provider ......

        return BaseResponse<LoginResponse>.completed(
            message: "login success", data: response);
      }

      //todo: display api error message directly to user
      return BaseResponse<LoginResponse>.completed(
          message: "something went wrong", data: jsonDecode(result.body));

      //catch the error
    }).catchError((e) =>
            BaseResponse<LoginResponse>.error(message: 'An error occurred! ${e.toString()}'));
  }
}
