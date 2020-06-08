import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function function;

  AddTransaction(this.function);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: "Amount", prefixText: "\$ "),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
              controller: amountController,
            ),
            Row(
              children: <Widget>[
                SizedBox(height: 60,),
                Container(height: 20,child: Text(DateFormat.yMMMd().format(DateTime.now()),)),
                Container(
                  height: 20,
                  padding: EdgeInsets.only(bottom: 2),
                  child: FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text("Change Date",style: TextStyle(fontWeight: FontWeight.bold),),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            RaisedButton(
              color: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              textColor: Theme.of(context).textTheme.button.color,
              child: Text("Add Transaction"),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() {
    if (titleController.text.isEmpty ||
        double.tryParse(amountController.text) <= 0) return;
    widget.function(
        title: titleController.text,
        amount: double.tryParse(amountController.text));
    Navigator.of(context).pop();
  }
}
