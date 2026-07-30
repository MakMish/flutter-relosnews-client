import 'package:dio/dio.dart';
import 'package:relosnews/Model/apiclass.dart';
import 'package:relosnews/config.dart';
configcls x =configcls();
class api_service_Services {
  final Dio dio = Dio();
  Future<api_service> fetchdata(int pg) async {
    try {
      final response = await dio.get(
        "https://newsapi.org/v2/everything",
        queryParameters: {
          "pageSize": 100,
          "page": pg,
          "q": "india",
          "apiKey": x.api_key,
        },
      );

      if (response.statusCode == 200) {
        print("called");
        print("dta is ${response.data}");
        print("data geted");
        return api_service.fromJson(response.data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
