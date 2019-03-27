import 'package:flutter/material.dart';

import 'package:flutter_gank/news/page_news_list.dart';

// ignore: must_be_immutable
class NewsMainWidget extends StatefulWidget {
  var titles = ['推荐', '热点', '评测', '攻略'];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsMainState();
  }
}

class NewsMainState extends State<NewsMainWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.titles.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        titleSpacing: 0,
        title: TabBar(
          labelColor: Color.fromARGB(100, 242, 3, 3),
          controller: _tabController,
          labelStyle: TextStyle(fontSize: 16),
          unselectedLabelStyle: TextStyle(fontSize: 16),
          unselectedLabelColor: Colors.black,
          indicatorColor: Color.fromARGB(100, 242, 3, 3),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: widget.titles.map((tab) {
            return new Tab(
              text: tab,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: widget.titles.map((name) {
            return HomeListWidget(
              title: name,
            );
          }).toList()),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
