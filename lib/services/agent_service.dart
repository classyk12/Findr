import 'dart:convert';

import 'package:findr/models/agent.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/models/user.dart';
import 'package:findr/services/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgentService{
Map<String, String> headers =
{
  'Content-Type' : 'application/json'
 // 'Authorization' : headers['token']
};

ApiHelper _apiHelper = ApiHelper();


    Future<BaseResponse<AgentDashBoardModel>> getDashboard () async{
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        String token = pref.getString('token');
        headers['Authorization'] = 'bearer ' + token;

        var data = await _apiHelper.get(endpoint: 'dashboard', header: headers);
        if (data != null) {
          //check if api call returned 200
          if (data.statusCode == 200) {
            //convert data to a map type
            final jsonData = json.decode(data.body)['data'];
            final agent = AgentDashBoardModel.fromJson(jsonData);
            print(agent); //sample to check what repsonse looks like


            return BaseResponse<AgentDashBoardModel>.completed(message: 'retrieved successfully', data: agent);
          }
          
        }
          return BaseResponse<AgentDashBoardModel>.error(message: 'An error occured!', data: null);
        
      } catch (error) {
        return BaseResponse<AgentDashBoardModel>.error(message: 'An error occured!',data: null);
      }
    
    // .then().catchError((_) => BaseResponse<AgentInfo>.error(message: 'An error occured!',data: null));
  }


   Future<BaseResponse<AgentInfo>> uploadId (AgentUploadModel model) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
           String token = pref.getString('token');
     headers['Authorization'] = 'bearer ' + token;
    return await _apiHelper
        .post(endpoint: 'upload', body: model.toMap(), header: headers)
        .then((result) {
      if (result.statusCode == 201) {
        //testing to see the content of api response
        final jsonData = json.decode(result.body)['data'];
        final userdata = AgentInfo.jsonConvert(jsonData);
        print(userdata);
        return BaseResponse<AgentInfo>.completed(
            message: 'upload success', data: userdata);
      }

      //todo: display api error message directly to user
      return BaseResponse<AgentInfo>.error(
          message: "something went wrong: ${result.body}");

      //catch the error
    }).catchError((e) => BaseResponse<AgentInfo>.error(message: e.toString()));
  }


    Future<BaseResponse<AgentInfo>> patchAndCreate(UserUpdateModel model) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
           String token = pref.getString('token');
     headers['Authorization'] = 'bearer ' + token;
    return await _apiHelper
        .patch(endpoint: 'users', body: model.toMap(), header: headers)
        .then((result) {
      if (result.statusCode == 200) {
        //testing to see the content of api response
        final jsonData = json.decode(result.body)['data'];
        final userdata = AgentInfo.jsonConvert(jsonData);
        print(userdata);
        return BaseResponse<AgentInfo>.completed(
            message: 'registration success', data: userdata);
      }

      //todo: display api error message directly to user
      return BaseResponse<AgentInfo>.error(
          message: "something went wrong: ${result.body}");

      //catch the error
    }).catchError((e) => BaseResponse<AgentInfo>.error(message: e.toString()));
  }

}