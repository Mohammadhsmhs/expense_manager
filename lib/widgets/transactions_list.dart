import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transations;
  TransactionsList(this.transations);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transations.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Text(
                  "\$${tx.price}",
                  style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.name,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat("yyyy  MMMM d  EEEE  h:m a").format(tx.date),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          elevation: 10,
        );
      }).toList(),
    );
  }
}
