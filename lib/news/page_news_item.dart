import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/news_data_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gank/news/page_news_detail.dart';

// ignore: must_be_immutable
class NewsItemWidget extends StatefulWidget {
  Articles articles;

  int index;

  NewsItemWidget({@required this.articles, @required this.index});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsItemState();
  }
}

//0 大图 1 左右 2 三张图 3 无图
class NewsItemState extends State<NewsItemWidget> {
  @override
  Widget build(BuildContext context) {
    int type = widget.index % 4;
    return GestureDetector(
      child: buildItem(context, type),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute<void>(builder: (BuildContext context) {
          return new NewsDetailWidget(
            articles: widget.articles,
          );
        }));
      },
    );
  }

  Widget buildItem(BuildContext c, int type) {
    if (type == 0) {
      return Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.articles.articleTitle,
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
                      image: CachedNetworkImageProvider(
                          widget.articles.coverBigUrl),
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
                                widget.articles.authorPortraitUrl),
                            fit: BoxFit.cover)),
//                  child:
//                      CachedNetworkImage(imageUrl: widget.articles.gameLogoUrl),
                  ),
                  Text(
                    widget.articles.authorName,
                    style: TextStyle(fontSize: 14),
                  ),
                  Spacer(),
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 8),
                    child: Image.asset("images/icon_reader.png"),
                  ),
                  Text(widget.articles.articleRead.toString()),
                ],
              ),
            )
          ],
        ),
      );
    } else if (type == 1) {
      return Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Flex(
          children: <Widget>[
            Expanded(
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.articles.articleTitle,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(360)),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      widget.articles.authorPortraitUrl),
                                  fit: BoxFit.cover)),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 80),
                          child: Text(
                            widget.articles.authorName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.only(right: 8),
                          child: Image.asset("images/icon_reader.png"),
                        ),
                        Text(widget.articles.articleRead.toString()),
                      ],
                    ),
                  )
                ],
                direction: Axis.vertical,
              ),
            ),
            Container(
              width: 120,
              height: 90,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.articles.coverBigUrl),
                      fit: BoxFit.cover)),
            )
          ],
          direction: Axis.horizontal,
        ),
      );
    } else if (type == 2) {
      List<String> list = widget.articles.articleContentList;
      List<String> urls = List();
      list.forEach((s) {
        if (s.startsWith("http")) {
          urls.add(s);
        }
      });
      if (urls.length < 3) {
        urls.add(widget.articles.coverBigUrl);
        urls.add(widget.articles.coverBigUrl);
        urls.add(widget.articles.coverBigUrl);
        urls.add(widget.articles.coverBigUrl);
      }
      return Container(
        height: 193,
        padding: EdgeInsets.all(10),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              child: Text(
                widget.articles.articleTitle,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: 80,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(urls[0]),
                            fit: BoxFit.cover)),
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(urls[1]),
                            fit: BoxFit.cover)),
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(urls[2]),
                            fit: BoxFit.cover)),
                  )),
                ],
              ),
            ),
            Container(
              height: 45,
              margin: EdgeInsets.only(top: 8),
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
                                widget.articles.authorPortraitUrl),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    widget.articles.authorName,
                    style: TextStyle(fontSize: 14),
                  ),
                  Spacer(),
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 8),
                    child: Image.asset("images/icon_reader.png"),
                  ),
                  Text(widget.articles.articleRead.toString()),
                ],
              ),
            )
          ],
        ),
      );
    } else if (type == 3) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              child: Text(
                widget.articles.articleTitle,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              child: Text(
                widget.articles.articleBrief,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Container(
              height: 45,
              margin: EdgeInsets.only(top: 8),
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
                                widget.articles.authorPortraitUrl),
                            fit: BoxFit.cover)),
//                  child:
//                      CachedNetworkImage(imageUrl: widget.articles.gameLogoUrl),
                  ),
                  Text(
                    widget.articles.authorName,
                    style: TextStyle(fontSize: 14),
                  ),
                  Spacer(),
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 8),
                    child: Image.asset("images/icon_reader.png"),
                  ),
                  Text(widget.articles.articleRead.toString()),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
