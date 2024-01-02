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

  void _removeExpense(expense) {
    final expenseIndex = _registerexpenses.indexOf(expense);
    setState(() {
      _registerexpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense added!'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registerexpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    );
    if (_registerexpenses.isNotEmpty) {
      mainContent = EexpensesList(
          expenses: _registerexpenses, removeExpense: _removeExpense);
    }
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
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _openAddExpenseOverlay();
          },
        ),
        body: Column(
          children: <Widget>[
            const Text("The chart!"),
            Expanded(
              child: mainContent,
            )
          ],
        ));
  }
}
