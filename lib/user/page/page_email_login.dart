import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/net/error_entity.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/user/entity/user_entity.dart';
import 'package:mymusic/user/entity/user_play_list_entity.dart';
import 'package:mymusic/user/model/model_user.dart';
import 'package:mymusic/user/view/view_login.dart';
import 'package:mymusic/user/view/view_user.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

/*
 * @date on 2020/4/10 14:06
 * @author jack
 * @filename page_email_login.dart
 * @description 邮箱登录页面
 */
class EmailLoginPage extends StatefulWidget {
  @override
  _EmailLoginPageState createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> with LoginView,UserView {
  TextEditingController _accountController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网易邮箱账号登录'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80.h, left: 30.w, right: 30.h),
            child: new TextField(
                controller: _accountController,
                decoration:
                InputDecoration(hintText: "邮箱", focusColor: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.only(top: 100.h, left: 650.w),
            child: InkWell(
                onTap: () {
                  _accountController.clear();
                },
                child: Icon(Icons.clear)),
          ),
          Container(
            margin: EdgeInsets.only(top: 200.h, left: 30.w, right: 30.h),
            child: new TextField(
                obscureText: true,
                controller: _passwordController,
                decoration:
                InputDecoration(hintText: "密码", focusColor: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.only(top: 240.h, left: 560.w),
            child: InkWell(
                onTap: () {
                  //密码
                  print("onTap");
                  _launchInBrowser(
                      'https://reg.163.com/naq/findPassword#/verifyAccount');
                },
                child: Text(
                  '忘记密码?',
                  style: TextStyle(color: AppColors.color_deepskyblue),
                )),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 400.h, left: 60.w, right: 60.w),
            decoration: BoxDecoration(
                color: AppColors.color_main,
                border: new Border.all(color: Colors.white, width: 1.w),
                borderRadius: new BorderRadius.all(Radius.elliptical(50, 50))),
            height: 80.h,
            width: ScreenUtil.screenWidth,
            child: FlatButton(
              onPressed: () {
                UserModel.loginByEmail(
                    _accountController.text, _passwordController.text, this);
              },
              padding: EdgeInsets.all(0),
              child: Text("登录",
                  style: TextStyle(color: Colors.white, fontSize: 30.sp)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void loginFailed(ErrorEntity error) {
    Fluttertoast.showToast(msg: error.message);
  }

  @override
  void loginSuccess(UserEntity userEntity) {
    print("loginSuccess");
    Global.userEntity = userEntity;
    SharedPreferenceUtil.setInt("uid", Global.userEntity.account.id);
    SharedPreferenceUtil.setString("token", Global.userEntity.token);
    SharedPreferenceUtil.saveUserInfo(userEntity);
    UserModel.getUserDetail(Global.userEntity.account.id,context,this);
  }

  Widget showProgressDialog() {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('登录中...'),
          )
        ],
      ),
    );
  }

  @override
  void hideLoading() {
      //Navigator.of(context).pop();
  }

  @override
  void showLoading() {
    showDialog(
        context: context,
        builder: (context) {
          return showProgressDialog();
        });
  }


  @override
  void getUserPlayListSuccess(UserPlayListEntity entity) {

  }

  @override
  void getUserDetailSuccess() {
    Routers.navigateTo(context, Routers.mainPage, replace: true,clearStack: true);
  }

}
