import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double totalAmount;
  final String day;
  final double percentageOfWeekk;

  ChartBar(this.totalAmount, this.day, this.percentageOfWeekk);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * .05,
          ),
          Container(
              height: constraints.maxHeight * .12,
              child: FittedBox(
                  child: Text("\$${totalAmount.toStringAsFixed(0)}"))),
          Container(
            margin: EdgeInsets.symmetric(vertical: constraints.maxHeight * .03),
            height: constraints.maxHeight * .60,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white70,
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentageOfWeekk,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[600],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: FittedBox(child: Text("$day")),
            height: constraints.maxHeight * .12,
          ),
          SizedBox(
            height: constraints.maxHeight * .05,
          ),
        ],
      );
    });
  }
}
