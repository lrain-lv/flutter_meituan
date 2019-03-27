import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gank/common.dart';

// ignore: must_be_immutable
class NearbyHeaderViewWidget extends StatefulWidget {
  int selectionIndex = 0;

  String title;

  var callback;

  NearbyHeaderViewWidget(
      {Key k, this.selectionIndex, this.title, this.callback})
      : super(key: k);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NearbyHeaderViewState();
  }
}

var meishi = ['全部', '面包甜点', '小吃快餐', '川湘菜', '日韩料理', '台湾菜'];

class NearbyHeaderViewState extends State<NearbyHeaderViewWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    String selectedName = meishi[widget.selectionIndex];
    super.build(context);
    return Container(
      height: widget.title == "全部" ? 0 : 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: buildWidgets(widget.title, widget.selectionIndex),
        ),
      ),
    );
  }

  List<Widget> buildWidgets(String title, int selectedIndex) {
    switch (title) {
      case "享美食":
        String selectedName = meishi[selectedIndex];
        return meishi.map((name) {
          try {
            int index = meishi.indexOf(name);
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                margin: EdgeInsets.only(left: 10),
                decoration: name != selectedName
                    ? null
                    : new BoxDecoration(
                        color: Color.fromARGB(255, 255, 193, 193),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 14,
                      color: name == selectedName
                          ? Colors.redAccent
                          : Colors.black),
                ),
              ),
              onTap: () {
                if (index == selectedIndex) {
                  return;
                }
                widget.callback(index);
              },
            );
          } catch (e) {}
        }).toList();
        break;
      case "住酒店":
        String selectedName = CommonUtil.hotel[selectedIndex];
        return CommonUtil.hotel.map((name) {
          int index = CommonUtil.hotel.indexOf(name);
          return GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
                margin: EdgeInsets.only(left: 10),
                decoration: name != selectedName
                    ? null
                    : new BoxDecoration(
                        color: Color.fromARGB(255, 255, 193, 193),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 12,
                      color: name == selectedName
                          ? Colors.redAccent
                          : Colors.black),
                ),
              ),
              onTap: () {
                widget.callback(index);
              });
        }).toList();
        break;
      case "爱玩乐":
        print("switch" + title + selectedIndex.toString());
        String selectedName = CommonUtil.aiwanle[selectedIndex];
        return CommonUtil.aiwanle.map((name) {
          int index = CommonUtil.aiwanle.indexOf(name);
          return GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
                margin: EdgeInsets.only(left: 10),
                decoration: name != selectedName
                    ? null
                    : new BoxDecoration(
                        color: Color.fromARGB(255, 255, 193, 193),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 12,
                      color: name == selectedName
                          ? Colors.redAccent
                          : Colors.black),
                ),
              ),
              onTap: () {
                widget.callback(index);
              });
        }).toList();
        break;
    }
    return List();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
