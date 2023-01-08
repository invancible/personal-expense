import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

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
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Expense(
      id: '3',
      title: 'Tuition',
      amount: 5000,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Expense(
      id: '4',
      title: 'Upgrade RAM',
      amount: 3500,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Expense(
      id: '5',
      title: 'Eat at restaurant',
      amount: 625.50,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Expense(
      id: '6',
      title: 'New Earpods',
      amount: 2450,
      date: DateTime.now().subtract(const Duration(days: 5)),
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
  ];

  List<Expense> get items {
    return [..._items];
  }

  // Get the expenses history for the last 7 days
  List<Expense> get recentExpenses {
    return _items.where((expense) {
      return expense.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  // Sum up the total expenses for a day
  List<Map<String, Object>> get totalExpensesByDay {
    const DAYS_IN_WEEK = 7;

    return List.generate(DAYS_IN_WEEK, (index) {
      // get a Single day
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalExpense = 0.0;

      for (var i = 0; i < recentExpenses.length; i++) {
        if (recentExpenses[i].date.day == weekDay.day &&
            recentExpenses[i].date.month == weekDay.month &&
            recentExpenses[i].date.year == weekDay.year) {
          totalExpense += recentExpenses[i].amount;
        }
      }
      // print(totalExpense.toString());
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalExpense,
      };
    }).reversed.toList();
  }

  double get totalExpenses {
    return totalExpensesByDay.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  void addExpense(String title, double amount, DateTime date) {
    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    _items.add(newExpense);
    notifyListeners();
  }

  void deleteExpense(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
