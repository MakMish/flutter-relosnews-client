import 'dart:convert';

import 'package:dio/dio.dart';
class verifyservice{
  var dio=Dio();
  Future<int> fetchdata6(String email,int otp,Object data) async {
    try {
      print("3");
      print(email);
      var response = await dio.post(
          "https://news-project-data-2.onrender.com/users/$email/$otp",
        data: jsonEncode(data)
          );
      if (response.statusCode == 200) {
        return 1;
      }
      else if(response.statusCode==282){
        return 2;
      }
      else {
        return 0;
      }
    }
    catch(err){
      throw Exception("invalid for processing");
    }
  }
}

