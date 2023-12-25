import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseItem {
  final String id;
  final int expenseId;
  final int userId;
  final int leafletId;
  final int amount;
  final String description;
  final int typeOf;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExpenseItem({
    required this.id,
    required this.expenseId,
    required this.userId,
    required this.leafletId,
    required this.amount,
    required this.description,
    required this.typeOf,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExpenseItem.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return ExpenseItem(
      id: data?["id"] ?? "",
      expenseId: data?['expense_id'] ?? 0,
      userId: data?['user_id'] ?? 0,
      leafletId: data?['leaflet_id'] ?? 0,
      amount: data?['amount'] ?? 0,
      description: data?['description'] ?? "",
      typeOf: data?['type_of'] ?? 0,
      createdAt:
          (data?['created_at'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt:
          (data?['updated_at'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

class ExpenseResponse {
  final List<ExpenseItem> data;
  final bool error;
  final String message;

  ExpenseResponse({
    required this.data,
    required this.error,
    required this.message,
  });

  factory ExpenseResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic>? dataList = json['data'];

    List<ExpenseItem> items =
        dataList?.map((item) => ExpenseItem.fromSnapshot(item)).toList() ?? [];

    return ExpenseResponse(
      data: items,
      error: json['error'] ?? false,
      message: json['message'] ?? "",
    );
  }
}
