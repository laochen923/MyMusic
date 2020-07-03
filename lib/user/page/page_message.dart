import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/provider/notice_provider.dart';
import 'package:mymusic/user/page/page_comment.dart';
import 'package:mymusic/user/page/page_notice.dart';
import 'package:mymusic/user/page/page_private_letters.dart';
import 'package:mymusic/user/page/page_tome.dart';
import 'package:mymusic/widgets/app_tabs.dart';
import 'package:mymusic/widgets/app_underlinetabindicator.dart';
import 'package:mymusic/widgets/fixtabbarview.dart';
import 'package:provider/provider.dart';

class MyMessagePage extends StatefulWidget {
  @override
  _MyMessagePageState createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _selectedIndex = 0;
  List<Widget> pages = new List();

  @override
  void initState() {
    pages.add(PrivateLettersPage());
    pages.add(CommentPage());
    pages.add(ToMePage());
    pages.add(NoticePage());
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
        elevation: 0,
        title: Text("我的消息"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 30.w),
            alignment: Alignment.center,
            child: Text("标记已读"),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: AppColors.color_main,
            child: TabBar(
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
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Text("私信",
                              maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                        ),
                        Visibility(
                          visible: Provider.of<Notice>(context, listen: false).msgPrivateEntity!=null&&Provider.of<Notice>(context, listen: false).msgPrivateEntity.newMsgCount!=0,
                          child: Container(
                            width: 35.w,
                            height: 35.w,
                            margin: EdgeInsets.only(left: 80.w,top: 5.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Text(
                                "${Provider.of<Notice>(context, listen: false).msgPrivateEntity!=null?Provider.of<Notice>(context, listen: false).msgPrivateEntity.newMsgCount:0}",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 28.sp, color: Colors.red)),
                          ),
                        )
                      ],
                    )),
                AppTab(
                    tabHeight: 69.h,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Text("评论",
                              maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                        ),
                        Visibility(
                          visible: false,
                          child: Container(
                            width: 35.w,
                            height: 35.w,
                            margin: EdgeInsets.only(left: 80.w,top: 5.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Text(
                                "",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 28.sp, color: Colors.red)),
                          ),
                        )
                      ],
                    )),
                AppTab(
                    tabHeight: 69.h,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Text("@我",
                              maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                        ),
                        Visibility(
                          visible: false,
                          child: Container(
                            width: 35.w,
                            height: 35.w,
                            margin: EdgeInsets.only(left: 80.w,top: 5.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Text(
                                "",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 28.sp, color: Colors.red)),
                          ),
                        )
                      ],
                    )),
                AppTab(
                    tabHeight: 69.h,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Text("通知",
                              maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                        ),
                        Visibility(
                          visible: false,
                          child: Container(
                            width: 35.w,
                            height: 35.w,
                            margin: EdgeInsets.only(left: 80.w,top: 5.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Text(
                                "",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 28.sp, color: Colors.red)),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 70.h),
            child: FixTabBarView(
                pageController: _pageController,
                tabController: _tabController,
                children: <Widget>[pages[0], pages[1], pages[2], pages[3]]),
          )
        ],
      ),
    );
  }
}
