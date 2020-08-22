import 'package:findr/models/agent.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/models/user.dart';
import 'package:findr/models/user_dashBoard.dart';
import 'package:findr/services/agent_service.dart';
import 'package:flutter/material.dart';
import 'package:findr/services/service_locator.dart';

class AgentProvider extends ChangeNotifier{

  AgentService _agentService = locator<AgentService>();
  BuildContext context;

  BaseResponse<UserInfo> updateResponse = BaseResponse<UserInfo>.completed();
  BaseResponse<UserDashBoard> agentDashboardResponse =  BaseResponse<UserDashBoard>.completed();


  Future<BaseResponse<UserInfo>> updateProfile(UserUpdateModel model) async{
    //print(model.image);
    updateResponse = BaseResponse<UserInfo>.loading(message: '');
    notifyListeners();
  
    updateResponse = await _agentService.patchAndCreate(model);
    notifyListeners();

    return updateResponse;
  }

   Future<BaseResponse<UserInfo>> uploadID(AgentUploadModel model) async{
    //print(model.image);
    updateResponse = BaseResponse<UserInfo>.loading(message: '');
    notifyListeners();
  
    updateResponse = await _agentService.uploadId(model);
    notifyListeners();

    return updateResponse;
  }

   Future getDashboard() async{
    //print(model.image);
    agentDashboardResponse = BaseResponse<UserDashBoard>.loading(message: '');
    notifyListeners();
  
    agentDashboardResponse = await _agentService.getDashboard();
    notifyListeners();

  }

}