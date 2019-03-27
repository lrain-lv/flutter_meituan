import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/news_data_entity.dart';

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("详情"),
          centerTitle: true,
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
