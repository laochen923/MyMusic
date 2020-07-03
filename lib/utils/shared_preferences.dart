import 'dart:convert';

import 'package:mymusic/common/constants.dart';
import 'package:mymusic/user/entity/user_detail_entity.dart';
import 'package:mymusic/user/entity/user_entity.dart';
import 'package:mymusic/my/entity/play_song_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  static Future<bool> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<bool> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool> setDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setDouble(key, value);
  }

  static Future<double> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  static Future<bool> setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(key, value);
  }

  static Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return null == prefs.getInt(key) ? 0 : prefs.getInt(key);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(key, value);
  }

  static Future<List<String>> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static Future<bool> containsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static Future<bool> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<bool> clear(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> saveUserInfo(UserEntity bean) async {
    if (bean.bindings.length > 1) {
      saveAuthToken(bean.bindings[1].tokenJsonStr);
    }
    String dataStr = json.encode(bean.toJson());
    return setString(Constants.USER_INFO, dataStr);
  }

  static Future<bool> saveUserDetailInfo(UserDetailEntity bean) async {
    String dataStr = json.encode(bean.toJson());
   return setString(Constants.USER_DETAIL_INFO, dataStr);
  }

  static Future<UserDetailEntity> getUserDetailInfo() async {
    return await getString(Constants.USER_DETAIL_INFO).then((val) {
      Map<String, dynamic> dataMap = json.decode(val);
      return UserDetailEntity().fromJson(dataMap);
    });
  }

  static Future<UserEntity> getUserInfo() async {
    return await getString(Constants.USER_INFO).then((val) {
      Map<String, dynamic> dataMap = json.decode(val);
      UserEntity userEntity = UserEntity().fromJson(dataMap);
      return userEntity;
    });
  }

  static Future<bool> saveAuthToken(String token) async {
    return setString(Constants.AUTH_TOKEN, token);
  }

  static Future<String> getAuthToken() async {
    return getString(Constants.AUTH_TOKEN);
  }

  static Future<bool> saveSongInfo(PlaySongEntity bean) async {
    String dataStr = json.encode(bean.toJson());
    return setString(Constants.USER_SONG_INFO, dataStr);
  }

  static Future<PlaySongEntity> getSongInfo() async {
    return await getString(Constants.USER_SONG_INFO).then((val) {
      Map<String, dynamic> dataMap = json.decode(val);
      return PlaySongEntity().fromJson(dataMap);
    });
  }

  static Future<bool> savePlayMode(int playMode) async {
    return setInt(Constants.USER_SONG_PLAY_MODE_INFO, playMode);
  }

  static Future<int> getPlayMode() async {
    return getInt(Constants.USER_SONG_PLAY_MODE_INFO);
  }
}
