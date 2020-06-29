import 'dart:convert';

import 'package:findr/models/agent.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/services/api_helper.dart';

class AgentService{
Map<String, String> headers =
{
  'Content-Type' : 'application/json'
  // 'Authorization' : access_token
};

ApiHelper _apiHelper = ApiHelper();


    Future<BaseResponse<AgentInfo>> getById (int id) {
      headers['token'] = '';
    return _apiHelper.get(endpoint: 'agents/$id', header: headers).then((data) {
      //check if api call returned 200
      if (data.statusCode == 200) {
        //convert data to a map type
        final jsonData = json.decode(data.body);
        final agent = AgentInfo.jsonConvert(jsonData);
        print(agent); //sample to check what repsonse looks like


        return BaseResponse<AgentInfo>.completed(message: 'retrieved successfully', data: agent);
      }
      return BaseResponse<AgentInfo>.error(message: 'An error occured!', data: null);
    }).catchError((_) => BaseResponse<AgentInfo>.error(message: 'An error occured!',data: null));
  }

}