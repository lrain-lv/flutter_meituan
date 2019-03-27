import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashState();
  }
}

class SplashState extends State<SplashStateWidget> {
  var image = new Image.asset(
    "images/icon_splash.png",
    fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: new Container(
          color: Colors.white,
          child: image,
        ),
        onWillPop: () {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown();
  }

  Future<int> get() async {
    try {
      var isFirst;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isFirst = prefs.getInt("isFirst");
      return isFirst;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void countDown() {
    var duration = new Duration(milliseconds: 2000);
    new Future.delayed(duration, () {
      get().then((isFirst) {
        print(isFirst);
        if (isFirst == null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/GuidePage', (Route<dynamic> rout) => false);
        } else if (isFirst == 1) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/MainPage', (Route<dynamic> rout) => false);
        }
      });
    });
  }
}
