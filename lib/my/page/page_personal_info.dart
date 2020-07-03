import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/provider/user_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/user/entity/user_play_list_entity.dart';
import 'package:provider/provider.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  List<UserPlayListPlaylist> playlist = new List();
  List<UserPlayListPlaylist> tempPlaylist = new List();

  @override
  void initState() {
    playlist.addAll(Provider.of<UserProvider>(context, listen: false)
        .playlist
        .where((bean) {
      return bean.userId == Global.userDetailEntity.profile.userId;
    }));
    tempPlaylist.addAll(Provider.of<UserProvider>(context, listen: false)
        .playlist
        .where((bean) {
      return bean.userId != Global.userDetailEntity.profile.userId;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: true,
          actions: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 10.w, right: 30.w),
                child: Icon(Icons.share),
              ),
            )
          ],
          flexibleSpace: Listener(
            child: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              Global.userDetailEntity.profile.backgroundUrl),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          print("getImage");
                          getImage();
                        },
                        child: Container(
                          height: 140.h,
                          width: 140.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              shape: BoxShape.circle),
                          margin: EdgeInsets.only(left: 30.w, top: 160.h),
                          child: Text(
                            "上传\n头像",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30.w, top: 330.h),
                        child: Text(
                            "${Global.userDetailEntity.profile.nickname}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30.w, top: 370.h),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                  "关注 ${Global.userDetailEntity.profile.follows}",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 28.sp)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30.w),
                              child: Text(
                                  "粉丝 ${Global.userDetailEntity.profile.followeds}",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 28.sp)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30.w, top: 420.h),
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(113, 112, 120, 0.8),
                            border: new Border.all(
                                color: Color.fromRGBO(113, 112, 120, 0.8),
                                width: 1.w),
                            borderRadius: new BorderRadius.all(
                                Radius.elliptical(50, 50))),
                        child: Text("Lv.${Global.userDetailEntity.level}",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 28.sp)),
                      ),
                      Container(
                        width: 100.w,
                        height: 50.h,
                        margin: EdgeInsets.only(left: 420.w, top: 400.h),
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(113, 112, 120, 0.8),
                            border: new Border.all(
                                color: Color.fromRGBO(113, 112, 120, 0.8),
                                width: 1.w),
                            borderRadius: new BorderRadius.all(
                                Radius.elliptical(50, 50))),
                        child: InkWell(
                            onTap: () {
                              print("编辑");
                            },
                            child: Text("编辑",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 28.sp))),
                      ),
                      Container(
                        width: 160.w,
                        height: 50.h,
                        margin: EdgeInsets.only(left: 540.w, top: 400.h),
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(113, 112, 120, 0.8),
                            border: new Border.all(
                                color: Color.fromRGBO(113, 112, 120, 0.8),
                                width: 1.w),
                            borderRadius: new BorderRadius.all(
                                Radius.elliptical(50, 50))),
                        child: InkWell(
                            onTap: () {
                              print("更换背景");
                            },
                            child: Text(
                              "更换背景",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 28.sp),
                            )),
                      ),
                    ],
                  ),
                ),
                centerTitle: false),
          ),
          expandedHeight: 440.h,
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.red,
          primary: true,
          floating: true,
          pinned: true,
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(TabBar(
              indicatorPadding: EdgeInsets.all(0),
              labelPadding: EdgeInsets.all(0),
              indicatorColor: Colors.transparent,
              labelColor: Colors.transparent,
              unselectedLabelColor: Colors.transparent,
              tabs: [
                Tab(
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    Global.userDetailEntity.profile.backgroundUrl),
                                fit: BoxFit.fill)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.vertical(
                                  top: Radius.elliptical(16, 16))),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      _selectedIndex = 0;
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      child: Text("主页",
                                          style: TextStyle(
                                              color: _selectedIndex == 0
                                                  ? AppColors.color_main
                                                  : Colors.black,
                                              fontWeight: _selectedIndex == 0
                                                  ? FontWeight.bold
                                                  : FontWeight.normal)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _selectedIndex = 1;
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      child: Text("动态",
                                          style: TextStyle(
                                              color: _selectedIndex == 0
                                                  ? Colors.black
                                                  : AppColors.color_main,
                                              fontWeight: _selectedIndex == 0
                                                  ? FontWeight.normal
                                                  : FontWeight.bold)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )))
              ],
              controller: TabController(length: 1, vsync: this),
            ))),
        SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
          return Container(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 30.w, top: 30.h),
                            width: 100.w,
                            height: 100.w,
                            child: Image.asset(R.assetsImgIcRanking),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20.w),
                                child: Text("听歌排行"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.w),
                                child: Text(
                                  "累计听歌${Global.userDetailEntity.listenSongs}首",
                                  style: TextStyle(
                                      fontSize: 24.sp, color: Colors.black45),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 30.w, top: 30.h),
                            width: 100.w,
                            height: 100.w,
                            child: Image.asset(R.assetsImgIcLikeSong),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20.w),
                                child: Text("我喜欢的音乐"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.w),
                                child: Text(
                                  "${playlist[0].trackCount}首,播放${playlist[0].playCount}次",
                                  style: TextStyle(
                                      fontSize: 24.sp, color: Colors.black45),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 300.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 30.w, top: 40.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('创建歌单',
                                  style: TextStyle(
                                      fontSize: 35.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '  ${Provider.of<UserProvider>(context).loveSongSheetCount != null ? Provider.of<UserProvider>(context).loveSongSheetCount - 1 : 0}',
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      fontWeight: FontWeight.bold))
                            ],
                          )),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: new NeverScrollableScrollPhysics(),
                            itemCount: playlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildPlayListItem(playlist[index]);
                            }),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 30.w, top: 40.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('收藏歌单',
                                  style: TextStyle(
                                      fontSize: 35.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '  ${Provider.of<UserProvider>(context).collectSongSheetCount != null ? Provider.of<UserProvider>(context).collectSongSheetCount : 0}',
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      fontWeight: FontWeight.bold))
                            ],
                          )),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: new NeverScrollableScrollPhysics(),
                            itemCount: tempPlaylist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildPlayListItem(tempPlaylist[index]);
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }, childCount: 1))
      ])
    ]));
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  Widget _buildPlayListItem(UserPlayListPlaylist playlist) {
    return new GestureDetector(
        onTap: () {
          //处理点击事件
          Routers.navigateTo(context, Routers.playListPage,
              params: {"id": "${playlist.id}"});
        },
        child: Container(
            margin: EdgeInsets.only(left: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(247, 247, 247, 1), width: 1),
                      //边框
                      borderRadius: BorderRadius.all(
                        //圆角
                        Radius.circular(8.0),
                      )),
                  margin: EdgeInsets.only(left: 20.w, top: 20.h),
                  height: 110.h,
                  width: 110.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(playlist.coverImgUrl)),
                ),
                Column(children: <Widget>[
                  Container(
                    width: 400.w,
                    margin: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: Text(playlist.name,
                        maxLines: 2,
                        style: TextStyle(fontSize: 26.sp),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 5.h),
                    width: 400.w,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${playlist.trackCount}首",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black45,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )
                ])
              ],
            )));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
