// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ExpensesProvider extends ChangeNotifier {
  late List<Map<String, dynamic>> _expenses;

  ExpenseProvider() {
    _expenses = [];
    // Expenses koleksiyonundaki verileri ilk kez çekmek için bir fonksiyonu çağır
    fetchExpenses();
  }

  List<Map<String, dynamic>> get expenses => _expenses;

  Future<List<dynamic>> fetchExpenses() async {
    try {
      // Firestore'dan expenses koleksiyonundaki verileri çek
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('expenses').get();

      // Verileri işle ve _expenses listesini güncelle
      List<Map<String, dynamic>> expensesData = querySnapshot.docs
          .map((QueryDocumentSnapshot document) =>
              document.data() as Map<String, dynamic>)
          .toList();

      // Değişiklikleri dinleyen widget'ları güncelle
      notifyListeners();

      return expensesData;
    } catch (e) {
      log('Error fetching expenses: $e');
      // Hata durumunda boş bir liste dönebilir veya isteğe bağlı olarak hata yönetimi yapabilirsiniz.
      return [];
    }
  }

  //Harcama Ekleme
  Future<void> addExpenseToFirestore({
    required String amount,
    required String description,
    required int typeOf,
  }) async {
    try {
      // Yeni bir belge eklemek için haritayı oluştur
      Map<String, dynamic> newExpense = {
        'amount': int.parse(amount),
        'description': description,
        'expenseId': 1,
        'leafletId': 1,
        'typeOf': typeOf,
        'userId': 1,
      };

      // Firestore'daki 'expenses' koleksiyonuna haritayı ekle
      await FirebaseFirestore.instance.collection('expenses').add(newExpense);
    } catch (e) {}
  }

  Future<void> updateExpense({
    required String expenseId,
    required double newAmount,
    required String newDescription,
    required int newTypeOf,
  }) async {
    try {
      // Firestore'dan belirli bir expense'ı güncelle
      await FirebaseFirestore.instance
          .collection('expenses')
          .doc(expenseId)
          .update({
        'amount': newAmount,
        'description': newDescription,
        'typeOf': newTypeOf,
      });

      // Güncelleme başarılı olduysa, _expenses listesini de güncelleyebilir ve
      // Değişiklikleri dinleyen widget'ları güncelleyebilirsiniz.
      // Ancak bu, state yönetimi ve widget'ların nasıl yapılandırıldığına bağlı olarak değişebilir.
      // notifyListeners(); // Örnek: Provider kullanıyorsanız, bu metodu çağırabilirsiniz.
    } catch (e) {
      log('Error updating expense: $e');
      // Hata yönetimi yapabilirsiniz.
    }
  }

  //Harcama Silme
  Future<void> deleteExpense(String expenseId) async {
    try {
      // Firestore'dan belirli bir expense'ı sil
      await FirebaseFirestore.instance
          .collection('expenses')
          .doc(expenseId)
          .delete();

      // Silme işlemi başarılı olduysa, _expenses listesini güncelleyebilir ve
      // Değişiklikleri dinleyen widget'ları güncelleyebilirsiniz.
      // Ancak bu, state yönetimi ve widget'ların nasıl yapılandırıldığına bağlı olarak değişebilir.
      // notifyListeners(); // Örnek: Provider kullanıyorsanız, bu metodu çağırabilirsiniz.
    } catch (e) {
      log('Error deleting expense: $e');
      // Hata yönetimi yapabilirsiniz.
    }
  }
}
