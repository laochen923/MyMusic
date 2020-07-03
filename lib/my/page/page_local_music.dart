import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/widgets/app_tabs.dart';
import 'package:mymusic/widgets/app_underlinetabindicator.dart';
import 'package:mymusic/widgets/fixtabbarview.dart';
import 'package:mymusic/widgets/play_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/my/page/page_local_music_single.dart';
import 'package:mymusic/my/page/page_local_music_singer.dart';
import 'package:mymusic/my/page/page_local_music_folder.dart';
import 'package:mymusic/my/page/page_local_music_album.dart';
class LocalMusicPage extends StatefulWidget {
  @override
  _LocalMusicPageState createState() => _LocalMusicPageState();
}

class _LocalMusicPageState extends State<LocalMusicPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  PageController _pageController;
  int _selectedIndex = 0;
  List<Widget> pages = new List();

  @override
  void initState() {
    pages.add(SinglePage());
    pages.add(SingerPage());
    pages.add(AlbumPage());
    pages.add(FolderPage());
    _pageController = new PageController();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      _selectedIndex = _tabController.index;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本地音乐"),
        titleSpacing: 0,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.only(left: 0),
              icon: Icon(Icons.search, color: Colors.white,size: 30),
              onPressed: () {
                Fluttertoast.showToast(msg: "暂未实现");
              }),
          IconButton(
            padding: EdgeInsets.only(left: 0),
              icon: Icon(Icons.more_vert, color: Colors.white,size: 30),
              onPressed: () {
                Fluttertoast.showToast(msg: "暂未实现");
              })
        ],
      ),
      body:Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              automaticallyImplyLeading:false,
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: AppColors.color_main,
              title: TabBar(
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
                labelPadding: EdgeInsets.all(0),
                controller: _tabController,
                indicator: AppUnderlineTabIndicator(
                    insets: EdgeInsets.only(bottom: 0),
                    mWidth: 100.w,
                    borderSide: BorderSide(width: 2.0, color: Colors.white)),
                tabs: <Widget>[
                  AppTab(
                      tabHeight: 69.h,
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w,right: 20.w),
                        child: Text("单曲",
                            maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                      )),
                  AppTab(
                      tabHeight: 69.h,
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w,right: 20.w),
                        child: Text("歌手",
                            maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                      )),
                  AppTab(
                      tabHeight: 69.h,
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w,right: 20.w),
                        child: Text("专辑",
                            maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                      )),
                  AppTab(
                      tabHeight: 69.h,
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w,right: 20.w),
                        child: Text("文件夹",
                            maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                      )),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(70.h)),
        body: FixTabBarView(
          pageController: _pageController,
          tabController: _tabController,
          children: <Widget>[pages[0], pages[1], pages[2], pages[3]]),
      ),
        bottomNavigationBar: PlayWidget()
    );
  }
}
