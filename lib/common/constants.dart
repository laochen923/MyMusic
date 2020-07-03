import 'package:mymusic/r.dart';

class Constants{
  static const String AUTH_TOKEN="AUTH_TOKEN";
  static const String USER_INFO="USER_INFO";
  static const String SEARCH_HISTORY="Search_History";
  static const String USER_DETAIL_INFO="USER_INFO";
  static const String BASE_URL="换成自己部署的地址";
  static const String USER_SONG_INFO="USER_SONG_INFO";
  static const String USER_SONG_PLAY_MODE_INFO="USER_SONG_PLAY_MODE_INFO";
  static const int CONNECT_TIMEOUT=5000;
  static const int RECEIVE_TIMEOUT=5000;

  static const int PLAY_MODE_SINGLE=1;
  static const int PLAY_MODE_RANDOM=2;
  static const int PLAY_MODE_LIST=3;
  static var PLAY_MODE_PIC= [R.assetsImgIcSinglePlay,R.assetsImgIcRandomPlay,R.assetsImgIcListPlay];
  static var PLAY_MODE_SP_PIC= [R.assetsImgIcSpSingle,R.assetsImgIcSpRandom,R.assetsImgIcSpList];
  static var PLAY_MODE_NAME= ["单曲循环","随机播放","列表循环"];

  static const  METHOD_LIKE="like";
  static const  REQUEST_CODE_LIKE=1;

  static const  METHOD_PREVIOUS="previous";
  static const REQUEST_CODE_PREVIOUS=2;

  static const  METHOD_PLAY="play";
  static const  REQUEST_CODE_PLAY=3;

  static const  METHOD_NEXT="next";
  static const  REQUEST_CODE_NEXT=4;

  static const   METHOD_LYRIC="lyric";
  static const  REQUEST_CODE_LYRIC=5;

  static const String CHANNEL = "com.jack.mymusic.toflutter";


  static const  SEARCH_TYPE_SINGLE=1;
  static const  SEARCH_TYPE_ALBUM=10;
  static const  SEARCH_TYPE_SINGER=100;
  static const  SEARCH_TYPE_SONG_LIST=1000;
  static const  SEARCH_TYPE_INCLUSIVE =1018;
  static const  SEARCH_TYPE_USER =1002;
  static const  SEARCH_TYPE_MV =1004;
  static const  SEARCH_TYPE_LYRICS =1006;
  static const  SEARCH_TYPE_RADIO =1009;
  static const  SEARCH_TYPE_VIDEO =1014;

}