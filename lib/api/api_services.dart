import 'dart:convert';

import "../models/article.dart";
import "../models/mountain.dart";

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.100.6:8090";

  //  Fetch all article published
  Future<List<Article>> getArticles() async {
    final response = await http.get("$baseUrl/api/articles/published");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Article.fromJson(data))
          .toList();
    } else {
      return null;
    }
  }

  //  Fetch all list of mountain
  Future<List<Mountain>> getMountains() async {
    final response = await http.get("$baseUrl/api/mountains");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Mountain.fromJson(data))
          .toList();
    } else {
      return null;
    }
  }
}
