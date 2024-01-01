import 'package:flutter/material.dart';
import 'package:xarje_app/src/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  //var _titleInput = ''; // TextEditingController();

  // void _saveInputTitle(String inputVale) {
  //   _titleInput = inputVale;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Catagory _selectedCatagory = Catagory.Medical;
  void _presentDatePicker() {
    final nowDate = DateTime.now();
    final firstDate = DateTime(nowDate.year - 1, nowDate.month, nowDate.day);
    showDatePicker(
        context: context,
        initialDate: nowDate,
        firstDate: firstDate,
        lastDate: nowDate);

    setState(() {
      DateTime pickedDate = DateTime.now(); // Define the variable pickedDate
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('An error occured!'),
                content: const Text('Please enter a valid title and amount.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('Okay'))
                ],
              ),
          barrierDismissible: false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveInputTitle,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('amount'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Select Date'),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month,
                        ))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                items: Catagory.values
                    .map(
                      (Catagory) => DropdownMenuItem(
                        value: _selectedCatagory,
                        child: Text(Catagory.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedCatagory = value;
                  });
                },
              ),
              // ignore: deprecated_member_use),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("submit"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cansle"))
            ],
          )
        ],
      ),
    );
  }
}
