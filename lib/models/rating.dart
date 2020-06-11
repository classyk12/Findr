import 'package:findr/models/base_model.dart';

class Rating extends BaseModel {
   final int houseId;
   final int rating;
   final int userId;

   Rating(id,this.houseId, this.rating, this.userId, createdAt);

    factory  Rating.jsonConvert(Map<String, dynamic> item) {
    return Rating(
        item['id'],
        item['house_id'],
        item['rating'],
        item['user_id'],
       DateTime.parse(item['created_at']));
}

}

class RateAgentModel{
  final int rating;

  RateAgentModel(this.rating);

  Map<String, dynamic> jsonConvert(){
    return {"rating": rating};
  }
}