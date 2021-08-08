import 'dart:math';

import 'package:expense_manager/models/transaction.dart';
import 'package:expense_manager/widgets/new_transaction.dart';
import 'package:expense_manager/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

class Usertransactions extends StatefulWidget {
  const Usertransactions({Key? key}) : super(key: key);

  @override
  _UsertransactionsState createState() => _UsertransactionsState();
}

class _UsertransactionsState extends State<Usertransactions> {
  final List<Transaction> _transations = [
    Transaction(date: DateTime.now(), id: 1, name: "shoes", price: 270),
    Transaction(date: DateTime.now(), id: 2, name: "shoes 2", price: 350),
  ];

  void _newTransaction(String title, double price) {
    final tx =
        Transaction(id: 2, date: DateTime.now(), name: title, price: price);
    setState(() {
      _transations.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_newTransaction),
        TransactionsList(_transations),
      ],
    );
  }
}
