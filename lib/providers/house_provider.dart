import 'package:findr/models/base_response.dart';
import 'package:findr/models/house.dart';
import 'package:findr/services/house.dart';
import 'package:findr/services/service_locator.dart';
import 'package:flutter/material.dart';

class HouseProvider extends ChangeNotifier{
  HouseService _service = locator<HouseService>();

  BaseResponse<List<HouseList>> houseResponse = BaseResponse<List<HouseList>>.completed(data: null);


  Future getHouses() async{
    houseResponse = BaseResponse<List<HouseList>>.loading(message: '');
    notifyListeners();

    houseResponse = await _service.getHouses();
    notifyListeners();
  }

}