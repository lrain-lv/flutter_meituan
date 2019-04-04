import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gank/entity/event/login_event.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gank/EventBus.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<LoginWidget> {
  TextEditingController _phoneController;
  TextEditingController _pwdController;

  bool isShowPwd = true;

  bool isShowClear = false;

  bool isBtnEnable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneController = new TextEditingController();
    _pwdController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Color.fromARGB(250, 6, 193, 174),
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "欢迎登录美团",
              style: TextStyle(fontSize: 26, color: Colors.black87),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 55,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                  // 下滑线浅灰色，宽度1像素
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[350], width: 1.0))),
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "+86 >",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Padding(padding: EdgeInsets.only(right: 15)),
                  Expanded(
                      child: TextField(
                    maxLength: 11,
                    onChanged: (s) {
                      setState(() {
                        isShowClear = !(s == null || s.length == 0);
                      });
                      if (s.length > 0 && _pwdController.text.length > 0) {
                        setState(() {
                          isBtnEnable = true;
                        });
                      } else {
                        setState(() {
                          isBtnEnable = false;
                        });
                      }
                    },
                    controller: _phoneController,
                    cursorColor: Color.fromARGB(250, 6, 193, 174),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "请输入手机号",
                        counterText: "",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 13.0)),
                  )),
                  isShowClear
                      ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 16,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _phoneController.text = "";
                            setState(() {
                              isShowClear = false;
                            });

                            if (_phoneController.text.length > 0 &&
                                _pwdController.text.length > 0) {
                              setState(() {
                                isBtnEnable = true;
                              });
                            } else {
                              setState(() {
                                isBtnEnable = false;
                              });
                            }
                          })
                      : Container()
                ],
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                  // 下滑线浅灰色，宽度1像素
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[350], width: 1.0))),
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: _pwdController,
                    cursorColor: Color.fromARGB(250, 6, 193, 174),
                    obscureText: isShowPwd,
                    maxLength: 6,
                    style: TextStyle(fontSize: 20),
                    onChanged: (s) {
                      if (_phoneController.text.length > 0 && s.length > 0) {
                        setState(() {
                          isBtnEnable = true;
                        });
                      } else {
                        setState(() {
                          isBtnEnable = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "请输入密码",
                        counterText: "",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 13.0)),
                  )),
                  IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isShowPwd = !isShowPwd;
                        });
                      })
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width - 60,
              height: 45,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                onPressed: isBtnEnable
                    ? () {
                        String phone = _phoneController.text;
                        String pwd = _pwdController.text;
                        if (phone.length == 11 && pwd.length == 6) {
                          bus.fire(new LoginEvent(true));
                          Navigator.of(context).pop();
                        } else {
                          Fluttertoast.showToast(
                            msg: "请输入11位手机号及6位数密码",
                          );
                        }
                      }
                    : null,
                color: Color.fromARGB(250, 6, 193, 174),
                disabledColor: Color.fromARGB(120, 6, 193, 174),
                child: Text(
                  "登录",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
