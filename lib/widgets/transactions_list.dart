import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionsList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: ((ctx, constraints) {
              return Column(
                children: [
                  Text("no transactions has been added yet !!!"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * .8,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            }),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransActionItem(
                  transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
