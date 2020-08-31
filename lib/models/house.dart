import 'dart:convert';

import 'package:findr/models/base_model.dart';

class HouseList extends BaseModel {

      int id;
      String houseType;
      List<dynamic> image;
      String houseArea;
      int price;

     HouseList({this.id, this.houseType,this.image, this.houseArea, this.price});

     //use this to convert json to list/object
  factory HouseList.jsonConvert(Map<String, dynamic> item) {
//    var image = json.decode(item['image']);
//    print(image[0]);
    return HouseList(
        id: item['id']  != null ? item['id'] : 0,
        houseType: item['house_type'],
        image:  item['image'] != null ? json.decode(item['image']) : null,
        price: item['price'],
        houseArea: item['house_area'])
    ..id = item['id']
    ..createdAt = DateTime.parse(item['created_at']);

}

}

class HouseFormModel{
      String houseType;
      String description;
      String caretakerFee;
      List<String> image;
      String totalRooms;
      String houseArea;
      int price;
      bool isParkingSpace;
      bool isFenced;
      bool isHaveWater;
      bool isNewHouse;
      bool isNeigotiable;
      bool isFurnished;
		

      HouseFormModel({this.houseType, this.description, this.image, this.totalRooms, this.houseArea, this.price, this.isParkingSpace, 
      this.isFenced, this.isFurnished, this.isHaveWater, this.isNeigotiable, this.isNewHouse, this.caretakerFee});

       //use this to convert raw text to json
  Map<String, dynamic> jsonConvert() {
    return {"house_type": houseType, "description": description, "image":image, "total_rooms":totalRooms,"house_area":houseArea,"price":price,
    "isParkingSpace":isParkingSpace,"isFenced":isFenced,"isFurnished":isFurnished,"isHaveWater":isHaveWater,"isNegotiable":isNeigotiable,
    "isNewHouse":isNewHouse,"caretaker_fee":caretakerFee};
  }
}

class HouseDetail extends BaseModel {
    final  String houseType;
     final String description;
     final List<String> image;
     final String totalRooms;
     final String houseArea;
     final int price;
     final int userId; //id of user posting the advert
     final bool isParkingSpace;
     final bool isFenced;
     final bool isHaveWater;
     final bool isNewHouse;
     final bool isNeigotiable;
     final bool isFurnished;
     final double rating;
     final int totalViews;
     final int caretakerFee;
     final String isAvailable;

     HouseDetail(id,this.houseType, this.description, this.image, this.totalRooms, this.houseArea, this.price, this.isParkingSpace, 
     this.userId, this.isFenced, this.isFurnished, this.isHaveWater, this.isNeigotiable, this.isNewHouse,
     this.rating, this.totalViews, createdAt, updatedAt, this.caretakerFee, this.isAvailable);


  factory HouseDetail.jsonConvert(Map<String, dynamic> item) {
    return HouseDetail(
        item['id'],
        item['house_type'],
        item['description'],
        item['image'],  
        item['total_rooms'],
        item['house_area'],
        item['price'],
        item['isParkingSpace'],
        item['user_id'],
        item['isFenced'],
        item['isFurnished'],
        item['isHaveWater'],
        item['isNegotiable'],
        item['isNewHouse'],
        item['rating'],    
        item['total_views'],  
       DateTime.parse(item['created_at']),
       DateTime.parse(item['updated_at'] ?? null),
        item['caretaker_fee'],
       item['isAvailable'] 
    );
    }
}

class HouseFilter{
 final int minimumprice;
 final int maximumPrice;
 final String houseType;

 HouseFilter({this.maximumPrice, this.minimumprice, this.houseType});

 Map<String, dynamic> jsonConvert(){
   return {"minimumPrice": minimumprice, "maximumPrice": maximumPrice, "house_type": houseType};
 }
}

