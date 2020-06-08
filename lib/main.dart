import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personalexpenses/models/transaction.dart';
import 'package:personalexpenses/widgets/addTransactionWidget.dart';
import 'package:personalexpenses/widgets/chart.dart';
import 'package:personalexpenses/widgets/transactionList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        accentColorBrightness: Brightness.dark,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
          bodyText2: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 14,
          ),
          button: TextStyle(color:Colors.white),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(fontFamily: "OpenSans", fontSize: 20),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
//    Transaction(
//        id: "t1",
//        title: "New Shoes",
//        amount: 19.99,
//        description: "Bought new Shoes",
//        timeStamp: DateTime.now()),
//    Transaction(
//        id: "t2",
//        title: "New Phone",
//        amount: 199.9,
//        description: "Bought new Gadget",
//        timeStamp: DateTime.now()),
//    Transaction(
//        id: "t3",
//        title: "New Laptop",
//        amount: 9.99,
//        description: "Bought new Gadget",
//        timeStamp: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.timeStamp
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startNewTransaction(context),
          )
        ],
      ),
      //
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ChartWidget(_recentTransactions),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: AddTransaction(_addNewTransaction),
        );
      },
    );
  }

  void _addNewTransaction({String title, double amount}) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        timeStamp: DateTime.now(),
        description: "Newly Added",
        id: DateTime.now().toString());

    setState(() {
      _transactions.add(newTx);
    });
  }
}
