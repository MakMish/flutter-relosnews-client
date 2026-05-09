import 'package:dio/dio.dart';
class registerservice{
  var dio=Dio();
  Future  fetchdata6(String email,String password) async {
    try {
      var response = await dio.post(
          "https://news-project-data-2.onrender.com/users/login/$email/$password",
          );
      if (response.statusCode == 200) {
        return "ok";
      }
      else if(response.statusCode==408){
        return "otp invalid";
      }
      else if(response.statusCode==410){
        return "otp expired";
      }
      else {
        throw Exception("invald");
      }
    }
    catch(err){
      throw Exception("invalid 2");
    }
  }
}

