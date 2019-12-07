import 'package:flutter/cupertino.dart';

class ReusableCardContent extends StatelessWidget {
  final Icon icon;
  final String text;

  ReusableCardContent({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff8d8e98),
          ),
        )
      ],
    );
  }
}
