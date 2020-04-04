import 'package:flutter/material.dart';
import 'package:flutter_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
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
    return Column(
      // **** Use map method to convert a list of objects into a list of widgets
      // trans is the iterable of the transaction list.
      // return Card is the widget that I want to have for each object.
      children: _userTransactions.map((trans) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2.0),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${trans.amount}',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  trans.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  // Formats the date into a more readable String
//                        DateFormat().format(trans.date),
                  DateFormat.yMMMd().format(trans.date),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
