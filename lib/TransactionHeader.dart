import 'package:flutter/material.dart';

class TransactionHeader extends StatelessWidget {
  final Color grey;

  final Color bgColor;

  const TransactionHeader({Key key, this.bgColor, this.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 18;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: grey),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.multiline_chart,
              color: grey,
            ),
          ),
        ),
        Text(
          'TRANSACTIONS HISTORY',
          style: TextStyle(
              color: grey,
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.w700),
        ),
        Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: grey),
              borderRadius: BorderRadius.circular(radius)),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.search,
              color: grey,
            ),
          ),
        ),
      ],
    );
  }
}
