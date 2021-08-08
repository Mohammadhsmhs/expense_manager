import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTransaction;
  NewTransaction(this.newTransaction);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final priceController = TextEditingController();
    return Card(
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
              onPressed: () => {
                newTransaction(
                    titleController.text, double.parse(priceController.text))
              },
              child: Text(
                "Add",
              ),
              style: TextButton.styleFrom(primary: Colors.redAccent),
            )
          ],
        ),
      ),
    );
  }
}
