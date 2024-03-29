import 'package:flutter/material.dart';
import 'package:xarje_app/src/model/expense.dart';
import 'package:xarje_app/src/screen/expense_list/expense_item_list.dart';

class EexpensesList extends StatelessWidget {
  const EexpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          background: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          ),
          key: ValueKey(expenses[index].id),
          onDismissed: (direction) {
            removeExpense(expenses[index]);
          },
          child: ExpeseItem(expense: expenses[index]),
        );
      },
    );
  }
}
