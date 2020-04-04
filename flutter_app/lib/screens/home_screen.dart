import 'package:flutter/material.dart';
import 'package:flutter_app/models/transaction.dart';

class HomeScreen extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child: Text('Chart Placeholder'),
              ),
            ),
            Column(
                // **** Use map method to convert a list of objects into a list of widgets
                // trans is the iterable of the transaction list.
                // return Card is the widget that I want to have for each object.
                children: transactions.map((trans) {
              return Card(
                child: Text(trans.title),
              );
            }).toList())
          ],
        ));
  }
}
