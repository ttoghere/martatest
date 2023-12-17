import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ExpensesProvider extends ChangeNotifier {
  //Harcama Listesi
  Future<List<dynamic>> getExpenses(int leafletId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    final String url =
        'https://test.guzelasistan.com/core/v1/mobile/expenses/$leafletId';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> expenses = responseData['data'];
      return expenses;
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }

  //Harcama Ekleme
  Future<Map<String, dynamic>> addExpense(
      int leafletId, double amount, String description) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    const String url = 'https://test.guzelasistan.com/core/v1/mobile/expenses';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> requestBody = {
      "leaflet_id": leafletId,
      "amount": amount,
      "description": description,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }

  //Harcama Güncelleme
  Future<Map<String, dynamic>> updateExpense(
      int expenseId, double amount, String description) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    const String url = 'https://test.guzelasistan.com/core/v1/mobile/expenses';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> requestBody = {
      "expense_id": expenseId,
      "amount": amount,
      "description": description,
    };

    final http.Response response = await http.patch(
      Uri.parse(url),
      headers: headers,
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }

  //Harcama Silme
  Future<void> removeExpense(int expenseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    final String url =
        'https://test.guzelasistan.com/core/v1/mobile/expenses/$expenseId';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final http.Response response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['error'] == false) {
        log('Expense removed successfully.');
      } else {
        throw Exception(
            'Expense removal failed. Message: ${responseData['message']}');
      }
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }
}
