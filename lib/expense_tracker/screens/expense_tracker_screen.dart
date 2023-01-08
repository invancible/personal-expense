import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../widgets/chart.dart';
import '../widgets/expense_list.dart';
import '../widgets/fab.dart';

class ExpenseTrackerScreen extends StatelessWidget {
  const ExpenseTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Expenses(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Personal Expense',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Column(
          children: [
            const Flexible(
              flex: 3, // 0.3 * 10 = 3
              child: Chart(),
            ),
            Flexible(
              flex: 7, // 0.7 * 10 = 7
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpenseList(),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Fab(),
      ),
    );
  }
}
