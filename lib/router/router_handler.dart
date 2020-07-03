import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/common/page_webview.dart';
import 'package:mymusic/main/page/page_main.dart';
import 'package:mymusic/main/page/search_result.dart';
import 'package:mymusic/my/page/page_comment.dart';
import 'package:mymusic/my/page/page_download_manager.dart';
import 'package:mymusic/my/page/page_edit_playlist.dart';
import 'package:mymusic/my/page/page_music_dynamic.dart';
import 'package:mymusic/my/page/page_myfriend.dart';
import 'package:mymusic/my/page/page_personal_fm.dart';
import 'package:mymusic/my/page/page_personal_info.dart';
import 'package:mymusic/my/page/page_playlist.dart';
import 'package:mymusic/my/page/page_songplay.dart';
import 'package:mymusic/splash/page/page_welcome.dart';
import 'package:mymusic/user/page/page_email_login.dart';
import 'package:mymusic/my/page/page_local_music.dart';
import 'package:mymusic/my/page/page_follow_new_songs.dart';
import 'package:mymusic/my/page/page_my_radio.dart';
import 'package:mymusic/my/page/page_my_sub.dart';
import 'package:mymusic/main/page/page_search.dart';
import 'package:mymusic/user/page/page_message.dart';
Handler mainHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MainPage();
});

Handler welcomeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return WelcomePage();
});

Handler webViewHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return FlutterWebView(
      url: params["url"].first, barTitle: params["barTitle"].first);
});

Handler emailLoginHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return EmailLoginPage();
});

Handler playListHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return PlayListPage(id:params["id"].first);
});

Handler songPlayHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SongPlay();
});

Handler localMusicHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LocalMusicPage();
});
Handler downloadManagerHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return DownloadManagerPage();
});
Handler followNewSongsHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return FollowNewSongsPage();
});
Handler myRadioHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MyRadioPage();
});
Handler mySubHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MySubPage();
});
Handler searchHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SearchPage();
});

Handler searchResultHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SearchResultPage();
});

Handler personalFmHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return PersonalFmPage();
});
Handler personalInfoHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return PersonalInfoPage();
});
Handler commentHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return CommentPage();
});
Handler musicDynamicHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MusicDynamicPage();
});
Handler editPlayListHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return EditPlayListPage();
});
Handler myMessageHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MyMessagePage();
});
Handler myFriendHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MyFriendPage();
});


