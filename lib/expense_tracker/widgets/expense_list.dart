import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

// ignore: must_be_immutable
class ExpenseList extends StatelessWidget {
  ExpenseList({super.key});

  var counter = 0;

  Color getRandomColor() {
    const List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.orange,
    ];
    if (counter == colors.length) {
      counter = 0;
    }
    Color selected = colors[counter];
    counter++;

    return selected;
  }

  // List of Expenses (Item)
  Widget builderExpenseItem(Expense item, BuildContext ctx) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: getRandomColor(),
          foregroundColor: Colors.white,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                '₱${item.amount}',
                style: Theme.of(ctx).textTheme.labelLarge,
              ),
            ),
          ),
        ),
        title: Text(
          item.title,
          style: Theme.of(ctx).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat.yMMMMd().format(item.date)),
        trailing: IconButton(
          onPressed: (() {}),
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<Expenses>(context);

    return expenses.items.isEmpty
        ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/no_expense.png'),
                Text(
                  'No Expense Transaction Yet!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: expenses.items.length,
            itemBuilder: ((_, i) =>
                builderExpenseItem(expenses.items[i], context)),
          );
  }
}
