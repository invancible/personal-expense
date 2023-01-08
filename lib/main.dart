import 'package:flutter/material.dart';

import './expense_tracker/screens/expense_tracker_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData theme = ThemeData(
    fontFamily: 'Montserrat',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expense',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.indigo,
          secondary: Colors.blue,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            color: Colors.white,
          ),
          titleMedium: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const ExpenseTrackerScreen(),
    );
  }
}
