import 'package:findr/models/base_model.dart';

class User extends BaseModel
{
    final String fullName;
  final String phoneNumber;
  final String location;
  final String email;
  final bool isVerified;
  final String userType;
  final String image;

  User({this.fullName, this.phoneNumber, this.location, this.email, this.isVerified, this.userType,this.image});
}