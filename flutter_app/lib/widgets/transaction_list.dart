import 'package:flutter/material.dart';
import 'package:flutter_app/models/transaction.dart';
import 'package:flutter_app/models/transaction_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // **** Use map method to convert a list of objects into a list of widgets
      // trans is the iterable of the transaction list.
      // return Card is the widget that I want to have for each object.
      children:
          Provider.of<TransactionData>(context).userTransactions.map((trans) {
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
