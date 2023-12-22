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
      final Map<String, dynamic> responseData =
          json.decode(utf8.decode(response.bodyBytes));
      final List<dynamic> expenses = responseData['data'] ?? [];
      notifyListeners();

      return expenses;
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }

  //Harcama Ekleme
  Future<void> addExpense(
      {required double amount,
      required int leafletId,
      required String description,
      required int typeOf}) async {
    const String apiUrl =
        'https://test.guzelasistan.com/core/v1/mobile/expenses';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';
    final Map<String, dynamic> requestData = {
      'leaflet_id': leafletId,
      'amount': amount,
      'description': description,
      'type_of': typeOf,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));

        // Handle the response data as needed
        log('Response Data: $responseData');
      } else {
        // Handle the error
        log('HTTP request failed with status: ${response.statusCode}');
        log('Error Message: ${response.body}');
      }
    } catch (error) {
      // Handle the exception
      log('An error occurred: $error');
    }
    notifyListeners();
  }

  Future<void> updateExpense(
      {required String description,
      required int id,
      required double amount}) async {
    // Replace with your actual URLs
    final String localUrl = 'http://127.0.0.1:5061/v1/mobile/expenses';
    final String remoteUrl =
        'https://test.guzelasistan.com/core/v1/mobile/expenses';

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';
    // Replace with your actual expense data
    final Map<String, dynamic> expenseData = {
      "expense_id": id,
      "amount": amount,
      "description": description,
      "type_of": 1,
    };

    try {
      final http.Response response = await http.patch(
        Uri.parse(remoteUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(expenseData),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Update successful:');
        print(responseData);
      } else {
        print('Failed to update expense. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error during the update process: $e');
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
      final Map<String, dynamic> responseData =
          json.decode(utf8.decode(response.bodyBytes));
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
    notifyListeners();
  }
}
