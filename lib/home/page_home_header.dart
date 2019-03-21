import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'page_menu.dart';
import 'page_banner.dart';
import 'package:flutter_gank/entity/banner_entity.dart';

class HomeListHeader extends StatefulWidget {
  BannerEntity entity;

  double bannerHeight;

  HomeListHeader({Key k, this.entity, this.bannerHeight}) : super(key: k);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeListHeaderWidget();
  }
}

class HomeListHeaderWidget extends State<HomeListHeader> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        HomeMenu(),
        HomeBanner(
          entity: widget.entity,
          bannerHeight: widget.bannerHeight,
        ),
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            "- 猜你喜欢 -",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
      ],
    );
  }
}
