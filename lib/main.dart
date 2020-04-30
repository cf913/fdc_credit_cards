import 'package:flutter/material.dart';

import 'Light.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Color> animation;
  Animation curvedAnim;
  int _current = 0;

  bool dark = true;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    curvedAnim = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutExpo,
    );
  }

  Future<void> _toggle() async {
    await animationController.forward();
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      _current = (_current - 1).abs();
      dark = !dark;
    });
    animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var maxSlide = h * 0.83;

    var animation = ColorTween(
      begin: dark ? Color(0xff354D57) : Color(0xffDCDFE0),
      end: !dark ? Color(0xff354D57) : Color(0xffDCDFE0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutQuint,
    ));

    return Scaffold(
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            double slide = maxSlide * curvedAnim.value;
            double animVal = curvedAnim.value;
            return Container(
              color: animation.value,
              width: width,
              child: Stack(
                children: _current == 0
                    ? <Widget>[
                        Light(
                            dark: false,
                            active: true,
                            slide: slide,
                            animVal: animVal,
                            h: h,
                            w: width,
                            onTap: _toggle),
                        Light(
                            dark: true,
                            active: false,
                            slide: slide,
                            animVal: animVal,
                            h: h,
                            w: width,
                            onTap: _toggle),
                      ]
                    : <Widget>[
                        Light(
                            dark: true,
                            active: true,
                            slide: slide,
                            animVal: animVal,
                            h: h,
                            w: width,
                            onTap: _toggle),
                        Light(
                            dark: false,
                            active: false,
                            slide: slide,
                            animVal: animVal,
                            h: h,
                            w: width,
                            onTap: _toggle),
                      ],
              ),
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _toggle,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), //
    );
  }
}
