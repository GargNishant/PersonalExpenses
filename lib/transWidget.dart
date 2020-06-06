import 'package:flutter/material.dart';
import 'package:personalexpenses/transaction.dart';
import 'package:intl/intl.dart';

class TransWidget extends StatelessWidget {
  final Transaction trans;

  TransWidget(this.trans);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 40,
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "\$${trans.amount}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple),
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  trans.title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  DateFormat.yMEd().format(trans.timeStamp),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
