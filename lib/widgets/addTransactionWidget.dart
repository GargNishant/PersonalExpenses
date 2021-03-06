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
  DateTime _selectedDate = DateTime.now();

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
                SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: Container(
                      height: 20,
                      child: Text("Transaction Date: ${DateFormat.yMMMd().format(_selectedDate)}",)),
                ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      "Change Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicket,
                  ),
              ],
            ),
            RaisedButton(
              color: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
    if (titleController.text.isEmpty || double.tryParse(amountController.text) == null ||double.tryParse(amountController.text) <= 0)
      return;
    widget.function(
        title: titleController.text,
        amount: double.tryParse(amountController.text),
        selectedDate: _selectedDate
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicket() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
    ).then((value) {
      if (value == null)
        return;
      setState(() => _selectedDate = value);
    });
  }
}
