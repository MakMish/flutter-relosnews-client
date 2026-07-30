import 'dart:convert';

import 'package:dio/dio.dart';
var dio = Dio();
class API_Services {
  String email;
  String password;
  API_Services({required this.email,required this.password});

  Future<int> fetchdata() async {
    try {
      final response = await dio.post(
          "https://news-project-data-2.onrender.com/users/login",
          data:jsonEncode({
            "emai":email,
            "password":password
          }),
        options: Options(
          headers: {
            "Content-Type":"application/json",
            "Accept": "application/json",
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
          }
        )
      );
      print("yeh rha data format\n");
      print(jsonEncode({
        "emai":email,
        "password":password
      }));

      if (response.statusCode == 200) {
        return 1;
      } else if(response.statusCode==268){
        return 2;
      }

      else return 0;
    } catch (err) {
      return 0;
    }
  }
}

