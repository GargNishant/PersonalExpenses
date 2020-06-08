import 'package:flutter/material.dart';
import 'package:personalexpenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransWidget extends StatelessWidget {
  final Transaction trans;
  final Function _deleteTransaction;
  TransWidget(this.trans,this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColorLight,
          foregroundColor: Theme.of(context).primaryColorDark,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: FittedBox(
              child: Text(
                trans.amount < 1000
                    ? "\$${trans.amount.toStringAsFixed(1)}"
                    : "\$${(trans.amount / 1000).toStringAsFixed(1)}k",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          trans.title.toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMMd().format(trans.timeStamp)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => _deleteTransaction(trans.id),
        ),
      ),
    );
  }
}
