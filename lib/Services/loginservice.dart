import 'package:dio/dio.dart';
import 'package:relosnews/Model/loginclass.dart';
var dio = Dio();
class API_Services {
  String email;
  String password;
  API_Services({required this.email,required this.password});

  Future<loginclass> fetchdata(Object c) async {
    try {
      final response = await dio.post(
          "https://news-project-data-2.onrender.com/users/login",
          data:{
            "emai":email,
            "password":password
          },
        options: Options(
          headers: {
            "Content-Type":"application/json"
          }
        )
      );

      if (response.statusCode == 200) {
        var decodedData = loginclass.fromJson(response.data);
        return decodedData;
      } else {
        throw Exception(
          'Failed to load data. Status code: ${response.statusCode}',
        );
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}

