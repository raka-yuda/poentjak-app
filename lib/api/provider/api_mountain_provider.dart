import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../models/mountains.dart';

class ApiMountainProvider {
  final String _baseUrl = "http://192.168.5.189:8090";
  final Dio _dio = Dio();

  Future<Mountains> getMountains() async {
    try {
      final response = await _dio.get('$_baseUrl/api/mountains');
      return Mountains.fromJson(response.data);
    } catch (error) {
      debugPrint('$error');
      return Mountains.withError('$error');
    }
  }
}
