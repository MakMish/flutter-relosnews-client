import 'dart:convert';
import 'package:dio/dio.dart';
class registerservice{
  var dio=Dio();
  Future<int> fetchdata5(Object data) async {
    try {
      var response = await dio.post(
          "https://news-project-data-2.onrender.com/users/register",
          data: jsonEncode(data));
      if (response.statusCode == 200) {
        print("${response.statusCode}");
        return 1;
      }
      else {
        print("${response.statusCode} \n 2no wala" );
        return 2;
      }
    }
    catch(err){
      throw Exception("$err");
    }
  }
}

