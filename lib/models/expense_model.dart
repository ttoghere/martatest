// class Expense {
//   final int expenseId;
//   final int userId;
//   final int leafletId;
//   final double amount;
//   final String description;
//   final int typeOf;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   Expense({
//     required this.expenseId,
//     required this.userId,
//     required this.leafletId,
//     required this.amount,
//     required this.description,
//     required this.typeOf,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Expense.fromJson(Map<String, dynamic> json) {
//     return Expense(
//       expenseId: json['expense_id'],
//       userId: json['user_id'],
//       leafletId: json['leaflet_id'],
//       amount: json['amount'].toDouble(),
//       description: json['description'],
//       typeOf: json['type_of'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }
