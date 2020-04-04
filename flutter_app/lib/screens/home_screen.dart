import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/transaction.dart';
import 'package:flutter_app/models/transaction_data.dart';
import 'package:flutter_app/widgets/transaction_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
//  String titleInput;
//  String amountInput;

  // This is another way of storing input by use of controllers.
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Gets rid of the bottom overflow problem
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child: Text('Chart Placeholder'),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
//                      onChanged: (value) {
//                        titleInput = value;
//                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
//                      onChanged: (value) => amountInput = value,
                    ),

                    // Add transaction button
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: FlatButton(
                        child: Text('Add Transaction'),
                        textColor: Colors.purple,
                        onPressed: () {
                          Provider.of<TransactionData>(context, listen: false)
                              .addTransaction(titleController.text,
                                  double.parse(amountController.text));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            TransactionList(),
          ],
        ));
  }
}
