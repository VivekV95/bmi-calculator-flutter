import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final Function onClick;

  ReusableCard({@required this.cardColor, this.cardChild, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        margin: EdgeInsets.all(16),
        elevation: 4,
        child: Container(
          child: cardChild,
          decoration: BoxDecoration(
            color: cardColor,
          ),
        ),
      ),
    );
  }
}
