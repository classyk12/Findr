import 'package:findr/models/house.dart';

class UserInfo {
  int id;
  String fullName;
  String email;
  String location;
  String phoneNumber;
  String isVerified;
  String image;
  String userType;
  DateTime createdAt;
  DateTime updatedAt;
  //int ratings;

//  List<AgentListing> listings;

  UserInfo(this.id,this.fullName, this.email, this.image, this.isVerified, this.location, this.phoneNumber, this.userType,this.createdAt, this.updatedAt,
  );


   //use this to convert json to list/object
  factory UserInfo.jsonConvert(Map<String, dynamic> item) {
    return UserInfo(
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
       // item['agentlistings'] != null ? (item['agentlistings'] as List).map((i) => AgentListing.jsonConvert(i)).toList() : null,

      //  item['avg_rating'],
//       item['agentlistings'] != null
//          ? new List<AgentListing>.from(item['agentlistings'])
//          : null
          );
//    //trying to see if we can set the value of both dates from json...i no sure of this one
    //  ..createdAt = DateTime.parse(item['created_at'])..updatedAt = DateTime.parse(item['updated_at']);
}

}

class AgentDashBoardModel {
UserInfo agentdetails;
Listings agentlistings;

AgentDashBoardModel({this.agentdetails, this.agentlistings});

    factory AgentDashBoardModel.fromJson(Map<String, dynamic> json) => AgentDashBoardModel(
      agentdetails: json["agentdetails"] != null ? UserInfo.jsonConvert(json["agentdetails"]) : null,
      agentlistings: json["agentlistings"] != null ? Listings.jsonConvert(json['agentlistings'])  : null
    );
   
}



//class AgentListing{
//  int id;
//  String houseType;
//  String image;
//  String houseArea;
//  double price;
//  DateTime createdAt;
//
//  AgentListing(this.id,  this.houseType, this.houseArea, this.image, this.price, this.createdAt);
//
//   //use this to convert json to list/object
//  factory AgentListing.jsonConvert(Map<String, dynamic> item) {
//    return AgentListing(
//        item['id'],
//        item['house_type'],
//        item['image'],
//        item['house_area'],
//        item['price'],
//        DateTime.parse(item['created_at']) ?? null);
//   // ..createdAt = DateTime.parse(item['created_at'])
//    //..updatedAt = DateTime.parse(item['updated_at']);
//  }
//}

class Listings{
    int currentPage;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    String nextPageUrl;
    String path;
    int perPage;
    String prevPageUrl;
    int to;
    int total;
    List<HouseList> data;

  Listings({this.currentPage, this.firstPageUrl,this.from ,this.lastPage, this.lastPageUrl,
    this.nextPageUrl, this.path, this.perPage, this.to, this.total, this.data});

   //use this to convert json to list/object
  factory Listings.jsonConvert(Map<String, dynamic> item) {
    return Listings(
      currentPage: item['current_page'],
      firstPageUrl: item['first_page_url'],
      from: item['from'],
      lastPage: item['last_page'],
      lastPageUrl: item['last_page_url'],
      nextPageUrl: item['next_page_url'],
      path: item['path'],
      perPage:  item['per_page'],
      to:  item['to'],
      total: item['total'],
        data: item['data'] != null ? (item['data'] as List).map((i) => HouseList.jsonConvert(i)).toList() : null,
        
        );
      
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


