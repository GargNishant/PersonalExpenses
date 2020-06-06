
import 'package:flutter/material.dart';
import 'package:personalexpenses/models/transaction.dart';
import 'package:personalexpenses/widgets/addTransactionWidget.dart';
import 'package:personalexpenses/widgets/transactionWidget.dart';

class UserTransaction extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction>{
  final List<Transaction> trans = [
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 19.99,
        description: "Bought new Shoes",
        timeStamp: DateTime.now()),
    Transaction(
        id: "t2",
        title: "New Phone",
        amount: 199.9,
        description: "Bought new Gadget",
        timeStamp: DateTime.now()),
    Transaction(
        id: "t3",
        title: "New Laptop",
        amount: 9.99,
        description: "Bought new Gadget",
        timeStamp: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(),
        Column(
          children: trans.map((tx) {
            return TransWidget(tx);
          }).toList(),
        ),
      ],
    );
  }

}