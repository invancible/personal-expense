import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import './add_new_expense.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  void openAddModal(BuildContext ctx, Expenses expenses) {
    showModalBottomSheet(
        context: ctx,
        builder: ((_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: AddNewExpense(
              expenses: expenses,
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<Expenses>(context);

    return FloatingActionButton(
      onPressed: () => openAddModal(context, expenses),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: const Icon(Icons.add),
    );
  }
}
