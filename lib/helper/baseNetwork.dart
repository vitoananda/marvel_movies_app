import 'dart:convert';
import 'package:http/http.dart' as http;
class BaseNetwork{
  static final String baseUrl = 'https://mcuapi.herokuapp.com/api/v1';

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponseList(response);
  }

  static Future<Map<String, dynamic>> _processResponseList(http.Response response) async{
    final body = response.body;
    if (body.isNotEmpty){
      final jsonBody = json.decode(body);
      return jsonBody;
    }
    else {
      print("Process Response Error!");
      return {
        "error" : true
      };
    }
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}