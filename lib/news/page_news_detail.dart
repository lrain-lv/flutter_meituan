import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/news_data_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gank/database_helper.dart';

// ignore: must_be_immutable
class NewsDetailWidget extends StatefulWidget {
  Articles articles;

  NewsDetailWidget({@required this.articles});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsDetailState();
  }
}

class NewsDetailState extends State<NewsDetailWidget> {
  bool isCollected = false;

  DataBaseHelper _dataBaseHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataBaseHelper = new DataBaseHelper();
    check();
  }

  Future<void> check() async {
    var articles = await _dataBaseHelper.getNews(widget.articles.articleId);
    setState(() {
      isCollected = null != articles;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("详情"),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.comment,
                color: Colors.white,
                size: 20,
              ),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "comment",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.greenAccent,
                    textColor: Colors.white,
                    fontSize: 13.0);
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
            ),
            GestureDetector(
              child: Icon(Icons.star_border,
                  color: isCollected ? Colors.redAccent : Colors.white,
                  size: 20),
              onTap: () {
                if (!isCollected) {
                  _dataBaseHelper.saveNews(widget.articles).then((int) {
                    if (int != null && int > 0) {
                      setState(() {
                        isCollected = true;
                      });
                      Fluttertoast.showToast(
                          msg: "收藏成功",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.greenAccent,
                          textColor: Colors.white,
                          fontSize: 13.0);
                    }
                  });
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
            ),
            GestureDetector(
              child: Icon(Icons.share, color: Colors.white, size: 20),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "share",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.greenAccent,
                    textColor: Colors.white,
                    fontSize: 13.0);
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.articles.articleTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 55,
                        height: 55,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(360)),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    widget.articles.authorPortraitUrl),
                                fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.articles.authorName),
                          Text(widget.articles.publishDate),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: widget.articles.articleContentList.map((s) {
                      if (s.startsWith("http")) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          width: MediaQuery.of(context).size.width - 30,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(s),
                                  fit: BoxFit.cover)),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          alignment: Alignment.topLeft,
                          child: Text(
                            s,
                            style: TextStyle(fontSize: 16, letterSpacing: 1),
                          ),
                        );
                      }
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
