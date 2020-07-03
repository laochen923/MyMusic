import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

class Routers {
  static Router router;
  static String root = "/";
  static String welcome = '/welcome';
  static String mainPage = '/main';
  static String webViewPage = '/webview';
  static String emailLoginPage = '/emailLoginPage';
  static String playListPage='/playListPage';
  static String songPlayPage='/songPlayPage';
  static String localMusicPage='/localMusicPage';
  static String downloadManagerPage='/DownloadManagerPage';
  static String followNewSongsPage='/FollowNewSongsPage';
  static String myRadioPage='/MyRadioPage';
  static String mySubPage='/MySubPage';
  static String searchPage='/SearchPage';
  static String searchResultPage='/SearchResultPage';
  static String personalFmPage='/PersonalFm';
  static String personalInfoPage='/PersonalInfo';
  static String commentPage='/CommentPage';
  static String musicDynamicPage='/MusicDynamicPage';
  static String editPlayListPage='/EditPlayListPage';
  static String myMessagePage='/MyMessagePage';
  static String myFriendPage='/MyFriendPage';

  static void configRouters(Router routers) {
    //找不到路由
    router=routers;
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('Rounter Not Found');
    });
    //路由配置
    router.define(mainPage, handler: mainHandler);
    router.define(welcome, handler: welcomeHandler);
    router.define(webViewPage, handler: webViewHandler);
    router.define(emailLoginPage, handler: emailLoginHandler);
    router.define(playListPage, handler: playListHandler);
    router.define(songPlayPage, handler: songPlayHandler);
    router.define(localMusicPage, handler: localMusicHandler);
    router.define(downloadManagerPage, handler: downloadManagerHandler);
    router.define(followNewSongsPage, handler: followNewSongsHandler);
    router.define(myRadioPage, handler: myRadioHandler);
    router.define(mySubPage, handler: mySubHandler);
    router.define(searchPage, handler: searchHandler);
    router.define(searchResultPage, handler: searchResultHandler);
    router.define(personalFmPage, handler: personalFmHandler);
    router.define(personalInfoPage, handler: personalInfoHandler);
    router.define(commentPage, handler: commentHandler);
    router.define(musicDynamicPage, handler: musicDynamicHandler);
    router.define(editPlayListPage, handler: editPlayListHandler);
    router.define(myMessagePage, handler: myMessageHandler);
    router.define(myFriendPage, handler: myFriendHandler);
  }

  //传参封装
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params,bool replace = false,
  bool clearStack = false,
  TransitionType transition,
  Duration transitionDuration = const Duration(milliseconds: 250),
  RouteTransitionsBuilder transitionBuilder}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    path = path + query;
    return router.navigateTo(context, path, transition:transition,replace: replace,clearStack: clearStack,transitionDuration: transitionDuration,transitionBuilder: transitionBuilder);
  }

  static SlideTransition createSlideTransition(
      Animation<double> animation, Widget child) {
     //左侧滑动进入退出
    return SlideTransition(
      position: Tween<Offset>(
          begin: Offset(-1.0, 0.0),
          end: Offset(0.0, 0.0)
      ).animate(CurvedAnimation(
          parent: animation,
          curve:Curves.fastOutSlowIn
      )),
      child: child,
    );
  }
  static FadeTransition createFadeTransition(
      Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: Tween(begin: 0.0,end: 1.0)
          .animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,  //动画曲线
      )),
      child: child,
    );
  }

  static ScaleTransition createScaleTransition(
      Animation<double> animation, Widget child) {
    return ScaleTransition(
      scale: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      )),
      child: child,
    );
  }



}
