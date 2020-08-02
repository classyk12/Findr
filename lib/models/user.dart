

class UserUpdateModel
{
  final String fullName;
  final String image;

  UserUpdateModel({this.fullName,this.image});

    //use this to convert raw text to json
  Map<String, dynamic> toMap() {
    return {"fullname": fullName, "image": image};
  }
}