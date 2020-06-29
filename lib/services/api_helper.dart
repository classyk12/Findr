import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
class ApiHelper {
  final String _baseUrl = 'http://findrapi.herokuapp.com/api/v1/';


  Future<http.Response> get({String endpoint, dynamic header}) async {
    print('call api get request: $endpoint');

    var response;
    try {
      response = await http.get(_baseUrl + endpoint, headers: header);
    } on SocketException {
      print('Error api get request: $endpoint');
      throw Exception('No Internet connection');

    }
    return response;
  }


  Future<http.Response> post({String endpoint, dynamic body, header}) async {
    print('call api post request: $endpoint');
    var response;
    try {
      var b = json.encode(body);
      response = await http.post(_baseUrl + endpoint, body: b, headers: header);
    } on SocketException {
      print('Error api post request: $endpoint');

      throw Exception('No Internet connection');
//      return null;
    }
    return response;
  }

  Future<dynamic> delete({String endpoint, dynamic header}) async {
    var response;
    try {
      response = await http.delete(_baseUrl + endpoint);
//      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');

    }
    return response;
  }

}