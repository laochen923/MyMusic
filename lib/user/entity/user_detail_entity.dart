import 'package:flutter/foundation.dart';
import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class UserDetailEntity with JsonConvert<UserDetailEntity> {
  int level;
  int listenSongs;
  UserDetailUserPoint userPoint;
  bool mobileSign;
  bool pcSign;
  UserDetailProfile profile;
  bool peopleCanSeeMyPlayRecord;
  List<UserDetailBinding> bindings;
  bool adValid;
  int code;
  int createTime;
  int createDays;
}

class UserDetailUserPoint with JsonConvert<UserDetailUserPoint> {
  int userId;
  int balance;
  int updateTime;
  int version;
  int status;
  int blockBalance;
}

class UserDetailProfile with JsonConvert<UserDetailProfile> {
  String nickname;
  int createTime;
  int djStatus;
  int accountStatus;
  int province;
  int vipType;
  bool followed;
  bool mutual;
  dynamic remarkName;
  int avatarImgId;
  int birthday;
  int gender;
  String avatarUrl;
  int userType;
  int authStatus;
  String detailDescription;
  UserDetailProfileExperts experts;
  dynamic expertTags;
  int city;
  bool defaultAvatar;
  int backgroundImgId;
  String backgroundUrl;
  String avatarImgIdStr;
  String description;
  int userId;
  String backgroundImgIdStr;
  String signature;
  int authority;
  int followeds;
  int follows;
  bool blacklist;
  int eventCount;
  int allSubscribedCount;
  int playlistBeSubscribedCount;
  @JSONField(name: "avatarImgId_str")
  String avatarimgidStr;
  dynamic followTime;
  bool followMe;
  List<dynamic> artistIdentity;
  int cCount;
  int sDJPCount;
  int playlistCount;
  int sCount;
  int newFollows;
}

class UserDetailProfileExperts with JsonConvert<UserDetailProfileExperts> {}

class UserDetailBinding with JsonConvert<UserDetailBinding> {
  int expiresIn;
  int refreshTime;
  int bindingTime;
  dynamic tokenJsonStr;
  bool expired;
  String url;
  int userId;
  int id;
  int type;
}
