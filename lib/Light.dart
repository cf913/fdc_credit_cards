import 'package:flutter/material.dart';

import 'CreditCard.dart';
import 'TransactionHeader.dart';

class Light extends StatefulWidget {
  final bool active;
  final double slide;
  final double h;
  final double w;
  final Function onTap;
  final double animVal;
  final bool dark;
  Light(
      {Key key,
      this.active,
      this.slide,
      this.dark,
      this.h,
      this.w,
      this.onTap,
      this.animVal})
      : super(key: key);

  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {
  var transactionsDark = [
    {
      'logo': 'images/netflix.png',
      'width': 25.0,
      'name': 'NETFLIX',
      'type': 'Cinema',
      'amount': '-\$12'
    },
    {
      'logo': 'images/maccas.png',
      'width': 27.0,
      'name': 'MCDONALDS',
      'type': 'Restaurants',
      'amount': '-\$6'
    },
    {
      'logo': 'images/apple.png',
      'width': 15.0,
      'name': 'OKKO',
      'type': 'Petrol',
      'amount': '-\$43'
    },
    {
      'logo': 'images/glovo.png',
      'width': 30.0,
      'name': 'GLOVO',
      'type': 'Delivery',
      'amount': '-\$9'
    },
    {
      'logo': 'images/apple.png',
      'name': 'APPLE',
      'width': 15.0,
      'type': 'Gadgets & Technology',
      'amount': '-\$1 299'
    },
    {
      'logo': 'images/nike.png',
      'width': 28.0,
      'name': 'NIKE',
      'type': 'Sportswear',
      'amount': '-\$38'
    },
  ];
  var transactionsLight = [
    {
      'logo': 'images/mike.png',
      'width': 20.0,
      'name': 'MIKE PHOENIX',
      'type': 'Refill from card',
      'amount': '+\$800'
    },
    {
      'logo': 'images/ps.png',
      'width': 27.0,
      'name': 'PLAYSTATION',
      'type': 'Payments',
      'amount': '-\$199'
    },
    {
      'logo': 'images/uber.png',
      'width': 30.0,
      'name': 'UBER',
      'type': 'Taxi',
      'amount': '-\$43'
    },
    {
      'logo': 'images/zara.png',
      'width': 30.0,
      'name': 'ZARA',
      'type': 'Clothes',
      'amount': '-\$69'
    },
    {
      'logo': 'images/apple.png',
      'name': 'APPLE',
      'width': 15.0,
      'type': 'Gadgets & Technology',
      'amount': '-\$699'
    },
    {
      'logo': 'images/maccas.png',
      'width': 28.0,
      'name': 'MCDONALDS',
      'type': 'Restaurants',
      'amount': '-\$19'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var dark = !widget.dark;
    var grey = dark ? Color(0xffA3ADB2) : Color(0xff838DA2);
    var primary = dark ? Color(0xffDCDFE0) : Color(0xff354D57);
    var bgColor = dark ? Color(0xff354D57) : Color(0xffDCDFE0);
    var transactions = dark ? transactionsDark : transactionsLight;
    var transaction;
    return Positioned(
      top: widget.active ? 0 : widget.h * 0.83,
      left: 0,
      child: Transform.translate(
        offset: Offset(0, -widget.slide),
        child: Container(
          width: widget.w,
          height: widget.h,
          child: Stack(
            // direction: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0),
                child: Column(
                  children: <Widget>[
                    Transform.translate(
                      offset: widget.active
                          ? Offset(
                              0,
                              (transactions.length + 1) *
                                  -1000 *
                                  widget.animVal)
                          : Offset(0, 0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap: widget.onTap,
                              child: CreditCard(dark: dark)),
                          SizedBox(
                            height: 25,
                          ),
                          TransactionHeader(grey: grey, bgColor: bgColor),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              SmallText(text: 'Today', color: grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Opacity(
                        opacity: widget.active ? 1 - widget.animVal / 2 : 1,
                        child: ListView(
                          physics: ClampingScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          children: <Widget>[
                            for (var index = 0;
                                index < transactions.length;
                                index++)
                              Transform.translate(
                                offset: widget.active
                                    ? Offset(
                                        0,
                                        (transactions.length - index) *
                                            -500 *
                                            widget.animVal)
                                    : Offset(
                                        0,
                                        (index * index * index) *
                                            100 *
                                            (1 - widget.animVal)),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  dense: true,
                                  trailing: AmountText(
                                      text: transactions[index]['amount'],
                                      color: primary),
                                  leading: CircleAvatar(
                                    backgroundColor: dark
                                        ? Color(0xffDCDFE0)
                                        : Color(0xffefefef),
                                    radius: 20,
                                    child: Image.asset(
                                      transactions[index]['logo'],
                                      color: Color(0xff354D57),
                                      height: 30,
                                      width: transactions[index]['width'],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  title: BigText(
                                      text: transactions[index]['name'],
                                      color: primary),
                                  subtitle: SmallText(
                                      text: transactions[index]['type'],
                                      color: grey),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 153, // for LG v30+ make this -164,
                right: 0,
                left: 0,
                child: Transform.translate(
                  offset: widget.active
                      ? Offset(0, 0)
                      : Offset(
                          0,
                          (transactions.length + 1) *
                              (transactions.length + 1) *
                              (transactions.length + 1) *
                              100 *
                              (1 - widget.animVal),
                        ),
                  child: Opacity(
                    opacity: widget.active ? 0 : 1,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0),
                      child: Transform.translate(
                        offset: Offset(0.0, 0.0),
                        child: GestureDetector(
                          child: CreditCard(
                            dark: !dark,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final Color color;
  final String text;

  const SmallText({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600));
  }
}

class BigText extends StatelessWidget {
  final Color color;
  final String text;

  const BigText({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w600));
  }
}

class AmountText extends StatelessWidget {
  final Color color;
  final String text;

  const AmountText({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            TextStyle(color: color, fontSize: 19, fontWeight: FontWeight.w500));
  }
}
