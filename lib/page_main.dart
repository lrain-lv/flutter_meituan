import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_gank/categories/page_categories.dart';
import 'package:flutter_gank/home/page_about.dart';
import 'package:flutter_gank/home/page_collection.dart';
import 'package:flutter_gank/mine/page_mine.dart';
import 'package:flutter_gank/welfare/page_welfare.dart';
import 'package:flutter_gank/home/page_home.dart';
import 'package:flutter_gank/nearby/page_near_by.dart';
import 'package:flutter_gank/news/page_news_home.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'database_helper.dart';

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

  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
    pages.clear();
    pages
      ..add(new HomeStateWidget())
      ..add(new NearbyWidget())
      ..add(new NewsMainWidget())
      ..add(new WelfareStateWidget())
      ..add(new MineWidget());
    get();
  }

  Future<void> get() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var il = prefs.getBool("isLogin");
      setState(() {
        isLogin = il == null ? false : il;
      });
      return isLogin;
    } catch (e) {
      setState(() {
        isLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildBottomBar(context);
  }

  Widget drawerHeaderBuilder() {
    return DrawerHeader(
      child: Container(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: isLogin
                      ? AssetImage("images/icon_header.jpg")
                      : AssetImage("images/icon_userreview_defaultavatar.png"),
                ),
              ),
              onTap: toLogin,
            ),
            GestureDetector(
              child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    isLogin ? "stayWithMe" : "未登录",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
              onTap: toLogin,
            )
          ],
        ),
        padding: EdgeInsets.only(left: 25),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      padding: EdgeInsets.only(),
    );
  }

  void toLogin() {
    print("login");
  }

  void itemClick(BuildContext context, String name) {
    Navigator.of(context).pop();
    switch (name) {
      case "收藏":
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext c) {
          return new CollectionWidget();
        }));

        break;
      case "设置":
        break;
      case "分享":
        break;
      case "关于":
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext c) {
          return AboutWidget();
        }));
        break;
      case "退出登录":
        SharedPreferences.getInstance().then((sp) {
          sp.setBool("isLogin", false);
        });
        break;
    }
  }

  Widget buildBottomBar(BuildContext context) {
    return new WillPopScope(
        child: new Scaffold(
          drawer: Drawer(
            child: new ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              children: <Widget>[
                drawerHeaderBuilder(),
                new ListTile(
                  leading: Icon(
                    Icons.collections,
                    color: Colors.blue,
                  ),
                  title: new Text("收藏"),
                  onTap: () => itemClick(context, "收藏"),
                ),
                new ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.lightGreen,
                  ),
                  title: new Text('设置'),
                  onTap: () => itemClick(context, "设置"),
                ),
                new ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.redAccent,
                  ),
                  title: new Text('分享'),
                  onTap: () => itemClick(context, "分享"),
                ),
                new ListTile(
                    leading: Icon(
                      Icons.settings_backup_restore,
                      color: Colors.greenAccent,
                    ),
                    title: new Text('关于'),
                    onTap: () => itemClick(context, "关于")),
                isLogin
                    ? new ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.lightGreen,
                        ),
                        title: new Text('退出登录'),
                        onTap: () => itemClick(context, "退出登录"))
                    : Container(),
              ],
            ),
          ),
          body: IndexedStack(
            children: <Widget>[
              HomeStateWidget(),
              NearbyWidget(),
              NewsMainWidget(),
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
                    "新闻",
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
