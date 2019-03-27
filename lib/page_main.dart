import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_gank/categories/page_categories.dart';
import 'package:flutter_gank/mine/page_mine.dart';
import 'package:flutter_gank/welfare/page_welfare.dart';
import 'package:flutter_gank/home/page_home.dart';
import 'package:flutter_gank/nearby/page_near_by.dart';

class MainStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainState();
  }
}

class MainState extends State<MainStateWidget>
    with AutomaticKeepAliveClientMixin<MainStateWidget> {
  final _navigationBottomBarChoosedColor = Color.fromARGB(250, 6, 193, 174);
  final _navigationBottomBarUnChoosedColor = Colors.grey;

  int _currentIndex = 0;

  List<Widget> pages = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
    pages.clear();
    pages
      ..add(new HomeStateWidget())
      ..add(new NearbyWidget())
      ..add(new CategoryStateWidget())
      ..add(new WelfareStateWidget())
      ..add(new MineWidget());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildBottomBar();
  }

  DateTime _lastPressedAt; //上次点击时间
  Widget buildBottomBar() {
    return new WillPopScope(
        child: new Scaffold(
          body: IndexedStack(
            children: <Widget>[
              HomeStateWidget(),
              NearbyWidget(),
              CategoryStateWidget(),
              WelfareStateWidget(),
              MineWidget(),
            ],
            index: _currentIndex,
          ),
          bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.home,
                    color: _currentIndex == 0
                        ? _navigationBottomBarChoosedColor
                        : _navigationBottomBarUnChoosedColor,
                  ),
                  title: new Text(
                    "首页",
                    style: new TextStyle(
                        color: _currentIndex == 0
                            ? _navigationBottomBarChoosedColor
                            : _navigationBottomBarUnChoosedColor),
                  )),
              new BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.location_on,
                    color: _currentIndex == 1
                        ? _navigationBottomBarChoosedColor
                        : _navigationBottomBarUnChoosedColor,
                  ),
                  title: new Text(
                    "附近",
                    style: new TextStyle(
                        color: _currentIndex == 1
                            ? _navigationBottomBarChoosedColor
                            : _navigationBottomBarUnChoosedColor),
                  )),
              new BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.category,
                    color: _currentIndex == 2
                        ? _navigationBottomBarChoosedColor
                        : _navigationBottomBarUnChoosedColor,
                  ),
                  title: new Text(
                    "分类",
                    style: new TextStyle(
                        color: _currentIndex == 2
                            ? _navigationBottomBarChoosedColor
                            : _navigationBottomBarUnChoosedColor),
                  )),
              new BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.picture_in_picture,
                    color: _currentIndex == 3
                        ? _navigationBottomBarChoosedColor
                        : _navigationBottomBarUnChoosedColor,
                  ),
                  title: new Text(
                    "福利",
                    style: new TextStyle(
                        color: _currentIndex == 3
                            ? _navigationBottomBarChoosedColor
                            : _navigationBottomBarUnChoosedColor),
                  )),
              new BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.people,
                    color: _currentIndex == 4
                        ? _navigationBottomBarChoosedColor
                        : _navigationBottomBarUnChoosedColor,
                  ),
                  title: new Text(
                    "我的",
                    style: new TextStyle(
                        color: _currentIndex == 4
                            ? _navigationBottomBarChoosedColor
                            : _navigationBottomBarUnChoosedColor),
                  ))
            ],
            currentIndex: _currentIndex,
            onTap: _onTap,
            iconSize: 18,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        onWillPop: () {
          return _dialogExitApp(context);
        });
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text("确定退出应用?"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text("取消")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text("确定"))
              ],
            ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
