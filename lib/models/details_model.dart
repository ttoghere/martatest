class Details {
  String? description;
  String? dueDate;
  int? paymentType;

  Details({this.description, this.dueDate, this.paymentType});

  Details.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    dueDate = json['due_date'];
    paymentType = json['payment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['due_date'] = dueDate;
    data['payment_type'] = paymentType;
    return data;
  }
}
