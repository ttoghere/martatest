class Invoice {
  final int invoiceId;
  final int territoryId;
  final int customerId;
  final String customerCode;
  final String customerTitle;
  final String invoiceCode;
  final double netAmount;
  final double outstandingAmount;
  final int termDay;
  final String issueDate;
  final String dueDate;
  final String postponementDate;
  final bool hasBankAct;
  final double bankActAmount;
  final Map<String, dynamic> details;

  Invoice({
    required this.invoiceId,
    required this.territoryId,
    required this.customerId,
    required this.customerCode,
    required this.customerTitle,
    required this.invoiceCode,
    required this.netAmount,
    required this.outstandingAmount,
    required this.termDay,
    required this.issueDate,
    required this.dueDate,
    required this.postponementDate,
    required this.hasBankAct,
    required this.bankActAmount,
    required this.details,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      invoiceId: json['invoice_id'],
      territoryId: json['territory_id'],
      customerId: json['customer_id'],
      customerCode: json['customer_code'],
      customerTitle: json['customer_title'],
      invoiceCode: json['invoice_code'],
      netAmount: json['net_amount'],
      outstandingAmount: json['outstanding_amount'],
      termDay: json['term_day'],
      issueDate: json['issue_date'],
      dueDate: json['due_date'],
      postponementDate: json['postponement_date'],
      hasBankAct: json['has_bank_act'],
      bankActAmount: json['bank_act_amount'],
      details: json['details'],
    );
  }
}
