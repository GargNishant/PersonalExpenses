import 'package:flutter/material.dart';
import 'package:personalexpenses/widgets/userTransaction.dart';

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
          UserTransaction(),
        ],
      ),
    );
  }
}
