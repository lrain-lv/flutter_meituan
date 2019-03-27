import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter_gank/http/gank_api_service.dart';
import 'package:flutter_gank/news/page_news_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gank/entity/news_data_entity.dart';
import 'package:flutter_gank/indicator_factory.dart';

// ignore: must_be_immutable
class HomeListWidget extends StatefulWidget {
  String title;

  HomeListWidget({@required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeListState();
  }
}

class HomeListState extends State<HomeListWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  int page = 1;

  bool isFirstLoading = true;

  List<Articles> _list;
  RefreshController _refreshController = new RefreshController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = List();
    getRequestData(isLoadMore: false);
  }

  Future<void> getRequestData({isLoadMore = false}) async {
    if (isLoadMore) {
      page++;
    } else {
      page = 1;
    }
    try {
      var response =
          await GankApiService.getNewsData(title: widget.title, pageNum: page);
      String jsonSrc = json.encode(response);
      print(jsonSrc);
      Map<String, dynamic> map = await json.decode(jsonSrc);
      NewsDataEntity entity = NewsDataEntity.fromJson(map);
      if (isLoadMore) {
        _refreshController.sendBack(false, RefreshStatus.idle);
      } else {
        _refreshController.sendBack(true, RefreshStatus.completed);
      }
      setState(() {
        isFirstLoading = false;
        if (isLoadMore) {
          _list.addAll(entity.getArticles());
        } else {
          _list = entity.getArticles();
        }
      });
    } catch (e) {
      print(e);
      setState(() {
        isFirstLoading = false;
        _list = List();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            SmartRefresher(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return NewsItemWidget(
                      articles: _list[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) => new Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                  itemCount: _list.length),
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              headerBuilder: buildDefaultHeader,
              footerBuilder: (context, mode) =>
                  buildDefaultFooter(context, mode, () {
                    _refreshController.sendBack(
                        false, RefreshStatus.refreshing);
                  }),
              footerConfig: new RefreshConfig(),
              onRefresh: (up) {
                if (up) {
                  getRequestData(isLoadMore: false);
                } else {
                  getRequestData(isLoadMore: true);
                }
              },
            ),
            isFirstLoading
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: new CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  )
                : Container(),
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
