import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void startAddNewTransaction(BuildContext context) {
    // Builder is the widget that you want to be made.
    showModalBottomSheet(
      context: context,
      builder: (buildContext) {
        return NewTransaction(
          titleController: titleController,
          amountController: amountController,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gets rid of the bottom overflow problem
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              startAddNewTransaction(context);
            },
          )
        ],
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
          TransactionList(),
        ],
      ),
      // Places the FAB on the center bottom of the app.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
    );
  }
}

class NewTransaction extends StatelessWidget {
  const NewTransaction({
    Key key,
    @required this.titleController,
    @required this.amountController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              keyboardType: TextInputType.number,
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

                  // Gets rid of the keyboard when pressing the button
                  FocusScope.of(context).unfocus();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
