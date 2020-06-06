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

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              width: double.infinity,
              child: Card(
                color: Colors.amber,
                elevation: 5,
                child: Text(
                  "Chart Text",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount", prefixText: "\$ "),
                    controller: amountController,
                  ),
                  FlatButton(
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                  )
                ],
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
