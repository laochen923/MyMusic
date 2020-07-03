import 'package:flutter/material.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/video/entity/video_entity.dart';
import 'package:mymusic/video/entity/video_group_entity.dart';
import 'package:mymusic/video/model/model_video.dart';
import 'package:mymusic/video/page/page_video_group.dart';
import 'package:mymusic/video/view/view_video.dart';
import 'package:mymusic/widgets/app_tabs.dart';
import 'package:mymusic/widgets/app_underlinetabindicator.dart';
import 'package:mymusic/widgets/fixtabbarview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin ,VideoView{
  TabController _tabController;
  PageController _pageController;
  List<Widget> pages = new List();
  List<VideoGroupData> tabs=new List();

  @override
  void initState() {
    VideoModel.getVideoGroupList(this);
    _pageController=new PageController();
    _tabController = new TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: AppColors.color_main,
              title: TabBar(
                isScrollable: true,
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
                labelPadding: EdgeInsets.all(0),
                controller: _tabController,
                indicator: AppUnderlineTabIndicator(
                    insets: EdgeInsets.only(bottom: 0),
                    mWidth: 120.w,
                    borderSide: BorderSide(width: 2.0, color: Colors.white)),
                tabs: tabs.map((value) {
                  return AppTab(
                      tabHeight: 59.h,
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w,right: 20.w),
                        child: Text(value.name,
                            maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                      ));
                }).toList(),
              ),
            ),
            preferredSize: Size.fromHeight(60.h)),
        body: FixTabBarView(
            pageController: _pageController,
            tabController: _tabController,
            children: _buildPages()));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  List<Widget> _buildPages() {
    List<Widget> pages = List();
    for (int i = 0; i < tabs.length; i++) {
      Widget page = VideoGroupPage(id:tabs[i].id);
      pages.add(page);
    }
    return pages;
  }

  @override
  void updateTabs(VideoGroupEntity entity) {
    tabs.addAll(entity.data);
    setState(() {
      _tabController = new TabController(length: tabs.length, vsync: this);
    });
  }

  @override
  void updateVideos(VideoEntity entity) {
    // TODO: implement updateVideos
  }

}
