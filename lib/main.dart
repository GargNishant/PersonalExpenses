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
              button: TextStyle(color: Colors.white),
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
  final List<Transaction> _transactions = [];
  bool _chartView = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.timeStamp
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: Text('Flutter App'), actions: <Widget>[
      IconButton(
          icon: Icon(Icons.add), onPressed: () => _startNewTransaction(context))
    ]);

    final _scaffoldSize = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
            child: MediaQuery.of(context).orientation == Orientation.landscape
                ? _landscapeMode(_scaffoldSize)
                : _portraitMode(_scaffoldSize)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }

  Widget _portraitMode(var _scaffoldSize) {
    return Column(children: <Widget>[
      _recentTransactions.isEmpty
          ? Container(
              height: (_scaffoldSize) * 0.25,
              width: double.infinity,
            )
          : Container(
              height: (_scaffoldSize) * 0.25,
              child: ChartWidget(_recentTransactions)),
      Container(
          height: (_scaffoldSize) * 0.75,
          child: TransactionList(_transactions, _deleteTransaction))
    ]);
  }

  Widget _landscapeMode(var _scaffoldSize) {
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text("Show Chart",
            style: TextStyle(color: Theme.of(context).primaryColor)),
        Switch(
            value: _chartView,
            onChanged: (value) {
              setState(() => _chartView = value);
            }),
      ]),
      _chartView
          ? Container(
              height: (_scaffoldSize) * 0.75,
              child: ChartWidget(_recentTransactions))
          : Container(
              height: (_scaffoldSize) * 0.75,
              child: TransactionList(_transactions, _deleteTransaction))
    ]);
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTransaction(_addNewTransaction)),
              ));
        });
  }

  void _addNewTransaction(
      {@required String title,
      @required double amount,
      @required DateTime selectedDate}) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        timeStamp: selectedDate,
        description: "Newly Added",
        id: DateTime.now().toString());

    setState(() {
      _transactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }
}
