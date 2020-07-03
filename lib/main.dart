import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/provider/notice_provider.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/splash/page/page_splash.dart';
import 'package:mymusic/theme/theme_red.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'generated/l10n.dart';
import 'net/dio_manager.dart';
import 'provider/music_provider.dart';
import 'provider/user_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider()),
    ChangeNotifierProvider.value(value: MusicPlay()),
    ChangeNotifierProvider.value(value: Search()),
    ChangeNotifierProvider.value(value: Notice())
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    Global.flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android, iOS);
    Global.flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: onSelectNotification);
    WidgetsFlutterBinding.ensureInitialized();
    FlutterDownloader.initialize(
        debug: true // optional: set false to disable printing logs to console
    );
    super.initState();
  }



  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
  }

  @override
  Widget build(BuildContext context) {
    try{
      if (Platform.isAndroid) {
        // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
        SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
        Permission.storage.request();
      }
    } catch(e){

    }
    SystemChrome.setEnabledSystemUIOverlays([]);
    final router = Router();
    Routers.configRouters(router);
    DioManager.init();
    return Container(
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //初始化国际化
        debugShowCheckedModeBanner: false,
        //去除debug标记
        supportedLocales: S.delegate.supportedLocales,
        title: 'MyMusic',
        theme: AppTheme.buildRedTheme(),
        onGenerateRoute: Routers.router.generator,
        home: SplashPage(),
      ),
    );
  }
}