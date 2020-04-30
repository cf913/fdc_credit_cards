import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final bool dark;

  CreditCard({this.dark});

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width;
    double cardHeight = cardWidth / 1.686;
    var theGradient = dark
        ? [const Color(0xFF48626D), const Color(0xFF0C232C)]
        : [const Color(0xFFFFFFFF), const Color(0xFFC6CACC)];
    var textColor = dark ? Color(0xffB3BDC2) : Color(0xff556870);
    var numColor = dark ? Color(0xffA3ADB2) : Color(0xff556870);
    var masterCardColor = dark
        ? [Color.fromRGBO(200, 200, 200, .3), Color.fromRGBO(200, 200, 200, .7)]
        : [
            Color.fromRGBO(100, 100, 100, .4),
            Color.fromRGBO(200, 200, 200, .7)
          ];
    var walue = dark ? '\$4 735' : '\$2 768';
    var expDate = dark ? '07/24' : '09/24';
    var num = dark
        ? ['5335', '1234', '5678', '9012']
        : ['5335', '1234', '1471', '9013'];
    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .5),
              offset: Offset(15.0, 12.0), //(x,y)
              blurRadius: 35.0,
              spreadRadius: -2.0),
        ],
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment(-1, -1),
          end: Alignment(0.9, 0.9),
          colors: theGradient,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // TOP ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dark ? 'black card' : 'white card',
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 12),
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: 25,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: masterCardColor[0],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: masterCardColor[1],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // MIDDLE ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  num[0],
                  style: TextStyle(
                    letterSpacing: 6,
                    fontSize: 20,
                    color: numColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  num[1],
                  style: TextStyle(
                    letterSpacing: 6,
                    fontSize: 20,
                    color: numColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  num[2],
                  style: TextStyle(
                    letterSpacing: 6,
                    fontSize: 20,
                    color: numColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  num[3],
                  style: TextStyle(
                    letterSpacing: 6,
                    fontSize: 20,
                    color: numColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // BOTTOM ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  expDate,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ),
                Text(
                  walue,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
