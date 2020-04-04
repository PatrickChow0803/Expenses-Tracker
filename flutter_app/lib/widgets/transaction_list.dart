import 'package:flutter/material.dart';
import 'package:flutter_app/models/transaction.dart';
import 'package:flutter_app/models/transaction_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340.0,
      // If the list of transactions are empty, then display the column, else display the ListView.
      child: Provider.of<TransactionData>(context).userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transactions yet'),
                SizedBox(
                  height: 20.0,
                ),
                // Need a container here so that fit:BoxFit.cover knows how much height it should take.
                Container(
                  height: 300.0,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount:
                  Provider.of<TransactionData>(context).userTransactions.length,
              // Working with itemBuilder, for the return, you want to return the widget that you want to make equal to the amount of times of itemCount.
              itemBuilder: (context, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2.0),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        // toStringAsFixed determines the number of decimal points
                        '\$${Provider.of<TransactionData>(context).userTransactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Provider.of<TransactionData>(context)
                              .userTransactions[index]
                              .title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          // Formats the date into a more readable String
//                        DateFormat().format(trans.date),
                          DateFormat.yMMMd().format(
                              Provider.of<TransactionData>(context)
                                  .userTransactions[index]
                                  .date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 150.0,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.restore_from_trash,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Provider.of<TransactionData>(context, listen: false)
                            .deleteTransaction(Provider.of<TransactionData>(
                                    context,
                                    listen: false)
                                .userTransactions[index]);
                      },
                    )
                  ],
                ));
              },

              // **** Use map method to convert a list of objects into a list of widgets
              // trans is the iterable of the transaction list.
              // return Card is the widget that I want to have for each object.
            ),
    );
  }
}
