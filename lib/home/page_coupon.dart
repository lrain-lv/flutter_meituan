import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/meals_detail_entity.dart';

class CouponWidget extends StatefulWidget {
  List<DataMeal> meals;

  CouponWidget({Key k, this.meals}) : super(key: k);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CouponWidgetState();
  }
}

class CouponWidgetState extends State<CouponWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: buildItems(widget.meals),
    );
  }

  List<Widget> buildItems(List<DataMeal> meals) {
    List<Widget> widgets = List();
    DataMeal dataMeal = meals[0];
    Widget widget = buildItem(dataMeal, true);
    widgets.add(widget);
    meals.removeAt(0);
    widgets.addAll(meals.map((meal) {
      return buildItem(meal, false);
    }).toList());
    return widgets;
  }

  Widget buildItem(DataMeal meal, bool isShow) {
    List<Taglist> taglist = meal.taglist;
    String tag = "";
    if (taglist != null) {
      taglist.forEach((taglist) {
        String name = taglist.name;
        tag = tag + name + "    ";
      });
    }
    return Container(
      height: 120,
      padding: EdgeInsets.only(left: 10, right: 10),
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isShow
              ? Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  child: Image.asset("images/baby_tuan.png"),
                )
              : Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  child: Text(""),
                ),
          Expanded(
              child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: Text(
                  meal.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 30,
                child: Text(
                  tag,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: Row(
                  children: <Widget>[
                    Text(
                      "￥${meal.price}",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      "门市价 ￥${meal.value}",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          )),
          Container(
            alignment: Alignment.center,
            height: 120,
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(meal.soldsDesc, style: TextStyle(color: Colors.grey)),
                FlatButton(
                  color: Colors.white,
                  splashColor: Colors.grey,
                  textColor: Colors.orange,
                  child: Text("购买"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: Colors.orange,
                      )),
                  onPressed: () => {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
