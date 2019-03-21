import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gank/http/gank_api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'package:flutter_gank/entity/gank_item_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_gank/translations.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'page_image_show.dart';
import 'package:flutter_gank/common.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gank/indicator_factory.dart';

class WelfareStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WelfareState();
  }
}

class WelfareState extends State<WelfareStateWidget> {
  RefreshController _refreshController;
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState" + "WelfareState");
    _refreshController = new RefreshController();
    getRequest();
  }

  List<Result> entities = List();

  Future<void> getRequest() async {
    page = 1;
    var response = await GankApiService.getCategoryData("福利", page);
    String jsonSrc = json.encode(response);
    Map<String, dynamic> map = json.decode(jsonSrc);
    GankItemEntity gankItemEntity = new GankItemEntity.fromJson(map);
    print(jsonSrc);
    _refreshController.sendBack(true, RefreshStatus.completed);
    setState(() {
      entities.clear();
      entities.addAll(gankItemEntity.getResults());
    });
  }

  Future<void> loadMore() async {
    page++;
    var response = await GankApiService.getCategoryData("福利", page);
    String jsonSrc = json.encode(response);
    Map<String, dynamic> map = json.decode(jsonSrc);
    GankItemEntity gankItemEntity = new GankItemEntity.fromJson(map);
    print(jsonSrc);
    _refreshController.sendBack(false, RefreshStatus.idle);
    setState(() {
      entities.addAll(gankItemEntity.getResults());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void showPhoto(BuildContext context, Result result) {
    Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(CommonUtil.formatDateStr(result.createdAt))),
        body: SizedBox.expand(
          child: Hero(
            tag: result.id,
            child: ImageShowWidget(result: result),
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("美图"),
      ),
      body: new Container(
          padding: EdgeInsets.all(10),
          child: new SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            headerBuilder: buildDefaultHeader,
            footerBuilder: (context, mode) =>
                buildDefaultFooter(context, mode, () {
                  _refreshController.sendBack(false, RefreshStatus.refreshing);
                }),
            footerConfig: new RefreshConfig(),
            onRefresh: (up) {
              if (up) {
                getRequest();
              } else {
                loadMore();
              }
            },
            child: new GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2 / 3,
              children: entities.map<Widget>((result) {
                return GestureDetector(
                  onTap: () {
                    showPhoto(context, result);
                  },
                  child: buildItem(result),
                );
              }).toList(),
            ),
          )),
    );
  }

  Widget buildItem(Result result) {
    return new Hero(
      child: CachedNetworkImage(
        imageUrl: result.url,
        fit: BoxFit.cover,
        placeholder: Image.asset(
          "images/icon_default.png",
          fit: BoxFit.cover,
        ),
        errorWidget: Image.asset(
          "images/icon_error.jpg",
          fit: BoxFit.cover,
        ),
      ),
      tag: result,
    );
  }
}
