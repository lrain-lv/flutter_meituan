import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gank/nearby/page_nearby_list.dart';

// ignore: must_be_immutable
class NearbyWidget extends StatefulWidget {
  var tabs = ['享美食', "爱玩乐", "住酒店", "全部"];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NearbyState();
  }
}

class NearbyState extends State<NearbyWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(250, 6, 193, 174),
        titleSpacing: 5,
        elevation: 0,
        title: Container(
            alignment: Alignment.centerLeft,
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Text(
                  "新地中心一期",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 18,
                  height: 18,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 10, right: 20),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "找附近的吃喝玩乐",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ))
              ],
            )),
        bottom: new TabBar(
            labelColor: Colors.red[300],
            controller: _tabController,
            unselectedLabelColor: Colors.white,
            unselectedLabelStyle: TextStyle(fontSize: 13),
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            indicatorColor: Colors.red[300],
            indicatorSize: TabBarIndicatorSize.label,
            tabs: widget.tabs.map((name) {
              return new Tab(
                text: name,
              );
            }).toList()),
      ),
      body: TabBarView(
          controller: _tabController,
          children: widget.tabs.map((name) {
            return NearbyListWidget(
              title: name,
            );
          }).toList()),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
