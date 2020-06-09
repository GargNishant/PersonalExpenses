import 'package:flutter/material.dart';
import 'package:personalexpenses/models/transaction.dart';
import 'package:personalexpenses/widgets/transactionWidget.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteFunction;

  TransactionList(this.transactions, this._deleteFunction);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "Waiting for 1st Transactions",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                      height: constraints.maxHeight * 0.5,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctX, index) {
                  return TransWidget(transactions[index], _deleteFunction);
                },
                itemCount: transactions.length,
              );
      },
    );
  }
}
