import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/meals_detail_entity.dart';
import 'package:flutter_gank/entity/nearby_detail_recommend_entity.dart';
import 'package:flutter_gank/entity/recommend_entity.dart';
import 'package:flutter_gank/home/page_detail_header.dart';
import 'package:flutter_gank/http/gank_api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class FoodDetailWidget extends StatefulWidget {
  Data2 _data2;

  FoodDetailWidget(this._data2);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FoodDetailState();
  }
}

class FoodDetailState extends State<FoodDetailWidget> {
  List<Deals> deals;

  List<DataMeal> dataMeals;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deals = List();
    dataMeals = List();
    getRequestData();
  }

  Future<void> getRequestData() async {
    try {
      var response1 = await GankApiService.getMealDetail(widget._data2.poiid);
      String json1 = json.encode(response1);
      Map<String, dynamic> map1 = await json.decode(json1);
      MealsDetailEntity mealsDetailEntity = MealsDetailEntity.fromJson(map1);

      var response2 = await GankApiService.nearByRecomment(widget._data2.poiid);
      String json2 = json.encode(response2);
      Map<String, dynamic> map2 = await json.decode(json2);
      NearbyDetailRecommendEntity nearbyDetailRecommendEntity =
          NearbyDetailRecommendEntity.fromJson(map2);

      setState(() {
        deals = nearbyDetailRecommendEntity == null
            ? List()
            : nearbyDetailRecommendEntity.data.getDeals();

        dataMeals =
            mealsDetailEntity == null ? List() : mealsDetailEntity.getData();
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        deals = List();
        dataMeals = List();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            widget._data2.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
            maxLines: 1,
          ),
          titleSpacing: 0,
        ),
        body: Container(
          color: Color.fromARGB(180, 233, 233, 239),
          child: new ListView.separated(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return FoodDetailHeaderWidget(widget._data2, dataMeals);
                }
                index -= 1;
                return buildItem(context, index);
              },
              separatorBuilder: (context, index) {
                return new Divider(
                  height: 1,
                );
              },
              itemCount: deals.length + 1),
        ));
  }

  Widget buildItem(BuildContext c, int index) {
    Deals deal = deals[index];
    var imgUrl = deal.squareimgurl.replaceAll(new RegExp(r'w.h'), "160.0");
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 120,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 90,
              height: 90,
              margin: EdgeInsets.only(right: 10),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text(deal.smstitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "【${deal.range}】 ${deal.title}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Text(
                        "￥${deal.price.toString()}",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                      Text(
                        "   门市价${deal.value.toString()}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "已售：${deal.solds.toString()}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
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
}
