import 'package:findr/models/agent.dart';
import 'package:findr/models/base_response.dart';
import 'package:findr/models/user.dart';
import 'package:findr/services/agent_service.dart';
import 'package:flutter/material.dart';
import 'package:findr/services/service_locator.dart';

class AgentProvider extends ChangeNotifier{

  AgentService _agentService = locator<AgentService>();
  BuildContext context;

  BaseResponse<AgentInfo> updateResponse = BaseResponse<AgentInfo>.completed();

  Future<BaseResponse<AgentInfo>> uploadImage(UserUpdateModel model) async{
    //print(model.image);
    updateResponse = BaseResponse<AgentInfo>.loading(message: '');
    notifyListeners();
  
    updateResponse = await _agentService.patchAndCreate(model);
    notifyListeners();

    return updateResponse;
  }

   Future<BaseResponse<AgentInfo>> uploadID(AgentUploadModel model) async{
    //print(model.image);
    updateResponse = BaseResponse<AgentInfo>.loading(message: '');
    notifyListeners();
  
    updateResponse = await _agentService.uploadId(model);
    notifyListeners();

    return updateResponse;
  }

   Future<BaseResponse<AgentInfo>> getProfileData(int id) async{
    //print(model.image);
    updateResponse = BaseResponse<AgentInfo>.loading(message: '');
    notifyListeners();
  
    updateResponse = await _agentService.getProfile(id);
    notifyListeners();

    return updateResponse;
  }


}