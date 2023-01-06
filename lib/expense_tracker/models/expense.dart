import 'package:flutter/foundation.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}

class Expenses with ChangeNotifier {
  final List<Expense> _items = [
    Expense(
      id: '1',
      title: 'Netflix',
      amount: 140,
      date: DateTime.now(),
    ),
    Expense(
      id: '2',
      title: 'New Shoes',
      amount: 2000,
      date: DateTime.now(),
    ),
    Expense(
      id: '3',
      title: 'Tuition',
      amount: 5000,
      date: DateTime.now(),
    ),
    Expense(
      id: '4',
      title: 'Upgrade RAM',
      amount: 3500,
      date: DateTime.now(),
    ),
    Expense(
      id: '5',
      title: 'Eat at restaurant',
      amount: 625.50,
      date: DateTime.now(),
    ),
    // Expense(
    //   id: '5',
    //   title: 'Eat at restaurant',
    //   amount: 625.50,
    //   date: DateTime.now(),
    // ),
    // Expense(
    //   id: '5',
    //   title: 'Eat at restaurant',
    //   amount: 625.50,
    //   date: DateTime.now(),
    // ),
    // Expense(
    //   id: '5',
    //   title: 'Eat at restaurant',
    //   amount: 625.50,
    //   date: DateTime.now(),
    // ),
  ];

  List<Expense> get items {
    return [..._items];
  }
}
