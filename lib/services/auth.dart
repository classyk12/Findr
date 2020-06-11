import 'dart:convert';

import 'package:findr/models/auth.dart';
import 'package:findr/models/base_response.dart';
import 'package:http/http.dart' as _http;


class AuthService{
  static const headers = {'Content- Type' : 'application/json'};
  String endpoint;

  AuthService(){
    endpoint = ""; //endpoint here
  }

  Future<BaseResponse<UserData>> register(RegisterModel model) async {
      return await _http.post(endpoint,body: json.encode(model.jsonConvert()), headers: headers).then((result){
        if(result.statusCode == 201){

          //testing to see the content of api response      
        final jsonData = json.decode(result.body);
        final userdata = UserData.jsonConvert(jsonData);
         print(userdata);
        return BaseResponse<UserData>(status: true, message: 'registration success', data: userdata);
        }

        //todo: display api error message directly to user
        return BaseResponse(status: false, message:"something went wrong", data:null);

        //catch the error   
       }).catchError((_) =>
            BaseResponse(status: true, message: 'An error occured!', data: null));  
  }

  Future<BaseResponse<LoginResponse>> login(LoginModel model) async {
      return await _http.post(endpoint,body: json.encode(model.jsonConvert()), headers: headers).then((result){
        if(result.statusCode == 200){
        final jsonData = json.decode(result.body);
        final response = LoginResponse.jsonConvert(jsonData);
        print(response);
        //response value will be stored in a shared preference or provider ......

          return BaseResponse(status: true, message: "login success", data: response);
        }

        //todo: display api error message directly to user
        return BaseResponse(status: false, message:"something went wrong", data: jsonDecode(result.body));

        //catch the error   
       }).catchError((_) =>
            BaseResponse(status: true, message: 'An error occured!', data: null));  
  }

}