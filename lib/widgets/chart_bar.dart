import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double totalAmount;
  final String day;
  final double percentageOfWeekk;

  ChartBar(this.totalAmount, this.day, this.percentageOfWeekk);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
            height: 20,
            child:
                FittedBox(child: Text("\$${totalAmount.toStringAsFixed(0)}"))),
        Container(
          margin: EdgeInsets.symmetric(vertical: 3),
          height: 75,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 75,
                width: 10,
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
        Text("$day"),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
