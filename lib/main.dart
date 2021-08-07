import 'package:expense_manager/transactions.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  final List<Transactions> transations = [
    Transactions(date: DateTime.now(), id: 1, name: "shoes", price: 270),
    Transactions(date: DateTime.now(), id: 2, name: "shoes 2", price: 350),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense Manager"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text(
                  "first card",
                  textScaleFactor: 1.7,
                  textAlign: TextAlign.center,
                ),
                elevation: 10,
                color: Colors.green,
                margin: EdgeInsets.all(10),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "Tile"),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Price"),
                      controller: priceController,
                    ),
                    TextButton(
                      onPressed: () => print(titleController.text),
                      child: Text(
                        "Add",
                      ),
                      style: TextButton.styleFrom(primary: Colors.redAccent),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transations.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat("yyyy  MMMM d  EEEE  h:m a")
                                .format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                  elevation: 10,
                );
              }).toList(),
            )
          ],
        ));
  }
}
