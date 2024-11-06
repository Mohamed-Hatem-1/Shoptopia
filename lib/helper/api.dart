import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is an error with the status code: ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url, dynamic body, String? token}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      // headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception(
          'There is an error with the status code: ${response.statusCode} with body: ${response.body}');
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> put({required String url, dynamic body}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception(
          'There is an error with the status code: ${response.statusCode} with body: ${response.body}');
    } else {
      return jsonDecode(response.body);
    }
  }
}
