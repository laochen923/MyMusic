

import 'package:flutter/material.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/net/dio_manager.dart';
import 'package:mymusic/provider/user_provider.dart';
import 'package:mymusic/user/entity/user_entity.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashModel {
  static refreshLogin(BuildContext context) async{
    DioManager.getInstance().post('/login/refresh', null,
        //正常回调
        (data) async {
      SharedPreferenceUtil.getUserInfo().then((UserEntity bean) {
        Global.userEntity = bean;
      });
      SharedPreferenceUtil.getUserDetailInfo().then((bean) {
        Global.userDetailEntity = bean;
        Provider.of<UserProvider>(context,listen: false)
            .setUserDetailInfo(Global.userDetailEntity.level,Global.userDetailEntity.profile.backgroundUrl);
      });
    },
        //错误回调
        (error) {});
  }
}
