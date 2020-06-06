
import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget{
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
            ),
          ],
        ),
      ),
    );
  }

}