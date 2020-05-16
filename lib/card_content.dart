import 'package:flutter/material.dart';
import 'constants.dart';
class CardContent extends StatelessWidget {
  CardContent({ this.icon,@required this.text});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            icon,
            size:80.0,
            color: kIconColor,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text, style:kLabelTextStyle)
      ],
    );
  }
}
