import 'dart:convert';

import 'package:findr/models/base_response.dart';
import 'package:findr/models/house.dart';
import 'package:findr/models/rating.dart';
import "package:http/http.dart" as _http;

class HouseService {
  static const headers = {'Content- Type' : 'application/json'};
  String endpoint;

  HouseService(){
    endpoint = "";
  }
  
  Future<BaseResponse<List<HouseList>>> getHouses () {
    return _http.get(endpoint , headers: headers).then((data) {
      //check if api call returned 200
      if (data.statusCode == 200) {
        //convert data to a map type
        final jsonData = json.decode(data.body);
        //convert the map into the actual real list of objects
        final houseList = <HouseList>[];
        for (var item in jsonData) {
          //add each converted content to the list defined above
          houseList.add(HouseList.jsonConvert(item));
        }
        return BaseResponse<List<HouseList>>.completed(data: houseList);
      }
      return BaseResponse<List<HouseList>>.error(message: 'An error occured!');
    }).catchError((_) => BaseResponse<List<HouseList>>.error( message: 'An error occured!'));
  }


    Future<BaseResponse<HouseDetail>> getById (int id) {
    return _http.get('$endpoint/$id', headers: headers).then((data) {
      //check if api call returned 200
      if (data.statusCode == 200) {
        //convert data to a map type
        final jsonData = json.decode(data.body);
        final house = HouseDetail.jsonConvert(jsonData);
        return BaseResponse<HouseDetail>.completed(message: 'retrieved successfully', data: house);
      }
      return BaseResponse<HouseDetail>.error(message: 'An error occured!');
    }).catchError((_) => BaseResponse<HouseDetail>.error(message: 'An error occured!'));
  }

 Future<BaseResponse<HouseDetail>> create(HouseFormModel model) {
    return _http
        .post(endpoint,
            headers: headers, body: json.encode(model.jsonConvert()))
        .then((data) {
      //check if api call returned 200
      if (data.statusCode == 201) {
        //converts string response to object
        final jsonData = json.decode(data.body);
        final house = HouseDetail.jsonConvert(jsonData);
        return BaseResponse<HouseDetail>.completed(message: 'Advert created!', data:house);
      }
      return BaseResponse<HouseDetail>.error(message: 'An error occured!');
    }).catchError((_) =>
            BaseResponse<HouseDetail>.completed(message: 'An error occured!'));
  }

   Future<BaseResponse<bool>> delete(int id) {
    return _http
        .delete('$endpoint?id=$id', headers: headers)
        .then((data) {
      //check if api call returned success
      if (data.statusCode == 200 || data.statusCode == 204) {
        return BaseResponse<bool>.completed(message: 'Done!', data: true);
      }
      return BaseResponse<bool>.error(message: 'An error occured!');
    }).catchError((_) =>
            BaseResponse<bool>.error(message: 'An error occured!'));
  }

   Future<BaseResponse<HouseDetail>> update (int id, HouseFormModel model) {
    return _http
        .put('$endpoint/$id', 
            headers: headers, body: json.encode(model.jsonConvert()))
        .then((data) {
      //check if api call returned success
      if (data.statusCode == 201 || data.statusCode == 200) {
        //converts string response to object
        final jsonData = json.decode(data.body);
        final house = HouseDetail.jsonConvert(jsonData);
        return BaseResponse<HouseDetail>.completed(message: 'update success',data: house);
      }
      return BaseResponse<HouseDetail>.error(message: 'An error occured!');
    }).catchError((_) =>
            BaseResponse<HouseDetail>.error(message: 'An error occured!'));
  }

   Future<BaseResponse<List<HouseList>>> filter(HouseFilter model) {
    return _http
        .post(endpoint,
            headers: headers, body: json.encode(model.jsonConvert()))
        .then((data) {
      //check if api call returned 200
      if (data.statusCode == 201) {
        //converts string response to object
        final jsonData = json.decode(data.body);
         final houseList = <HouseList>[];
        for (var item in jsonData) {
          //add each converted content to the list defined above
          houseList.add(HouseList.jsonConvert(item));
        }
        return BaseResponse<List<HouseList>>.completed(message: 'retrieved successfully', data:houseList);
      }
      return BaseResponse<HouseList>.error(message: 'An error occured!');
    }).catchError((_) =>
            BaseResponse<HouseList>.error(message: 'An error occured!'));
  }

   Future<BaseResponse<Rating>> rate(int houseId,RateAgentModel model) {
    return _http
        .post('$endpoint' + houseId.toString() ,
            headers: headers, body: json.encode(model.jsonConvert()))
        .then((data) {
      //check if api call returned 200
      if (data.statusCode == 201) {
        //converts string response to object
        final jsonData = json.decode(data.body);
        var response = Rating.jsonConvert(jsonData);
        
        return BaseResponse<Rating>.completed(message: 'retrieved successfully', data:response);
      }
      return BaseResponse<Rating>.error(message: 'An error occured!');
    }).catchError((_) =>
            BaseResponse<Rating>.error(message: 'An error occured!'));
  }



}