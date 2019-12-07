import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;

  ReusableCard({@required this.cardColor, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: cardColor,
        ),
      ),
    );
  }
}
