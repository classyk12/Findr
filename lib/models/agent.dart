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
      // item['agentlistings']);
      //  item['agentlistings'] != null
      //     ? new List<AgentListing>.from(item['agentlistings'])
      //     : null);
 //}
        item['agentlistings'] != null ? (item['agentlistings'] as List).map((i) => AgentListing.jsonConvert(i)).toList() : null
//       item['agentlistings'] != null
//          ? new List<AgentListing>.from(item['agentlistings'])
//          : null
          );
//    //trying to see if we can set the value of both dates from json...i no sure of this one
    //  ..createdAt = DateTime.parse(item['created_at'])..updatedAt = DateTime.parse(item['updated_at']);
}

}

class AgentListing extends BaseModel{
  String houseType;
  String image;
  String houseArea;
  double price; 

  AgentListing( id,  this.houseType, this.houseArea, this.image, this.price, createdAt);

   //use this to convert json to list/object
  factory AgentListing.jsonConvert(Map<String, dynamic> item) {
    return AgentListing(
        item['id'],
        item['house_type'],
        item['image'],
        item['house_area'],
        item['price'],
        DateTime.parse(item['created_at']) ?? null)
    ..createdAt = DateTime.parse(item['created_at'])
    ..updatedAt = DateTime.parse(item['updated_at']);
}
}

class AgentUploadModel{
  String file;

  AgentUploadModel(this.file);

   //use this to convert json to list/object
 Map<String, dynamic> toMap() {
    return {"file": file};
  }

}


