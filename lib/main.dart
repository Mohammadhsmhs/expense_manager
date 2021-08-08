import 'package:expense_manager/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense Manager"),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                Usertransactions(),
              ]),
        ));
  }
}
