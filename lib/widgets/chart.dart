import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/models/transaction.dart';
import 'package:personalexpenses/widgets/chart_bar.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransaction;

  ChartWidget(this.recentTransaction);

  List<Map<String, Object>> get groupTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: (6-index)));

      var weekDate = DateFormat("yyyy-MM-dd").format(weekDay);
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        Transaction item = recentTransaction[i];
        var itemDate = DateFormat("yyyy-MM-dd").format(item.timeStamp);
        if (itemDate == weekDate)
          totalSum += item.amount;
      }
      print(DateFormat.E().format(weekDay).substring(0, 1));
      print(totalSum.toString());
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get maxSpending {
    return groupTransactionsValues.fold(0.0, (value, element) {
      return value + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: recentTransaction.isNotEmpty
          ? Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: groupTransactionsValues.map((tx) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          label: tx['day'],
                          amountSpent: tx['amount'],
                          amountPercent: maxSpending == 0.0
                              ? 0.0
                              : (tx['amount'] as double) / maxSpending),
                    );
                  }).toList()),
            )
          : Container(),
    );
  }
}
