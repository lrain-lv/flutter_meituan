import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gank/entity/banner_entity.dart';
import 'package:flutter_gank/entity/recommend_entity.dart';
import 'package:flutter_gank/http/http_manager.dart';
import 'package:flutter_gank/http/gank_api_service.dart';
import 'page_banner.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'page_home_header.dart';

class HomeStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<HomeStateWidget>
    with AutomaticKeepAliveClientMixin {
  String res = "";
  BannerEntity _entity;

  List<Data2> datas = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBannerData();
    getRecommendData();
  }

  Future<void> getRecommendData() async {
    try {
      var response = await GankApiService.getRecommendData(offset: "0");
      String jsonSrc = json.encode(response);
      Map<String, dynamic> map = await json.decode(jsonSrc);
      RecommendEntity recommendEntity = RecommendEntity.fromJson(map);
      print("------1"+datas.length.toString());
      setState(() {
        datas = recommendEntity.getData2();
        print(datas.length.toString());
      });
    } catch (e) {
      print("------2"+e.toString());
    }
  }

  Future<void> getBannerData() async {
    try {
      var response = await GankApiService.getBannerData();
      String jsonSrc = json.encode(response);
      Map<String, dynamic> map = await json.decode(jsonSrc);
      BannerEntity bannerEntity = BannerEntity.fromJson(map);
      setState(() {
        _entity = bannerEntity;
      });
    } catch (e) {
      print("------3"+e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return new Material(
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/icon_header.jpg"),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.all(6),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 16,
                    child: Icon(
                      Icons.search,
                      size: 12,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Container(
                    height: 16,
                    child: Text(
                      "百味快餐 (奥体店)",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                  borderRadius: new BorderRadius.all(Radius.circular(5))),
            ),
          ),
          titleSpacing: 8,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 35,
              onPressed: null,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView.separated(
          itemCount: datas == null ? 1 : datas.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return HomeListHeader(bannerHeight: 100, entity: _entity);
            }
            index -= 1;
            return buildItem(context, index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }

  Widget buildItem(BuildContext c, int index) {
    Data2 data2 = datas[index];
    String imgUrl = data2.frontImg.replaceAll(new RegExp(r'w.h'), '160.0');
    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: Container(
        height: 120,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: <Widget>[
            Container(
              height: 90,
              width: 90,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imgUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width - 20 - 90 - 15,
                  child: Text(
                    data2.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width - 20 - 90 - 15,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data2.introduction.isEmpty
                        ? data2.addr
                        : data2.introduction,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width - 20 - 90 - 15,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "￥" + data2.avgPrice.toString(),
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 13,
                            fontWeight: FontWeight.w800),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            border: Border.all(color: Colors.cyan, width: 2)),
                        height: 20,
                        width: 45,
                        alignment: Alignment.center,
                        child: Text(
                          data2.discount,
                          style: TextStyle(fontSize: 10, height: 1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        alignment: Alignment.center,
                        child: Text(
                          "已售" + data2.historyCouponCount.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
