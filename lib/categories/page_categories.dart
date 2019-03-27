import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gank/categories/page_category_main.dart';
import 'package:flutter_gank/entity/gank_item_entity.dart';
import 'package:flutter_gank/http/gank_api_service.dart';

class Category {
  const Category({this.title});

  final String title;
}

const List<Category> categories = const <Category>[
  const Category(title: 'Android'),
  const Category(title: 'iOS'),
  const Category(title: '休息视频'),
  const Category(title: 'App'),
  const Category(title: '拓展资源'),
  const Category(title: '前端'),
  const Category(title: '瞎推荐'),
];

class CategoryStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CategoryState();
  }
}

class CategoryState extends State<CategoryStateWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Result> results = List();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Material(
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text("分类"),
            bottom: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: categories.map((Category category) {
                return new Tab(
                  text: category.title,
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
              controller: _tabController,
              children: categories.map((Category category) {
                return new Container(
                  child: MainCategoryPage(
                    category: category.title,
                    page: 1,
                  ),
                );
              }).toList())),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
