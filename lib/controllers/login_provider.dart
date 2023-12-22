import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:martatest/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _kAdiController = TextEditingController();
  TextEditingController get kadiController => _kAdiController;
  final TextEditingController _sifreController = TextEditingController();
  TextEditingController get sifreController => _sifreController;
  String? kAdi;
  String? sifre;

  Future girisYap() async {
    log(kAdi!);
    log(sifre!);
    notifyListeners();
  }

  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    const String url = 'https://test.guzelasistan.com/core/v1/auth/login';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestBody = {
      "user_name": username,
      "user_pass": password,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Token'ı shared preferences'a kaydet
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', responseData['data']['access_token']);

      return responseData;
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs
        .remove('access_token')
        .whenComplete(() => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(adaptiveRatio: 1),
              ),
            ));
    notifyListeners();
  }
}
