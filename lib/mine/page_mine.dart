import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/event/login_event.dart';
import 'package:flutter_gank/mine/page_mine_item.dart';
import 'package:flutter_gank/EventBus.dart';


class MineWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MineStateWidget();
  }
}

class MineStateWidget extends State<MineWidget> {
  @override
  Widget build(BuildContext context) {
    double barHeight = MediaQuery.of(context).padding.top;
    //    // TODO: implement build
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Image.asset("images/icon_setting.png"),
                            margin: EdgeInsets.all(10),
                            height: 24,
                            width: 24,
                          ),
                          Container(
                            child: Image.asset("images/icon_message.png"),
                            margin: EdgeInsets.all(10),
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                      height: 44 + barHeight + 30,
                      padding: EdgeInsets.only(top: barHeight),
                      color: Color.fromARGB(250, 6, 193, 174),
                    ),
                    Positioned(
                      child: Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            child: Image.asset(
                              "images/icon_userreview_defaultavatar.png",
                            ),
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  builder: (context) => new AlertDialog(
                                        content: new Text("确认登录么？"),
                                        actions: <Widget>[
                                          new FlatButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false),
                                              child: new Text("取消")),
                                          new FlatButton(
                                              onPressed: () {
                                                bus
                                                    .fire(LoginEvent(true));
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                              child: new Text("确定"))
                                        ],
                                      ));
                            },
                          )),
                      top: 44 + barHeight,
                    )
                  ],
                ),
                height: 44 + barHeight + 60,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "请点击登录",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MineItemWidget(
                        name: "收藏", imgName: "images/icon_mine_collection.png"),
                    MineItemWidget(
                        name: "评价", imgName: "images/icon_mine_comment.png"),
                    MineItemWidget(
                        name: "足迹", imgName: "images/icon_mine_zuji.png"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                height: 1,
                width: MediaQuery.of(context).size.width - 20,
                color: Colors.grey[100],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "我的资产",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MineItemWidget(
                        name: "钱包", imgName: "images/icon_mine_wallet.png"),
                    MineItemWidget(
                        name: "余额", imgName: "images/icon_mine_balance.png"),
                    MineItemWidget(
                        name: "红包/卡券", imgName: "images/icon_red_pack.png"),
                    MineItemWidget(
                        name: "银行卡", imgName: "images/icon_bank_card.png"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                height: 1,
                width: MediaQuery.of(context).size.width - 20,
                color: Colors.grey[100],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "美团服务",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MineItemWidget(
                        name: "会员中心",
                        imgName: "images/icon_mine_membercenter.png"),
                    MineItemWidget(
                        name: "手机充值", imgName: "images/icon_mine_chongzhi.png"),
                    MineItemWidget(
                        name: "信用卡还款", imgName: "images/icon_mine_xinyong.png"),
                    MineItemWidget(
                        name: "发票助手", imgName: "images/icon_mine_fapiao.png"),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MineItemWidget(
                        name: "好友去哪", imgName: "images/icon_mine_friends.png"),
                    MineItemWidget(
                        name: "客服中心",
                        imgName: "images/icon_mine_customerService.png"),
                    MineItemWidget(
                        name: "我要合作", imgName: "images/icon_mine_coll.png"),
                    MineItemWidget(
                        name: "关于美团",
                        imgName: "images/icon_mine_aboutmeituan.png"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
