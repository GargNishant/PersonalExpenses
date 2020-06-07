
import 'package:flutter/material.dart';
import 'package:personalexpenses/models/transaction.dart';
import 'package:personalexpenses/widgets/transactionWidget.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctX,index){
          return TransWidget(transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }

}