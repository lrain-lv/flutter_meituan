import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gank/entity/meals_detail_entity.dart';
import 'package:flutter_gank/entity/recommend_entity.dart';
import 'package:flutter_gank/home/page_coupon.dart';
import 'package:flutter_gank/home/page_group.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class FoodDetailHeaderWidget extends StatefulWidget {
  List<DataMeal> meals;
  Data2 _data2;

  FoodDetailHeaderWidget(this._data2, this.meals);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FoodDetailHeaderState();
  }
}

class FoodDetailHeaderState extends State<FoodDetailHeaderWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String imgUrl =
        widget._data2.frontImg.replaceAll(new RegExp(r'w.h'), "480.0");
    int count = new Random().nextInt(20);

    List<DataMeal> coupons = List();
    List<DataMeal> groups = List();
    widget.meals.forEach((meal) {
      var count = meal.mealcount;
      if ('[]' == count) {
        coupons.add(meal);
      } else {
        groups.add(meal);
      }
    });

    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  right: 15,
                  bottom: 15,
                  child: Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("images/icon_image.png"),
                        ),
                        Text(
                          "${count}张",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: Color.fromARGB(120, 0, 0, 0)),
                  )),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          height: 40,
          color: Colors.white,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            widget._data2.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 30,
          color: Colors.white,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 70,
                height: 14,
                margin: EdgeInsets.only(right: 4),
                child: Image.asset("images/icon_ratingbar.png"),
              ),
              Text(
                "5分      ",
                style: TextStyle(fontSize: 13, color: Colors.redAccent),
              ),
              Text(
                "人均：￥${widget._data2.avgPrice}",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          child: Text(""),
        ),
        Container(
            alignment: Alignment.centerLeft,
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 18,
                  height: 18,
                  child: Image.asset("images/icon_location.png"),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "${widget._data2.addr}",
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey[200],
                  child: Text(""),
                ),
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: Image.asset("images/icon_call.png"),
                  ),
                  onTap: () async {
                    if (await canLaunch("tel:15751320195")) {
                      await launch("tel:15751320195");
                    } else {
                      throw 'Could not launch';
                    }
                  },
                )
              ],
              direction: Axis.horizontal,
            )),
        widget._data2.isWaimai == 1
            ? Container(
                height: 45,
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(top: 1, bottom: 8),
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 18,
                      height: 18,
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset("images/icon_waimai.png"),
                    ),
                    Text(
                      "外卖",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ],
                ),
              )
            : Container(),
        coupons.length != 0 ? CouponWidget(meals: coupons) : Container(),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        groups.length != 0 ? GroupWidget(groups: groups) : Container(),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 10),
          height: 50,
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: Text(
            "附近推荐",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        )
      ],
    );
  }
}
