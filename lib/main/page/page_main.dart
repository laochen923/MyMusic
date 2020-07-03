

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/discover/page/page_discover.dart';
import 'package:mymusic/generated/l10n.dart';
import 'package:mymusic/my/page/page_my.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/video/page/page_videos.dart';
import 'package:mymusic/widgets/fixtabbarview.dart';
import 'package:mymusic/widgets/play_widget.dart';
import 'package:mymusic/yuncun/page/page_yuncun.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  PageController _pageController;
  int _selectedIndex = 0;
  List<Widget> pages = new List();
  static const _platform = const MethodChannel(Constants.CHANNEL);
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    pages.add(MyPage());
    pages.add(DiscoverPage());
    pages.add(YunCunPage());
    pages.add(VideoPage());
    _pageController = new PageController();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      _selectedIndex = _tabController.index;
      setState(() {});
    });
    _platform.setMethodCallHandler(platformCallHandler);
    super.initState();
  }

  Future<void> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case Constants.METHOD_LIKE:
        print(Constants.METHOD_LIKE);
        Provider.of<MusicPlay>(context,listen: false).like();
        break;
      case Constants.METHOD_PREVIOUS:
        print(Constants.METHOD_PREVIOUS);
        Provider.of<MusicPlay>(context,listen: false).playNext(false);
        break;
      case Constants.METHOD_PLAY:
        print(Constants.METHOD_PLAY);
        if(Provider.of<MusicPlay>(context,listen: false).song.isPlay){
          Provider.of<MusicPlay>(context,listen: false).playPause();
        }else{
          Provider.of<MusicPlay>(context,listen: false).playStart();
        }
        break;
      case Constants.METHOD_NEXT:
        print(Constants.METHOD_NEXT);
        Provider.of<MusicPlay>(context,listen: false).playNext(true);
        break;
      case Constants.METHOD_LYRIC:
        print(Constants.METHOD_LYRIC);
        Provider.of<MusicPlay>(context,listen: false).like();
        break;
    }
  }
  var lastPopTime;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(child:Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: _selectedIndex == 0
              ? AppColors.color_black22
              : AppColors.color_main,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Routers.navigateTo(context, Routers.searchPage);
                })
          ],
          title: TabBar(
            onTap: (index) {
              _selectedIndex = index;
              _pageController.jumpToPage(index);
              setState(() {});
            },
            labelPadding: EdgeInsets.all(0),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                  child: Text(S.of(context).tab_my,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: _selectedIndex == 0 ? 40.sp : 30.sp))),
              //解决文字抖动
              Tab(
                  child: Text(S.of(context).tab_discover,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: _selectedIndex == 1 ? 40.sp : 30.sp))),
              Tab(
                  child: Text(S.of(context).tab_yuncun,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: _selectedIndex == 2 ? 40.sp : 30.sp))),
              Tab(
                  child: Text(S.of(context).tab_video,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: _selectedIndex == 3 ? 40.sp : 30.sp))),
            ],
            indicator: const BoxDecoration(),
            indicatorPadding: EdgeInsets.zero,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: FixTabBarView(
            pageController: _pageController,
            tabController: _tabController,
            children: <Widget>[pages[0], pages[1], pages[2], pages[3]]),
        bottomNavigationBar: PlayWidget()
    ),
    onWillPop: () async {
      if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
        lastPopTime = DateTime.now();
        Fluttertoast.showToast(msg: "再按一次退出App");
        return false;
      }else{
        lastPopTime = DateTime.now();
        // 退出app
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      }
    },
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
