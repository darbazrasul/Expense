import 'package:flutter/material.dart';
import 'package:xarje_app/src/model/expense.dart';

class ExpeseItem extends StatelessWidget {
  const ExpeseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Text(expense.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  expense.amount.toStringAsFixed(2),
                ),
                const SizedBox(
                  width: 230,
                ),
                Icon(catagoryIcon[expense.catagory]),
                Text(
                  expense.formatter.toString(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
