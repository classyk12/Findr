import 'package:findr/models/agent.dart';

class UserDashBoard {
  final AgentDashBoardModel agentData;
  final UserInfo studentData;
  final String userType;

  UserDashBoard({this.agentData, this.studentData, this.userType});

  factory UserDashBoard.fromJson(Map<dynamic, dynamic> json){
    //if agent, agentData is set else null
    AgentDashBoardModel _agentData = json['data']['agentdetails'] != null ? AgentDashBoardModel.fromJson(json['data']) : null;
    
    //if student, userData is set else null
    UserInfo _studentData =  json['data']['agentdetails'] == null ? UserInfo.jsonConvert(json['data']) : null;
    
    return UserDashBoard(
        agentData: _agentData,
        studentData: _studentData,
        userType:  _agentData != null ? _agentData.agentdetails.userType : _studentData.userType
    );
  }
}