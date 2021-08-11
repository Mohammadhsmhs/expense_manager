import 'package:expense_manager/models/transaction.dart';
import 'package:expense_manager/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;
  Chart(this._recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      var totalSum = 0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index));
      for (var i = 0; i < _recentTransactions.length; i++) {
        if (_recentTransactions[i].date.day == weekDay.day &&
            _recentTransactions[i].date.year == weekDay.year &&
            _recentTransactions[i].date.month == weekDay.month)
          totalSum += _recentTransactions[i].price;
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {"day": DateFormat.E().format(weekDay), "price": totalSum};
    }).reversed.toList();
  }

  double get totalSpentAmount {
    return groupedTransactionValues.fold(0.0, (sum, element) {
      return sum + (element["price"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      color: Theme.of(context).primaryColorLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                (data["price"] as double),
                (data["day"] as String),
                totalSpentAmount == 0.0
                    ? 0.0
                    : (data["price"] as double) / totalSpentAmount),
          );
        }).toList(),
      ),
      elevation: 10,
      margin: EdgeInsets.all(10),
    );
  }
}
