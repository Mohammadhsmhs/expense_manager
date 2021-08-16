import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionsList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 580,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text("no transactions has been added yet !!!"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
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
                              "\$${transactions[index].price.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Colors.red.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DateFormat("yyyy  MMMM d  EEEE  h:mm a")
                            .format(transactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(transactions[index].id),
                      ),
                    ),
                    // child: Row(
                    // children: [
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 12),
                    //   padding:
                    //       EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black, width: 2),
                    //   ),
                    //   child: Text(
                    //     "\$${transactions[index].price.toStringAsFixed(2)}",
                    //     style: TextStyle(
                    //         color: Colors.red.shade900,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w800),
                    //   ),
                    // ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           transactions[index].name,
                    //           style: TextStyle(
                    //               fontSize: 17, fontWeight: FontWeight.bold),
                    //         ),
                    //         Text(
                    //           DateFormat("yyyy  MMMM d  EEEE  h:m a")
                    //               .format(transactions[index].date),
                    //           style: TextStyle(color: Colors.grey),
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // ),
                    elevation: 20,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
