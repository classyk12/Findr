import 'package:findr/models/base_model.dart';

class AgentInfo extends BaseModel {
  String fullName;
  String email;
  String location;
  String phoneNumber;
  String isVerified;
  String image;
  String userType;

  List<AgentListing> listings;

  AgentInfo(id,this.fullName, this.email, this.image, this.isVerified, this.location, this.phoneNumber, this.userType,
   createdAt, updatedAt, this.listings);

   //use this to convert json to list/object
  factory AgentInfo.jsonConvert(Map<String, dynamic> item) {
    return AgentInfo(
        item['id'],
        item['fullname'],
        item['email'],
        item['image'],
        item['isverified'],
        item['location'],
        item['phone_number'],
        item['user_type'],
        DateTime.parse(item['created_at']) ?? null,
       DateTime.parse(item['updated_at']) ?? null,
       item['agentlistings']);
}

}

class AgentListing extends BaseModel{
  String houseType;
  String image;
  String houseArea;
  double price; 

  AgentListing(id,this.houseType, this.houseArea, this.image, this.price, createdAt);

   //use this to convert json to list/object
  factory AgentListing.jsonConvert(Map<String, dynamic> item) {
    return AgentListing(
        item['id'],
        item['house_type'],
        item['image'],
        item['house_area'],
        item['price'],
        DateTime.parse(item['created_at']) ?? null);
}

}


