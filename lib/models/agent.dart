

class AgentInfo {
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
  int ratings;

//  List<AgentListing> listings;

  AgentInfo(this.id,this.fullName, this.email, this.image, this.isVerified, this.location, this.phoneNumber, this.userType,this.createdAt, this.updatedAt,
   this.ratings);

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
       // item['agentlistings'] != null ? (item['agentlistings'] as List).map((i) => AgentListing.jsonConvert(i)).toList() : null,

        item['avg_rating'],
//       item['agentlistings'] != null
//          ? new List<AgentListing>.from(item['agentlistings'])
//          : null
          );
//    //trying to see if we can set the value of both dates from json...i no sure of this one
    //  ..createdAt = DateTime.parse(item['created_at'])..updatedAt = DateTime.parse(item['updated_at']);
}

}

class AgentDashBoardModel {
AgentInfo agentdetails;
Listings agentlistings;

AgentDashBoardModel({this.agentdetails, this.agentlistings});

    factory AgentDashBoardModel.fromJson(Map<String, dynamic> json) => AgentDashBoardModel(
      agentdetails: AgentInfo.jsonConvert(json["agentdetails"] ?? json["data"]),
      agentlistings: Listings.jsonConvert(json["agentlistings"] ?? null)  
    );
   
}



class AgentListing{
  int id;
  String houseType;
  String image;
  String houseArea;
  double price; 
  DateTime createdAt;

  AgentListing(this.id,  this.houseType, this.houseArea, this.image, this.price, this.createdAt);

   //use this to convert json to list/object
  factory AgentListing.jsonConvert(Map<String, dynamic> item) {
    return AgentListing(
        item['id'],
        item['house_type'],
        item['image'],
        item['house_area'],
        item['price'],
        DateTime.parse(item['created_at']) ?? null);
   // ..createdAt = DateTime.parse(item['created_at'])
    //..updatedAt = DateTime.parse(item['updated_at']);
  }
}

class Listings{
    int currentPage;
    String firstPageUrl;
    dynamic from;
    int lastPage;
    String lastPageUrl;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    dynamic to;
    int total;
    List<AgentListing> data;

  Listings(this.currentPage, this.firstPageUrl,this.from ,this.lastPage, this.lastPageUrl, this.nextPageUrl, this.path, this.perPage, this.to, this.total, this.data);

   //use this to convert json to list/object
  factory Listings.jsonConvert(Map<String, dynamic> item) {
    return Listings(
        item['current_page'],
        item['first_page_url'],
        item['from'],
        item['last_page'],
        item['last_page_url'],
         item['next_page_url'],
        item['path'],
        item['per_page'],
        item['to'],
        item['total'],
        item['data'] != null ? (item['data'] as List).map((i) => AgentListing.jsonConvert(i)).toList() : null,
        
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


