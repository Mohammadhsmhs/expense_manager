import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransActionItem extends StatelessWidget {
  const TransActionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(2),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          radius: 30,
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "\$${transaction.price.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.name,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat("yyyy  MMMM d  EEEE  h:mm a").format(transaction.date),
          style: TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 420
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text("Delete"),
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
      elevation: 20,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }
}
