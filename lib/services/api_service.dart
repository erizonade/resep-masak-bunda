import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:resep_masak/utility/app_exception.dart';

class ApiService {
  // final String _baseUrl = "https://masak-apa-tomorisakura.vercel.app/api/";
  final String _baseUrl = "https://resep-hari-ini.vercel.app/api/";

  Future<dynamic> get({required String url, String params = '-'}) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(_baseUrl + url), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }).timeout(Duration(seconds: 15));

      print(response);
      responseJson = _dynamicResponse(response);
    } on SocketOption {
      throw FetchExection('Tidak Ada koneksi internet');
    } on TimeoutException {
      throw FetchExection('Request time out');
    }

    print(responseJson);
    return responseJson;
  }


  dynamic _dynamicResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        return response.body.toString();
      default:
        throw FetchExection('Terjadi kesalahan pada sever : ${response.statusCode}');
    }
  }

}