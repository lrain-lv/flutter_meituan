import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MineItemWidget extends StatefulWidget {
  MineItemWidget({Key k, this.name, this.imgName}) : super(key: k);

  String name;
  String imgName;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MineItemState();
  }
}

class MineItemState extends State<MineItemWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 22,
            height: 22,
            child: Image.asset(widget.imgName),
          ),
          Container(
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 14, height: 1.2),
            ),
          ),
        ],
      ),
    );
  }
}
