// import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileProvider extends ChangeNotifier {
  //Kullanıcı Bilgisi Alma

  Future<DocumentSnapshot> fetchUserData(String username) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot userDocument =
          await firestore.collection('users').doc(username).get();

      return userDocument;
    } catch (e) {
      throw Exception('Veri çekme işlemi başarısız oldu: $e');
    }
  }
}
