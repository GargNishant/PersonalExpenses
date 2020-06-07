import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double amountPercent;

  ChartBar(
      {@required this.label,
      @required this.amountSpent,
      @required this.amountPercent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("\$${amountSpent.toStringAsFixed(0)}"),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 50,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: amountPercent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
