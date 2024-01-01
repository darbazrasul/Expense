import 'package:flutter/material.dart';
import 'package:xarje_app/src/model/expense.dart';
import 'expense_list/expenses_list.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerexpenses = [
    Expense(
      amount: 9.99,
      title: 'Groceries',
      date: DateTime.now(),
      catagory: Catagory.Food,
    ),
    Expense(
      amount: 11.99,
      title: 'dctor',
      date: DateTime.now(),
      catagory: Catagory.Medical,
    ),
    Expense(
      amount: 4.99,
      title: 'tomatos',
      date: DateTime.now(),
      catagory: Catagory.Shopping,
    ),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerexpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Expense Tracker'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _openAddExpenseOverlay();
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            const Text("The chart!"),
            Expanded(child: EexpensesList(expenses: _registerexpenses))
          ],
        ));
  }
}
