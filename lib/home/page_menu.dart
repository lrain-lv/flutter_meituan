import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gank/categories/page_web_view.dart';
import 'package:flutter_gank/common.dart';

// ignore: must_be_immutable
class HomeMenu extends StatelessWidget {
  var menus1 = [
    {
      "title": '休闲娱乐',
      "icon": "images/ic_category_two.png",
      "url":
          'https://i.meituan.com/specir?dest=https://h5.dianping.com/tuan/fun/play-mt/index.html&f=android&lat=39.9844&lng=116.308434&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category4_2__a1&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
    {
      "title": '丽人/美发',
      "icon": "images/icon_homepage_beautyCategory.png",
      "url":
          'https://i.meituan.com/beauty/node/html/mtindex.html?source=newusercoupon&f=android&lat=39.984311&lng=116.308302&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category9_22__a1&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
    {
      "title": '健身',
      "icon": "images/ic_category_eight.png",
      "url":
          'http://m.dianping.com/fitness/node/html/mtindex.html?f=android&lat=39.984322&lng=116.308408&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category12_20252__a1&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
    {
      "title": '医疗',
      "icon": "images/ic_category_one.png",
      "url":
          'https://m.dianping.com/easylife/node/html/medicalmtindex.html?f=android&lat=39.984322&lng=116.308408&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category13_20274__a1&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
    {
      "title": '生活服务',
      "icon": "images/icon_homepage_lifeServiceCategory.png",
      "url":
          'https://m.dianping.com/easylife/node/html/mtindex.html?f=android&lat=39.984322&lng=116.308408&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category14_3__a1&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
  ];

  var menus2 = [
    {
      "title": '结婚/摄影',
      "icon": "images/ic_category_seven.png",
      "url":
          'https://i.meituan.com/app/app-m-wedding-product-peon/index.html?f=android&lat=39.984322&lng=116.308408&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category15_20178__a1&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
    {
      "title": '母婴亲子',
      "icon": "images/ic_category_nine.png",
      "url":
          'https://i.meituan.com/baby/mobile/mt/index?f=android&lat=39.984322&lng=116.308408&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category16_20007__a1&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
    {
      "title": '时尚购',
      "icon": "images/ic_category_three.png",
      "url":
          'http://m.dianping.com/shopping/meituan/home?f=android&lat=39.984322&lng=116.308408&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category17_20383__a1__c20070&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
    {
      "title": '学习培训',
      "icon": "images/ic_category_four.png",
      "url":
          'https://i.meituan.com/education/node/html/mtchannel.html?f=android&lat=39.9844&lng=116.308434&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category18_20285__a1&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    },
    {
      "title": '家装',
      "icon": "images/ic_category_six.png",
      "url":
          'https://i.meituan.com/mtdp/jiazhuang/?f=android&lat=39.9844&lng=116.308434&utm_source=aiwen4&utm_medium=android&utm_term=431&version_name=7.3.1&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0Ghomepage_category19_20179__a1__b1244&ci=1&msid=8666930264420251516244317271&uuid=DA135E22256C4D0430739F927D2EB231BA824FD037AC393C5FE3A8C3C2A1D563&userid=-1',
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets1 = menus1
        .map((v) => Expanded(
            child: buildItemSmall(context, v["icon"], v["title"], v["url"])))
        .toList();
    List<Widget> widgets2 = menus2
        .map((v) => Expanded(
            child: buildItemSmall(context, v["icon"], v["title"], v["url"])))
        .toList();
    return Container(
      height: 210,
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: buildItem("images/homepage_icon_light_food_b.png", "美食"),
              ),
              Expanded(
                child: buildItem(
                    "images/homepage_icon_light_movie_b.png", "电影/演出"),
              ),
              Expanded(
                child:
                    buildItem("images/homepage_icon_light_hotel_b.png", "酒店住宿"),
              ),
              Expanded(
                child: buildItem(
                    "images/homepage_icon_light_amusement_b.png", "休闲娱乐"),
              ),
              Expanded(
                child:
                    buildItem("images/homepage_icon_light_takeout_b.png", "外卖"),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),
          Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.max,
            children: widgets1,
          ),
          Padding(padding: EdgeInsets.all(6)),
          Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.max,
            children: widgets2,
          ),
        ],
      ),
    );
  }

  Widget buildItemSmall(
      BuildContext c, String image, String title, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.push(c,
            MaterialPageRoute<void>(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: Text(title)),
            body: SizedBox.expand(
              child: Hero(
                tag: image,
                child: WebViewWidget(url: url),
              ),
            ),
          );
        }));
      },
      child: Column(children: <Widget>[
        Container(
          width: 25,
          height: 25,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(fontSize: 12, height: 1.5),
          ),
        )
      ]),
    );
  }

  Widget buildItem(String image, String title) {
    return GestureDetector(
      onTap: () {
        print(title);
      },
      child: Column(children: <Widget>[
        Container(
          width: 50,
          height: 50,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(fontSize: 12, height: 1),
          ),
        )
      ]),
    );
  }
}
