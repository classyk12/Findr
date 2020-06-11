

import 'dart:convert';

import 'package:findr/models/agent.dart';
import 'package:findr/models/base_response.dart';
import 'package:http/http.dart' as _http;

class AgentService{
static const headers = 
{
  'Content- Type' : 'application/json'
  // 'Authorization' : access_token
};
  String endpoint;

  AgentService(){
    endpoint = "";
  }


    Future<BaseResponse<AgentInfo>> getById (int id) {
    return _http.get('$endpoint/$id', headers: headers).then((data) {
      //check if api call returned 200
      if (data.statusCode == 200) {
        //convert data to a map type
        final jsonData = json.decode(data.body);
        final agent = AgentInfo.jsonConvert(jsonData);
        print(agent); //sample to check what repsonse looks like
        
        //todo: iterate through the listings 

        return BaseResponse<AgentInfo>(status: true, message: 'retrieved successfully', data: agent);
      }
      return BaseResponse<AgentInfo>(status: false, message: 'An error occured!', data: null);
    }).catchError((_) => BaseResponse<AgentInfo>(
        status: true, message: 'An error occured!', data: null));
  }

}