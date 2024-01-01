import 'package:flutter/material.dart';
import 'package:xarje_app/src/model/expense.dart';
import 'package:xarje_app/src/screen/expense_list/expense_item_list.dart';

class EexpensesList extends StatelessWidget {
  const EexpensesList({super.key, required this.expenses});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return ExpeseItem(expense: expenses[index]);
      },
    );
  }
}
