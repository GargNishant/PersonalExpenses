import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function function;

  AddTransaction(this.function);

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
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }

  // Using Anonymous Function here, as this Widget contains the Params which has to be passed. Unlike FlutterGuide, which has params that needs to be passed in diff class
  void _submitData() {
    if (titleController.text.isEmpty ||
        double.tryParse(amountController.text) <= 0) return;
    function(
        title: titleController.text,
        amount: double.tryParse(amountController.text));
  }
}
