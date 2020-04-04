import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/transaction.dart';
import 'dart:collection';

class TransactionData extends ChangeNotifier {
  final List<Transaction> _userTransactions = [
//    Transaction(
//      id: 't1',
//      title: 'New Shoes',
//      amount: 69.99,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'Weekly Groceries',
//      amount: 16.53,
//      date: DateTime.now(),
//    ),
  ];

  UnmodifiableListView<Transaction> get userTransactions {
    return UnmodifiableListView(_userTransactions);
  }

  // Get a list of transactions that occurred within a 7 day period
  List<Transaction> get recentTransactions {
    return _userTransactions.where((trans) {
      return trans.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addTransaction(String title, double amount) {
    final transaction = Transaction(
      id: _userTransactions.length.toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    _userTransactions.add(transaction);
    notifyListeners();
  }
}
