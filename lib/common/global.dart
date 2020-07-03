import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mymusic/my/entity/lyric_entity.dart';
import 'package:mymusic/user/entity/user_detail_entity.dart';
import 'package:mymusic/user/entity/user_entity.dart';

class Global{
  static UserEntity userEntity;
  static UserDetailEntity userDetailEntity;
  static LyricEntity lyricEntity;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
}