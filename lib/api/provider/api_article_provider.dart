import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../models/articles.dart';

class ApiArticleProvider {
  final String _baseUrl = "";
  final Dio _dio = Dio();

  Future<Articles> getArticles() async {
    try {
      final response = await _dio.get('$_baseUrl/api/articles/published');
      return Articles.fromJson(response.data);
    } catch (error) {
      debugPrint('$error');
      return Articles.withError('$error');
    }
  }
}
