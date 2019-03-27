import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_gank/home/page_web_view.dart';
import 'package:flutter_gank/entity/gank_item_entity.dart';
import 'package:flutter_gank/http/gank_api_service.dart';
import 'package:flutter_gank/common.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gank/indicator_factory.dart';

class MainCategoryPage extends StatefulWidget {
  String category;

  int page;

  MainCategoryPage({Key k, this.category, this.page}) : super(key: k);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainCategoryState();
  }
}

class MainCategoryState extends State<MainCategoryPage>
    with AutomaticKeepAliveClientMixin {
  List<Result> results = List();
  RefreshController _refreshController = new RefreshController();

  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest();
  }

  String s = "";

  Future<void> getRequest({bool loadMore = false}) async {
    if (loadMore) {
      page++;
    } else {
      page = 1;
    }
    var response = await GankApiService.getCategoryData(widget.category, page);
    String jsonSrc = json.encode(response);

    Map<String, dynamic> map = await json.decode(jsonSrc);
    GankItemEntity gankItemEntity = new GankItemEntity.fromJson(map);
    if (loadMore) {
      setState(() {
        results.addAll(gankItemEntity.getResults());
      });
      _refreshController.sendBack(false, RefreshStatus.idle);
    } else {
      setState(() {
        results.clear();
        results.addAll(gankItemEntity.getResults());
      });
      _refreshController.sendBack(true, RefreshStatus.completed);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget widget = new SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _refreshController,
      headerBuilder: buildDefaultHeader,
      footerBuilder: (context, mode) => buildDefaultFooter(context, mode, () {
            _refreshController.sendBack(false, RefreshStatus.refreshing);
          }),
      footerConfig: new RefreshConfig(),
      onRefresh: (up) {
        if (up) {
          getRequest();
        } else {
          getRequest(loadMore: true);
        }
      },
      child: new ListView.builder(
        itemBuilder: buildItem,
        itemCount: results.length,
      ),
    );
    return results.isEmpty
        ? new Center(
            child: new CircularProgressIndicator(),
          )
        : widget;
  }

  Widget buildItem(BuildContext c, int index) {
    Result result = results[index];

    var commonItems = <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                result.desc,
                maxLines: 2,
                style: TextStyle(color: Colors.black, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 25,
                    alignment: Alignment.center,
                    child: Text(
                      "作者:" + result.who,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "时间:" + CommonUtil.formatDateStr(result.createdAt),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ];

    return GestureDetector(
        onTap: () {
          itemClick(context, result);
        },
        child: new Container(
          color: Colors.white,
          height: 110,
          child: Card(
            margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
            elevation: 3.0,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: commonItems)),
          ),
        ));
  }

  void itemClick(BuildContext c, Result result) {
    Navigator.push(c, MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(CommonUtil.formatDateStr(result.createdAt))),
        body: SizedBox.expand(
          child: Hero(
            tag: result.id,
            child: WebViewWidget(url: result.url),
          ),
        ),
      );
    }));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
