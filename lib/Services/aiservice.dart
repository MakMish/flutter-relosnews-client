import 'package:dio/dio.dart';
import 'package:relosnews/Model/aiclass.dart';
import 'package:relosnews/config.dart';
configcls x =configcls();
class aiservice{
  Future<aiclass> fetchaidata(String text) async {
    var dio=Dio();
    try {
      final response = await dio.post(
        x.ai_url,
        data:{
          "Text":"yeh ek news link hai , link=$text , isse atleast 300 word mein summarize karo emogies ke saath woh bhi hinglish mein"
        },
          options: Options(
            headers: {
              "Content-Type": "application/json",
            }
          )
      );

      if (response.statusCode == 200) {
        var decodedData = aiclass.fromJson(response.data);
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
