import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/r.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/router/routers.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

/*
 * @date on 2020/4/13 10:36
 * @author jack
 * @filename page_welcome.dart
 * @description
 */
class _WelcomePageState extends State<WelcomePage> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Material(
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.color_main,
            ),
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 160.h),
                child: Image.asset(R.assetsImgIconLogin),
                height: 240.w,
                width: 240.w,
              ),
              Container(
                margin: EdgeInsets.only(top: 400.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        new BorderRadius.all(Radius.elliptical(50, 50))),
                height: 60.h,
                width: 360.w,
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(0),
                  child: Text("手机号登录",
                      style: TextStyle(
                          color: AppColors.color_main,
                          fontSize: 24.sp)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                    color: AppColors.color_main,
                    border: new Border.all(color: Colors.white, width: 1.w),
                    borderRadius:
                        new BorderRadius.all(Radius.elliptical(50, 50))),
                height: 60.h,
                width: 360.w,
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(0),
                  child: Text("立即体验",
                      style: TextStyle(color: Colors.white, fontSize: 24.sp)),
                ),
              ),
              Container(
                width: 360.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (!this.check) {
                          Fluttertoast.showToast(
                              msg: "请先勾选同意 《用户协议》《隐私政策》《儿童隐私政策》");
                          return;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.h),
                        width: 50.w,
                        height: 50.w,
                        child: Image.asset(R.assetsImgIcLoginWx,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!this.check) {
                          Fluttertoast.showToast(
                              msg: "请先勾选同意 《用户协议》《隐私政策》《儿童隐私政策》");
                          return;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.h),
                        width: 50.w,
                        height: 50.h,
                        child: Image.asset(R.assetsImgIcLoginQq,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!this.check) {
                          Fluttertoast.showToast(
                              msg: "请先勾选同意 《用户协议》《隐私政策》《儿童隐私政策》");
                          return;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.h),
                        width: 50.w,
                        height: 50.h,
                        child: Image.asset(R.assetsImgIcLoginWb,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //邮箱登录
                        if (!this.check) {
                          Fluttertoast.showToast(
                              msg: "请先勾选同意 《用户协议》《隐私政策》《儿童隐私政策》");
                          return;
                        }
                        Routers
                            .navigateTo(context, Routers.emailLoginPage);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.h),
                        width: 50.w,
                        height: 50.h,
                        child: Image.asset(R.assetsImgIcLoginEmail,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        this.check = !this.check;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.all(
                              Radius.elliptical(3, 3),
                            ),
                            border: new Border.all(
                                color: Colors.white70, width: 1.w)),
                        height: 25.w,
                        width: 25.w,
                        margin: EdgeInsets.only(top: 50.h),
                        child: this.check
                            ? new Icon(
                                Icons.check,
                                size: 25.w,
                                color: Colors.white70,
                              )
                            : null),
                  ),
                  InkWell(
                      onTap: () {
                        Routers.navigateTo(context, Routers.webViewPage,
                            params: {
                              "url":
                                  "https://st.music.163.com/official-terms/service",
                              "barTitle": "用户协议"
                            });
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 50.h, left: 20.w),
                          child: Text("《用户协议》",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp)))),
                  InkWell(
                      onTap: () {
                        Routers.navigateTo(context, Routers.webViewPage,
                            params: {
                              "url":
                                  "https://st.music.163.com/official-terms/privacy",
                              "barTitle": "隐私政策"
                            });
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 50.h, left: 20.w),
                          child: Text("《隐私政策》",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp)))),
                  InkWell(
                      onTap: () {
                        Routers.navigateTo(context, Routers.webViewPage,
                            params: {
                              "url":
                                  "https://st.music.163.com/official-terms/children",
                              "barTitle": "儿童隐私政策"
                            });
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 50.h, left: 20.w),
                          child: Text("《儿童隐私政策》",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp))))
                ],
              )
            ])));
  }
}
