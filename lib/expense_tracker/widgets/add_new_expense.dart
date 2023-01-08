import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class AddNewExpense extends StatefulWidget {
  final Expenses expenses;
  const AddNewExpense({
    super.key,
    required this.expenses,
  });

  @override
  State<AddNewExpense> createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _dateChosen;

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dateChosen = pickedDate;
      });
    });
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _dateChosen == null) {
      return;
    }

    widget.expenses.addExpense(enteredTitle, enteredAmount, _dateChosen!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(_dateChosen == null
                  ? 'No Date Chosen!'
                  : 'Picked Date: ${DateFormat.yMd().format(_dateChosen!)}'),
              TextButton(
                onPressed: _openDatePicker,
                child: const Text('Choose Date'),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: const Text('Add Expense'),
          ),
        ],
      ),
    );
  }
}
