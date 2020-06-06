
import 'package:flutter/material.dart';
import 'package:personalexpenses/models/transaction.dart';
import 'package:personalexpenses/widgets/transactionWidget.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions = List();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return TransWidget(tx);
      }).toList(),
    );
  }

}