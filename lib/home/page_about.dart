import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutState();
  }
}

class AboutState extends State<AboutWidget> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _handleClick(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("关于作者"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 65,
                height: 65,
                margin: EdgeInsets.only(bottom: 20),
                child: Image.asset("images/ic_meituan.png"),
              ),
              Text(
                "基于Google Flutter的美团客户端",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Padding(padding: EdgeInsets.only(top: 100)),
              RichText(
                  text: TextSpan(
                      text: "GitHub：",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                    TextSpan(
                        text: "https://github.com/lrain-lv",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _handleClick("https://github.com/lrain-lv");
                          },
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            decoration: TextDecoration.underline))
                  ])),
              Padding(padding: EdgeInsets.only(top: 20)),
              RichText(
                  text: TextSpan(
                      text: "CSDN：",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                    TextSpan(
                        text: "https://blog.csdn.net/Dreamfree3",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _handleClick("https://blog.csdn.net/Dreamfree3");
                          },
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            decoration: TextDecoration.underline))
                  ])),
            ]),
      ),
    );
  }
}
