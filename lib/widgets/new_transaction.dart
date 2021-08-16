import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransaction;
  NewTransaction(this.newTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _priceController = TextEditingController();

  var _pickedDate;

  void _submitTransaction() {
    final title = _titleController.text;
    final price = double.parse(_priceController.text);

    if (title.isEmpty || price <= 0) return;
    widget.newTransaction(title, price);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    _pickedDate = value;
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleController,
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Price"),
              controller: _priceController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransaction(),
            ),
            Container(
              height: 55,
              child: Row(
                children: [
                  Text(_pickedDate == null
                      ? "no date"
                      : DateFormat.yMd().format(_pickedDate)),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        "choose a date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitTransaction,
              child: Text(
                "Add",
              ),
              style: TextButton.styleFrom(
                  primary: Theme.of(context).textTheme.button!.color),
            )
          ],
        ),
      ),
    );
  }
}
