import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gank/entity/news_data_entity.dart';
import "package:flutter_gank/database_helper.dart";

class CollectionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollectionState();
  }
}

class CollectionState extends State<CollectionWidget> {
  bool isLoading = true;

  List<Articles> lists = List();

  DataBaseHelper _dataBaseHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataBaseHelper = new DataBaseHelper();
    Future.delayed(Duration(milliseconds: 2000), getDataList);
  }

  Future getDataList() async {
    try {
      if (!mounted) {
        return;
      }
      await _dataBaseHelper.getAllNews().then((value) {
        List<Articles> list = value.reversed.map((e) {
          return Articles.fromJson(e);
        }).toList();
        setState(() {
          lists = list;
          isLoading = false;
        });
      }).catchError((e) {
        setState(() {
          lists = List();
          isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        lists = List();
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "收藏",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Text(
                "编辑",
                style: TextStyle(color: Colors.black),
              ),
              alignment: Alignment.center,
            ),
            onTap: () {},
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ListView.separated(
              itemBuilder: (context, index) {
                return buildItem(context, index);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey,
                );
              },
              itemCount: lists.length),
          isLoading
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
          !isLoading && lists.length == 0
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 90,
                          margin: EdgeInsets.only(bottom: 15),
                          child: Image.asset("images/icon_empty_view.png"),
                        ),
                        Text(
                          "快去收藏吧~",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void onLongPress(BuildContext c, Articles articles) {
    showDialog(
        context: c,
        builder: (BuildContext c) {
          return AlertDialog(
            content: Text("确认删除这条收藏吗"),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('确认'),
                onPressed: () {
                  _dataBaseHelper.deleteNews(articles.articleId).then((i) {
                    getDataList();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget buildItem(BuildContext c, int index) {
    Articles articles = lists[index];
    return GestureDetector(
      onLongPress: () => onLongPress(c, articles),
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              articles.articleTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              width: MediaQuery.of(context).size.width - 20,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(articles.coverBigUrl),
                      fit: BoxFit.fitWidth)),
            ),
            Container(
              height: 45,
              alignment: Alignment.centerLeft,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(360)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                articles.authorPortraitUrl),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    articles.authorName,
                    style: TextStyle(fontSize: 14),
                  ),
                  Spacer(),
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 8),
                    child: Image.asset("images/icon_reader.png"),
                  ),
                  Text(articles.articleRead.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
