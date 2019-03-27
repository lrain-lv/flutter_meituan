import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gank/page_guide.dart';
import 'package:flutter_gank/page_splash.dart';
import 'package:flutter_gank/page_main.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gank Maseter',
      home: new SplashStateWidget(),
      routes: <String, WidgetBuilder>{
        '/MainPage': (BuildContext context) => new MainStateWidget(),
        '/GuidePage': (BuildContext context) => new GuideWidget(),
      },
    );
  }
}
