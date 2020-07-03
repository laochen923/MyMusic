import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/net/dio_manager.dart';
import 'package:mymusic/net/error_entity.dart';
import 'package:mymusic/provider/notice_provider.dart';
import 'package:mymusic/provider/user_provider.dart';
import 'package:mymusic/user/entity/count_entity.dart';
import 'package:mymusic/user/entity/msg_private_entity.dart';
import 'package:mymusic/user/entity/user_detail_entity.dart';
import 'package:mymusic/user/entity/user_entity.dart';
import 'package:mymusic/user/entity/user_play_list_entity.dart';
import 'package:mymusic/user/view/view_login.dart';
import 'package:mymusic/user/view/view_user.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class NoticeModel {
  //获取详细信息
  static getMsgPrivate(BuildContext context) async {
    DioManager.getInstance().get('/msg/private', {"limit":30},
        //正常回调
        (data) {
      Provider.of<Notice>(context,listen: false).msgPrivateEntity=new MsgPrivateEntity().fromJson(data);
    },
        //错误回调
        (error) {});
  }

  static getMsgComments(BuildContext context) async {
    DioManager.getInstance().get('/msg/comments', {"limit":30,"uid":Global.userDetailEntity.profile.userId},
        //正常回调
            (data) {

        },
        //错误回调
            (error) {});
  }

  static getMsgForwards(BuildContext context) async {
    DioManager.getInstance().get('/msg/forwards', {"limit":30},
        //正常回调
            (data) {

        },
        //错误回调
            (error) {});
  }

  static getMsgNotices(BuildContext context) async {
    DioManager.getInstance().get('/msg/notices', {"limit":30},
        //正常回调
            (data) {

        },
        //错误回调
            (error) {});
  }
}
