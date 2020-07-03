import 'package:flutter/material.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/widgets/app_tabs.dart';
import 'package:mymusic/widgets/app_underlinetabindicator.dart';
import 'package:mymusic/widgets/fixtabbarview.dart';
import 'package:mymusic/yuncun/page/page_attention.dart';
import 'package:mymusic/yuncun/page/page_square.dart';

class YunCunPage extends StatefulWidget {
  @override
  _YunCunPageState createState() => _YunCunPageState();
}

class _YunCunPageState extends State<YunCunPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  PageController _pageController;
  List<Widget> pages = new List();

  @override
  void initState() {
    pages.add(SquarePage());
    pages.add(AttentionPage());
    _pageController = new PageController();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              titleSpacing: 100,
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
                    mWidth: 80.w,
                    borderSide: BorderSide(width: 2.0, color: Colors.white)),
                tabs: <Widget>[
                  AppTab(
                      tabHeight: 59.h,
                      child: Text("广场",
                          maxLines: 1, style: TextStyle(fontSize: 28.sp))),
                  //解决文字抖动
                  AppTab(
                      tabHeight: 59.h,
                      child: Text("关注",
                          maxLines: 1, style: TextStyle(fontSize: 28.sp))),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(60.h)),
        body: FixTabBarView(
            pageController: _pageController,
            tabController: _tabController,
            children: <Widget>[pages[0], pages[1]]));
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
