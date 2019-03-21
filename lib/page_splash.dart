import 'package:flutter/material.dart';

class SplashStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashState();
  }
}

class SplashState extends State<SplashStateWidget> {
  var image = new Image.asset(
    "images/icon_splash.jpg",
    fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
      child: image,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown();
  }

  void countDown() {
    var duration = new Duration(milliseconds: 2500);
    new Future.delayed(duration, () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/MainPage', (Route<dynamic> rout) => false);
    });
  }
}
