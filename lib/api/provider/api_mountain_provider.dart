import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../../models/mountains.dart';

class ApiMountainProvider {
  final String _baseUrl = "http://192.168.5.189:8090";

  Future<List<Mountain>> getMountains() async {
    final response = await http.get("$_baseUrl/api/mountains");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Mountain.fromJson(data))
          .toList();
    } else {
      return null;
    }
  }
}
