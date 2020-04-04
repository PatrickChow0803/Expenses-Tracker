import 'package:flutter/material.dart';
import 'package:flutter_app/models/transaction_data.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Create is the data that I want to share
      create: (BuildContext context) => TransactionData(),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple, accentColor: Colors.yellowAccent),
        home: HomeScreen(),
      ),
    );
  }
}
