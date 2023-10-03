import 'package:expense_tracker/Models.dart/ExpenseModel.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
 
  const ExpenseList({super.key, required this.list});
  final List<ExpenseModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(decoration: BoxDecoration(
            color: Colors.grey,borderRadius: BorderRadius.circular(20)),
            child: ListTile(leading: Text(list[index].title), title: Text(list[index].amount.toString()), subtitle: Text(list[index].description,), trailing: Text(list[index].category),)),
        );
      }, );
  }
}