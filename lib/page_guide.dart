import 'dart:async';

import 'package:flutter/material.dart';
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

save() async {
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
      child: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Swiper(
              itemCount: images.length,
              containerHeight: MediaQuery.of(context).size.height,
              pagination: new SwiperPagination(),
              autoplay: false,
              loop: false,
              onIndexChanged: (index) {
                if (index == 2) {
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
              child: Opacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (isVisible) {
                        save();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/MainPage', (Route<dynamic> rout) => false);
                      }
                    },
                    child: Text("去首页"),
                    color: Color.fromARGB(150, 255, 255, 255),
                    elevation: 0,
                    textColor: Colors.blue,
                  )),
              bottom: 60,
            )
          ],
        ),
      ),
      onWillPop: () {},
    );
  }
}
