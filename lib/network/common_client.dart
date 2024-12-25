import 'package:http/http.dart' as http;
import 'dart:convert';
class CommonClient{
  String _baseUrl;

  CommonClient(this._baseUrl);

  // Method to fetch a list of posts
  Future<String> getData(String path) async {
    final response = await http.get(Uri.parse('$_baseUrl/$path'));
    if (response.statusCode == 200) {
     return response.body;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}