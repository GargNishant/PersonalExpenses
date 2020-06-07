
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
      child: transactions.isEmpty ?
        Column(children: <Widget>[
          Text("Waiting for 1st Transactions", style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 20,),
          Container(height: 250,child: Image.asset("assets/images/waiting.png",fit: BoxFit.cover,)),
        ],)
        :
        ListView.builder(
        itemBuilder: (ctX,index){
          return TransWidget(transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }

}