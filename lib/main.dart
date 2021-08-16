import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                button: TextStyle(color: Colors.white),
              )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(date: DateTime.now(), id: 1, name: "shoes", price: 270),
    // Transaction(date: DateTime.now(), id: 2, name: "shoes 2", price: 350),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _newTransaction(String title, double price) {
    final tx =
        Transaction(id: 2, date: DateTime.now(), name: title, price: price);
    setState(() {
      _transactions.add(tx);
    });
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_newTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
        actions: [
          IconButton(
              onPressed: () => _startAddTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: double.infinity,
                child: Chart(_recentTransactions),
              ),
              TransactionsList(_transactions),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
