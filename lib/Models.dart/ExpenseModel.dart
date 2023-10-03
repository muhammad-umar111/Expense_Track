import 'dart:convert';

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final String date;
  final String description;
  final String category;
  final String? capitalAmount;
  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.description,
    required this.category,
    this.capitalAmount,
  });

  ExpenseModel copyWith({
    String? id,
    String? title,
    double? amount,
    String? date,
    String? description,
    String? category,
    String? capitalAmount,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
      category: category ?? this.category,
      capitalAmount: capitalAmount ?? this.capitalAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'amount': amount,
      'date': date,
      'description': description,
      'category': category,
      'capitalAmount': capitalAmount,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] as String,
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: map['date'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      capitalAmount: map['capitalAmount'] != null ? map['capitalAmount'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) => ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExpenseModel(id: $id, title: $title, amount: $amount, date: $date, description: $description, category: $category, capitalAmount: $capitalAmount)';
  }

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.amount == amount &&
      other.date == date &&
      other.description == description &&
      other.category == category &&
      other.capitalAmount == capitalAmount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      amount.hashCode ^
      date.hashCode ^
      description.hashCode ^
      category.hashCode ^
      capitalAmount.hashCode;
  }
}
