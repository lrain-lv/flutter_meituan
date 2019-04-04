import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuideWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GuideWidgetState();
  }
}

Future<void> save() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setInt("isFirst", 1);
}

class GuideWidgetState extends State<GuideWidget> {
  var images = [
    'images/ic_guide_pic_one.png',
    'images/ic_guide_pic_two.png',
    'images/ic_guide_pic_three.png'
  ];

  bool isVisible = false;

  SwiperController _controller;

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new SwiperController();
  }

  void onClick() {

    if (isVisible) {
      save().then((e) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/MainPage', (Route<dynamic> rout) => false);
      });
    }else{
      _controller.next();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
        data: ThemeData(
            primaryColor: Colors.black, scaffoldBackgroundColor: Colors.grey),
        child: new WillPopScope(
          child: Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Swiper(
                  controller: _controller,
                  itemCount: images.length,
                  containerHeight: MediaQuery.of(context).size.height,
                  pagination: new SwiperPagination(),
                  autoplay: false,
                  loop: false,
                  onIndexChanged: (i) {
                    index = i;
                    if (i == 2) {
                      setState(() {
                        isVisible = true;
                      });
                    } else {
                      setState(() {
                        isVisible = false;
                      });
                    }
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index],
                      fit: BoxFit.fitHeight,
                    );
                  },
                ),
                Positioned(
                  child: FlatButton(
                    onPressed: onClick,
                    child: Text(isVisible ? "DONE" : "NEXT"),
                    textColor: Colors.grey,
                    highlightColor: Colors.black26,
                  ),
                  right: 10,
                )
              ],
            ),
          ),
          onWillPop: () {},
        ));
  }
}
