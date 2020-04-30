import 'package:flutter/material.dart';

import 'CreditCard.dart';
import 'TransactionHeader.dart';

class Dark extends StatefulWidget {
  final bool active;
  final double slide;
  final double h;
  final double w;
  final Function onTap;
  final double animVal;
  Dark(
      {Key key,
      this.active,
      this.slide,
      this.h,
      this.w,
      this.onTap,
      this.animVal})
      : super(key: key);

  @override
  _DarkState createState() => _DarkState();
}

class _DarkState extends State<Dark> {
  bool dark = true;
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

  void _toggleTheme() {
    setState(() {
      dark = !dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0),
          child: Container(
            width: widget.w - 2 * 16,
            height: widget.h,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                GestureDetector(
                    onTap: widget.onTap, child: CreditCard(dark: dark)),
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
                Expanded(
                  flex: 1,
                  child: Opacity(
                    opacity: widget.active ? 1 - widget.animVal : 1,
                    child: ListView(
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      children: <Widget>[
                        for (transaction in transactions)
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            dense: true,
                            trailing: AmountText(
                                text: transaction['amount'], color: primary),
                            leading: CircleAvatar(
                              backgroundColor:
                                  dark ? Color(0xffDCDFE0) : Color(0xffefefef),
                              radius: 20,
                              child: Image.asset(
                                transaction['logo'],
                                color: Color(0xff354D57),
                                height: 30,
                                width: transaction['width'],
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: BigText(
                                text: transaction['name'], color: primary),
                            subtitle: SmallText(
                                text: transaction['type'], color: grey),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // floatingActionButton: FloatingActionButton(
    //   onPressed: _toggleTheme,
    //   tooltip: 'Increment',
    //   child: Icon(Icons.add),
    // ), //
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
