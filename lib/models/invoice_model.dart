import 'package:cloud_firestore/cloud_firestore.dart';

class Invoice {
  final int amount;
  final int bankActAmount;
  final String customerCode;
  final int customerId;
  final String customerTitle;
  final Map<String, dynamic> details;
  final String description;
  final String dueDate;
  final int paymentType;
  final String id;
  final String invoiceCode;
  final int invoiceId;
  final String issueDate;
  final int netAmount;
  final int outstandingAmount;
  final String postponementDate;
  final int termDay;
  final int territoryId;

  Invoice({
    required this.amount,
    required this.bankActAmount,
    required this.customerCode,
    required this.customerId,
    required this.customerTitle,
    required this.details,
    required this.description,
    required this.dueDate,
    required this.paymentType,
    required this.id,
    required this.invoiceCode,
    required this.invoiceId,
    required this.issueDate,
    required this.netAmount,
    required this.outstandingAmount,
    required this.postponementDate,
    required this.termDay,
    required this.territoryId,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      amount: json['amount'] ?? 0,
      bankActAmount: json['bank_act_amount'] ?? 0,
      customerCode: json['customerCode'] ?? "",
      customerId: json['customerId'] ?? 0,
      customerTitle: json['customerTitle'] ?? "",
      details: json['details'] ?? <String, dynamic>{},
      description: json['description'] ?? "",
      dueDate: json['dueDate'] ?? "",
      paymentType: json['paymentType'] ?? 0,
      id: json['id'] ?? "",
      invoiceCode: json['invoiceCode'] ?? "",
      invoiceId: json['invoiceId'] ?? 0,
      issueDate: json['issueDate'] ?? "",
      netAmount: json['netAmount'] ?? 0,
      outstandingAmount: json['outstandingAmount'] ?? 0,
      postponementDate: json['postponementDate'] ?? "",
      termDay: json['termDay'] ?? 0,
      territoryId: json['territoryId'] ?? 0,
    );
  }

  factory Invoice.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Invoice(
      amount: data['amount'] ?? 0,
      bankActAmount: data['bank_act_amount'] ?? 0,
      customerCode: data['customerCode'] ?? "",
      customerId: data['customerId'] ?? 0,
      customerTitle: data['customerTitle'] ?? "",
      details: data['details'] ?? <String, dynamic>{},
      description: data['description'] ?? "",
      dueDate: data['dueDate'] ?? "",
      paymentType: data['paymentType'] ?? 0,
      id: data['id'] ?? "",
      invoiceCode: data['invoiceCode'] ?? "",
      invoiceId: data['invoiceId'] ?? 0,
      issueDate: data['issueDate'] ?? "",
      netAmount: data['netAmount'] ?? 0,
      outstandingAmount: data['outstandingAmount'] ?? 0,
      postponementDate: data['postponementDate'] ?? "",
      termDay: data['termDay'] ?? 0,
      territoryId: data['territoryId'] ?? 0,
    );
  }
}
