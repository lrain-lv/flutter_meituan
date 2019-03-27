import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/meals_detail_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GroupWidget extends StatefulWidget {
  List<DataMeal> groups;

  GroupWidget({Key k, this.groups}) : super(key: k);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GroupState();
  }
}

class GroupState extends State<GroupWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: buildItems(widget.groups),
    );
  }

  List<Widget> buildItems(List<DataMeal> groups) {
    List<Widget> widgets = List();
    DataMeal dataMeal = groups[0];
    Widget widget = buildItem(dataMeal, true);
    widgets.add(widget);
    groups.removeAt(0);
    widgets.addAll(groups.map((meal) {
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
                  child: Image.asset("images/food_poi_icon_groupbuy_v2.png"),
                )
              : Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  child: Text(""),
                ),
          Container(
            width: 55,
            height: 55,
            margin: EdgeInsets.only(top: 10, right: 10),
            child: CachedNetworkImage(
              imageUrl:
                  meal.squareimgurl.replaceAll(new RegExp(r'w.h'), "200.0"),
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: Text(
                  meal.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text(
                    "￥${meal.price}",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                  Expanded(
                      child: Text(
                    "门市价 ￥${meal.value}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
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
                Container(
                    margin: EdgeInsets.only(top: 6),
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                    child: Text(
                      "购买",
                      style: TextStyle(color: Colors.orange),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.orange, width: 1))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
