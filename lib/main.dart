import 'package:flutter/material.dart';
import 'package:personalexpenses/transWidget.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.amber,
              elevation: 5,
              child: Text(
                "Chart Text",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: trans.map((tx) {
              return TransWidget(tx);
            }).toList(),
          )
        ],
      ),
    );
  }
}
