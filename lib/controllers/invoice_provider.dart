import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceProvider extends ChangeNotifier {
  String? toplamTutar;
  String odenenTutar = "0.0";
  String? kalanTutar;
  String? otelemeTarihi;
  String? aciklama;
  int selectedPaymentOption = 1;

  //Fatura Liste
  Future<List<Map<String, dynamic>>> getInvoices(int typeOf) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    final String url =
        'https://test.guzelasistan.com/core/v1/mobile/invoices/$typeOf';
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          json.decode(utf8.decode(response.bodyBytes));
      final List<dynamic> invoices = responseData['data'];

      List<Map<String, dynamic>> formattedInvoices = [];
      for (var invoice in invoices) {
        Map<String, dynamic> formattedInvoice = {
          'invoice_id': invoice['invoice_id'],
          'territory_id': invoice['territory_id'],
          'customer_id': invoice['customer_id'],
          'customer_code': invoice['customer_code'],
          'customer_title': invoice['customer_title'],
          'invoice_code': invoice['invoice_code'],
          'net_amount': invoice['net_amount'],
          'outstanding_amount': invoice['outstanding_amount'],
          'term_day': invoice['term_day'],
          'issue_date': invoice['issue_date'],
          'due_date': invoice['due_date'],
          'postponement_date': invoice['postponement_date'],
          'has_bank_act': invoice['has_bank_act'],
          'bank_act_amount': invoice['bank_act_amount'],
          'description': invoice['details'] != null
              ? invoice['details']['description']
              : null,
          'due_date_details': invoice['details'] != null
              ? invoice['details']['due_date']
              : null,
          'payment_type': invoice['details'] != null
              ? invoice['details']['payment_type']
              : null,
        };
        formattedInvoices.add(formattedInvoice);
      }

      return formattedInvoices;
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

  var map = {
    "data": [
      {
        "invoice_id": 492,
        "territory_id": 2,
        "customer_id": 533,
        "customer_code": "D4F104578",
        "customer_title": "DURHASAN AKDOĞAN , MUHABBET TEKEL BÜFESİ",
        "invoice_code": "20231027_34EB01_S012023000010566",
        "net_amount": 5147.45,
        "outstanding_amount": 5147.45,
        "term_day": 7,
        "issue_date": "2023-10-27",
        "due_date": "2023-12-18",
        "postponement_date": "2023-12-18",
        "has_bank_act": true,
        "bank_act_amount": 0.00,
        "details": {
          "description": "rrr",
          "due_date": "2023-12-18",
          "payment_type": 2
        }
      },
      {
        "invoice_id": 493,
        "territory_id": 2,
        "customer_id": 1258,
        "customer_code": "D4F117696",
        "customer_title": "MEHMET SADIK TAŞ - GARİP BAKKAL",
        "invoice_code": "20231027_34EB01_S012023000010578",
        "net_amount": 6694.55,
        "outstanding_amount": 6694.55,
        "term_day": 7,
        "issue_date": "2023-10-27",
        "due_date": "2023-12-18",
        "postponement_date": null,
        "has_bank_act": false,
        "bank_act_amount": 0.00,
        "details": null
      },
      {
        "invoice_id": 494,
        "territory_id": 2,
        "customer_id": 573,
        "customer_code": "D4F140245",
        "customer_title": "ELİFE DOĞAN - DOĞAN MARKET",
        "invoice_code": "20231027_34EB01_S012023000010580",
        "net_amount": 1422.95,
        "outstanding_amount": 1422.95,
        "term_day": 7,
        "issue_date": "2023-10-27",
        "due_date": "2023-12-18",
        "postponement_date": null,
        "has_bank_act": false,
        "bank_act_amount": 0.00,
        "details": null
      },
      {
        "invoice_id": 495,
        "territory_id": 2,
        "customer_id": 388,
        "customer_code": "D4F187280",
        "customer_title": "BİRCAN VURAL - VURAL MARKET",
        "invoice_code": "20231027_34EB01_S012023000010558",
        "net_amount": 9048.63,
        "outstanding_amount": 9048.63,
        "term_day": 7,
        "issue_date": "2023-10-27",
        "due_date": "2023-12-18",
        "postponement_date": null,
        "has_bank_act": false,
        "bank_act_amount": 0.00,
        "details": null
      },
      {
        "invoice_id": 500,
        "territory_id": 2,
        "customer_id": 743,
        "customer_code": "D4F099013",
        "customer_title": "FIRAT TUZLU , TEKEL 33",
        "invoice_code": "20231027_34EB02_G022023000002447",
        "net_amount": 17466.95,
        "outstanding_amount": 17466.95,
        "term_day": 7,
        "issue_date": "2023-10-27",
        "due_date": "2023-12-18",
        "postponement_date": null,
        "has_bank_act": false,
        "bank_act_amount": 0.00,
        "details": null
      }
    ],
    "error": false,
    "message": "İşlem Başarılı"
  };
}
