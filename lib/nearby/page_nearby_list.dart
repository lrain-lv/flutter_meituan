import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/nearby_recommend_entity.dart';
import 'package:flutter_gank/entity/recommend_entity.dart';
import 'package:flutter_gank/home/page_food_detail.dart';
import 'package:flutter_gank/http/gank_api_service.dart';
import 'package:flutter_gank/nearby/page_nearby_header_view.dart';
import 'package:flutter_gank/common.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class NearbyListWidget extends StatefulWidget {
  String title;

  NearbyListWidget({Key k, this.title}) : super(key: k);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NearbyListState();
  }
}

class NearbyListState extends State<NearbyListWidget>
    with AutomaticKeepAliveClientMixin {
  int selectionIndex = 0;

  String cate;

  List<Data2> datas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas = List();
    switch (widget.title) {
      case "享美食":
        cate = "1";
        break;
      case "爱玩乐":
        cate = "2";
        break;
      case "住酒店":
        cate = "20";
        break;
      case "全部":
        cate = "1";
        break;
    }
    getRequestData(cate: cate);
  }

  Future<void> getRequestData({String cate = "1"}) async {
    try {
      var response = await GankApiService.getNearbyRecommentData(cate);
      String jsonSoc = json.encode(response);
      Map<String, dynamic> map = await json.decode(jsonSoc);
      RecommendEntity entity = RecommendEntity.fromJson(map);
      setState(() {
        datas = entity.getData2();
      });
      print(datas.length.toString() + jsonSoc);
    } catch (e) {
      print(e);
      setState(() {
        datas = List();
      });
    }
  }

  onCallback(index) {
    String c = getCate(index);
    getRequestData(cate: c);
    setState(() {
      selectionIndex = index;
    });
  }

  String getCate(index) {
    String c = "1";
    String currentType;
    String title = widget.title;
    if ('住酒店' == title) {
      currentType = CommonUtil.hotel[index];
    } else if ('爱玩乐' == title) {
      currentType = CommonUtil.aiwanle[index];
    } else if ('享美食' == title) {
      currentType = CommonUtil.meishi[index];
    }

    switch (currentType) {
      case '全部':
        if ('住酒店' == title) {
          c = "20";
        } else if ('爱玩乐' == title) {
          c = "2";
        } else {
          c = "1";
        }
        break;
      case '面包甜点':
        c = "11";
        break;
      case '小吃快餐':
        c = "36";
        break;
      case '川湘菜':
        c = "55";
        break;
      case '日韩料理':
        c = "28";
        break;
      case '台湾菜':
        c = "227";
        break;
      case '青年旅社':
        c = "385";
        break;
      case '经济酒店':
        c = "79";
        break;
      case '豪华酒店':
        c = "80";
        break;
      case '主题酒店':
        c = "381";
        break;
      case '公寓型酒店':
        c = "383";
        break;
      case 'KTV':
        c = "10";
        break;
      case '足疗按摩':
        c = "52";
        break;
      case '洗浴/汗蒸':
        c = "112";
        break;
      case '其他娱乐':
        c = "26";
        break;
      case '运动健身':
        c = "39";
        break;
      case '桌游/电玩':
        c = "38";
        break;
      default:
        c = "1";
        break;
    }
    return c;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return NearbyHeaderViewWidget(
              selectionIndex: selectionIndex,
              title: widget.title,
              callback: (index) {
                onCallback(index);
              },
            );
          }
          index -= 1;
          return buildItem(context, index);
        },
        separatorBuilder: (context, int) {
          return new Divider(
            height: 0.5,
            color: Colors.grey,
          );
        },
        itemCount: datas.length + 1);
  }

  Widget buildItem(context, index) {
    Data2 data = datas[index];
    if ((data.payAbstracts).length >= 3) {
      data.payAbstracts.removeRange(2, (data.payAbstracts).length);
    }
    List<PayAbstracts> abstracts = data.payAbstracts;
    String imgUrl = data.frontImg.replaceAll(new RegExp(r"w.h"), "160.0");
    return GestureDetector(
      child: Container(
        height: abstracts.length == 0 ? 130 : abstracts.length == 1 ? 150 : 170,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 90,
                height: 90,
                margin: EdgeInsets.only(right: 10),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.fill,
                )),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15, height: 1, fontWeight: FontWeight.bold),
                  ),
                  height: 30,
                  width: MediaQuery.of(context).size.width - 120,
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width - 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset("images/icon_ratingbar.png"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "￥${data.avgPrice}/人",
                          style: TextStyle(
                              fontSize: 12, height: 1, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width - 120,
                  child: Text(
                    "${data.cateName} | ${data.areaName}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1),
                  ),
                ),
                Container(
                  height: 20,
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width - 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("images/icon_praise.png"),
                      Container(
                        child: Text(
                          "${data.historyCouponCount}人消费",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, height: 1),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  height: 1,
                  width: MediaQuery.of(context).size.width - 120,
                  color: Colors.grey[200],
                  child: Text(""),
                ),
                Container(
                  height: abstracts.length == 0
                      ? 0
                      : abstracts.length == 1 ? 20 : 40,
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width - 120,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: abstracts.map((abs) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 14,
                            height: 14,
                            child: Image.network(abs.iconUrl),
                          ),
                          Container(
                            child: Text(
                              abs.abstract,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 12, height: 1),
                            ),
                            margin: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width - 120 - 24,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute<void>(builder: (BuildContext context) {
          return new FoodDetailWidget(data);
        }));
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
