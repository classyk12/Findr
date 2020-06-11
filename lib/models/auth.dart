
import 'package:findr/models/base_model.dart';

class RegisterModel {
  final String fullName;
  final String phoneNumber;
  final String password;
  final String email;
  final String userType;

  RegisterModel({this.fullName,this.phoneNumber,this.password,this.email,this.userType});

  //use this to convert raw text to json
  Map<String, dynamic> toMap() {
    return {"fullname": fullName, "phone_number": phoneNumber, "password": password, "email":email, "user_type":userType};
  }
}

//this is returned by the API after successful registration
//we cn store this in a provider so we can access it anytime
class UserData extends BaseModel{
  final String fullName;
  final String phoneNumber;
  final String email;
  final String userType;
  final String accessToken;

UserData(id,this.fullName, this.phoneNumber,createdAt ,this.email, this.userType,updatedAt, this.accessToken);

 factory UserData.jsonConvert(Map<String, dynamic> item) {
    return UserData(
        item['id'],
        item['fullname'],
        item['phone_number'],
        DateTime.parse(item['created_at']),  
         item['email'],
         item['user_type'],
       DateTime.parse(item['updated_at'] ?? null),
       item['access_token']
    );
    }
}

class LoginModel {
 final String phoneNumber;
 final String password;

 LoginModel({this.phoneNumber, this.password});

  //use this to convert raw text to json
  Map<String, dynamic> toMap() {
    return {"phone_number": phoneNumber, "password": password};
  }

}

  class LoginResponse{
     String accessToken;

     LoginResponse(this.accessToken);

     factory LoginResponse.jsonConvert(Map<String, dynamic> item){
       return LoginResponse(
         item['access_token']
       );
     }
  }