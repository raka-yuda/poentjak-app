import 'dart:convert';

import "../models/article.dart";
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.100.6:3000";
  // Client client = Client();

  Future<List<Article>> getArticles() async {
    final response = await http.get("$baseUrl/api/blog");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Article.fromJson(data))
          .toList();
    } else {
      return null;
    }
  }
}
