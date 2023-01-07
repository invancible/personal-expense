import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  Widget buildChartItem(Map<String, Object> data, double percentage) {
    return Flexible(
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Text(
                data['day'].toString(),
                style: const TextStyle(
                  color: Colors.white54,
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: SizedBox(
                height: double.infinity,
                child: FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: percentage == 0.0 ? 0.1 : percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          percentage == 0.0 ? Colors.white10 : Colors.white60,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: double.infinity,
                child: FittedBox(
                  child: Text(
                    '₱${data['amount'].toString()}',
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<Expenses>(context);

    return Container(
      color: Colors.indigo,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        children: expenses.totalExpensesByDay
            .map(
              (data) => buildChartItem(
                  data,
                  expenses.totalExpenses == 0
                      ? 1
                      : (data['amount'] as double) / expenses.totalExpenses),
            )
            .toList(),
      ),
    );
  }
}
