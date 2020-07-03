import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/net/dio_manager.dart';
import 'package:mymusic/net/error_entity.dart';
import 'package:mymusic/provider/user_provider.dart';
import 'package:mymusic/user/entity/count_entity.dart';
import 'package:mymusic/user/entity/user_detail_entity.dart';
import 'package:mymusic/user/entity/user_entity.dart';
import 'package:mymusic/user/entity/user_play_list_entity.dart';
import 'package:mymusic/user/view/view_login.dart';
import 'package:mymusic/user/view/view_user.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class UserModel {
  //获取详细信息
  static getUserDetail(int uid, BuildContext context,UserView userView) async {
    DioManager.getInstance().post('/user/detail', {"uid": uid},
        //正常回调
        (data) {
      Global.userDetailEntity = new UserDetailEntity().fromJson(data);
      //持久化用户详细数据
      Provider.of<UserProvider>(context,listen: false)
          .setUserDetailInfo(Global.userDetailEntity.level,Global.userDetailEntity.profile.backgroundUrl);
      SharedPreferenceUtil.saveUserDetailInfo(Global.userDetailEntity);
      userView.getUserDetailSuccess();
    },
        //错误回调
        (error) {});
  }

  //邮箱登录
  static loginByEmail(
      String email, String password, LoginView loginView) async {
    loginView.showLoading();
    DioManager.getInstance()
        .post('/login', {"email": email, "password": password},
            //正常回调
            (data) {
      loginView.hideLoading();
      loginView.loginSuccess(new UserEntity().fromJson(data));
    },
            //错误回调
            (error) {
      loginView.hideLoading();
      Map<String, dynamic> dataMap = json.decode(error);
      loginView.loginFailed(new ErrorEntity().fromJson(dataMap));
    });
  }

  //获取用户信息 , 歌单，收藏，mv, dj 数量
  static getUserInfo(BuildContext context) async {
    DioManager.getInstance().get(
        '/user/subcount',
        null,
        //正常回调
        (data) {
          Provider.of<UserProvider>(context,listen: false)
              .setSongSheetCount(data["createdPlaylistCount"], data["subPlaylistCount"]);
        },
        //错误回调
        (error) {});
  }

  //获取用户歌单
  static getUserPlayList(int uid,UserView userView) async {
    DioManager.getInstance().get(
        '/user/playlist',
        {"uid": uid},
        //正常回调
        (data) {
          userView.getUserPlayListSuccess(new UserPlayListEntity().fromJson(data));
        },
        //错误回调
        (error) {});
  }
}
