import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceProvider extends ChangeNotifier {
  //Fatura Liste
  Future<List<dynamic>> getInvoices(int typeOf) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    final String url =
        'https://test.guzelasistan.com/core/v1/mobile/invoices/$typeOf';
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
      final List<dynamic> invoices = responseData['data'];
      return invoices;
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }

  //Fatura Erken Ödeme
  Future<void> payInvoiceEarly(
      int invoiceId, String invoiceCode, int customerId, double amount) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    const String url =
        'https://test.guzelasistan.com/core/v1/mobile/invoices/early';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> requestBody = {
      "invoice_id": invoiceId,
      "invoice_code": invoiceCode,
      "customer_id": customerId,
      "amount": amount,
    };

    final http.Response response = await http.patch(
      Uri.parse(url),
      headers: headers,
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['error'] == false) {
        log('Invoice early payment successful.');
      } else {
        throw Exception(
            'Invoice early payment failed. Message: ${responseData['message']}');
      }
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }

  //Fatura Ödeme
  Future<void> payInvoice(int invoiceId, double amount, int paymentType,
      String postponementDate, String description) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    const String url = 'https://test.guzelasistan.com/core/v1/mobile/invoices';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> requestBody = {
      "invoice_id": invoiceId,
      "amount": amount,
      "payment_type": paymentType,
      "postponement_date": postponementDate,
      "description": description,
    };

    final http.Response response = await http.patch(
      Uri.parse(url),
      headers: headers,
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['error'] == false) {
        log('Invoice payment successful.');
      } else {
        throw Exception(
            'Invoice payment failed. Message: ${responseData['message']}');
      }
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }
}
