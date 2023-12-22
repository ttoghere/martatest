import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfileProvider extends ChangeNotifier {
  //Kullanıcı Bilgisi Alma
  Future<Map<String, dynamic>> getUserProfileInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    const String url = 'https://test.guzelasistan.com/core/v1/user/info';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          json.decode(utf8.decode(response.bodyBytes));
      log("responseData: $responseData");
      return responseData;
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }
}
