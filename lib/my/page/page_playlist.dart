

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/my/entity/lyric_entity.dart';
import 'package:mymusic/my/entity/menu_entity.dart';
import 'package:mymusic/my/entity/share_item_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/entity/song_url_entity.dart';
import 'package:mymusic/my/model/model_song.dart';
import 'package:mymusic/my/view/view_song.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/utils/number_format.dart';
import 'package:mymusic/widgets/play_widget.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class PlayListPage extends StatefulWidget {
  PlayListPage({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage>
    with TickerProviderStateMixin, SongView, AutomaticKeepAliveClientMixin {
  List<SongUrlData> songUrlList = new List();
  int _trackCount = 0;
  SongListEntity _songListEntity;
  String _title = "歌单";
  var globalKeyOne = GlobalKey();
  List<Menu> menus=new List();
  bool showMenu=false;
  GZXDropdownMenuController _dropdownMenuController;
  List<ShareItem> _topItems=new List();
  List<ShareItem> _bottomItems=new List();
  String copyLink;
  @override
  void initState() {
    _songListEntity = null;
    if (widget.id != null) {
      SongModel.getPlaylistDetail(widget.id, this);
    }
    _dropdownMenuController= GZXDropdownMenuController();
    menus.add(new Menu("wifi",R.assetsImgIcMenuWifi,"WiFi下自动下载新增歌曲"));
    menus.add(new Menu("add",R.assetsImgIcMenuAdd,"添加歌曲"));
    menus.add(new Menu("edit",R.assetsImgIcMenuEdit,"编辑歌单信息"));
    menus.add(new Menu("orderby",R.assetsImgIcMenuOrderby,"更改歌曲排序"));
    menus.add(new Menu("del",R.assetsImgIcMenuDel,"清空下载文件"));

    _topItems.add(new ShareItem(R.assetsImgIcShareMusic,"云音乐动态","shareMusic"));
    _topItems.add(new ShareItem(R.assetsImgIcShareSms,"私信","shareSms"));
    _topItems.add(new ShareItem(R.assetsImgIcShareLink,"复制链接","shareLink"));

    _bottomItems.add(new ShareItem(R.assetsImgIcShareFriend,"微信朋友圈","shareFriend"));
    _bottomItems.add(new ShareItem(R.assetsImgIcShareWx,"微信好友","shareWx"));
    _bottomItems.add(new ShareItem(R.assetsImgIcShareQqzone,"QQ空间","shareQqZone"));
    _bottomItems.add(new ShareItem(R.assetsImgIcShareQq,"QQ好友","shareQq"));
    _bottomItems.add(new ShareItem(R.assetsImgIcShareWb,"微博","shareWb"));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double getY(BuildContext buildContext) {
    final RenderBox box = buildContext.findRenderObject();
    //final size = box.size;
    final topLeftPosition = box.localToGlobal(Offset.zero);
    return topLeftPosition.dy;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
        body: Listener(
          onPointerDown: (event){
            _dropdownMenuController.hide(isShowHideAnimation: true);
          },
          onPointerMove: (event) {
            var distance = getY(globalKeyOne.currentContext);
            if (distance == 80) {
              _title = _songListEntity.playlist.name;
              setState(() {});
            } else {
              _title = "歌单";
              setState(() {});
            }
          },
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              title: Text('$_title'),
              automaticallyImplyLeading: true,
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Fluttertoast.showToast(msg: "暂未实现");
                  },
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Icon(Icons.search),
                  ),
                ),
                 InkWell(
                   onTap: (){
                     showMenu=true;
                     _dropdownMenuController.show(0);
                     //showMenu();
                   },
                   child: Container(
                     padding: EdgeInsets.only(left: 30.w, right: 20.w),
                     child: Icon(Icons.more_vert),
                   ),
                 )
              ],
              flexibleSpace: Listener(
                child: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.only(top: 140.h),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(205, 209, 208, 1),
                          Color.fromRGBO(197, 203, 201, 1)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: _buildPlayListTop(),
                    ),
                    centerTitle: false),
              ),
              expandedHeight: 480.h,
              elevation: 0,
              centerTitle: false,
              backgroundColor: Color.fromRGBO(205, 209, 208, 1),
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
                              color: Color.fromRGBO(205, 209, 208, 1),
                            ),
                            child: Container(
                              key: globalKeyOne,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.vertical(
                                      top: Radius.elliptical(16, 16))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 30.w, top: 22.h, bottom: 20.h),
                                    child: Image.asset(
                                        R.assetsImgIcPlayaudioBlack,
                                        width: 50.w),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20.w),
                                    child: Text(
                                      "播放全部",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "(共$_trackCount首)",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 26.sp),
                                    ),
                                  )
                                ],
                              ),
                            )))
                  ],
                  controller: TabController(length: 1, vsync: this),
                ))),
            SliverList(
                delegate: SliverChildBuilderDelegate((_, index) {
              return InkWell(
                onTap: () {
                  //播放音乐
                  _playMusic(index);
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 40.w,
                        margin: EdgeInsets.only(left: 30.w, top: 30.h),
                        child: Text("${index + 1}",
                            style: TextStyle(
                                color: Colors.black45, fontSize: 30.sp)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 30.w, top: 30.h),
                            child: Text(
                                "${_songListEntity == null ? "" : _songListEntity.playlist.tracks[index].name}",
                                style: TextStyle(
                                    color:
                                        Provider.of<MusicPlay>(context).song ==
                                                null
                                            ? Colors.black
                                            : Provider.of<MusicPlay>(context)
                                                        .song
                                                        .id ==
                                                    _songListEntity.playlist
                                                        .tracks[index].id
                                                ? AppColors.color_main
                                                : Colors.black)),
                          ),
                          Row(
                            children: <Widget>[
                              songUrlList.length == 0
                                  ? Text("")
                                  : Container(
                                      height: 25.h,
                                      padding: EdgeInsets.all(2),
                                      margin: EdgeInsets.only(
                                          left: songUrlList[index].level ==
                                                  "standard"
                                              ? 0
                                              : 30.w,
                                          top: 5.h),
                                      decoration: songUrlList[index].level ==
                                              "standard"
                                          ? null
                                          : BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.all(
                                                Radius.elliptical(3, 3),
                                              ),
                                              border: new Border.all(
                                                  color: AppColors.color_main,
                                                  width: 1.w)),
                                      child: songUrlList[index].level == null
                                          ? Text("VIP",
                                              style: TextStyle(
                                                  color: AppColors.color_main,
                                                  fontSize: 18.sp))
                                          : songUrlList[index].level == "exhigh"
                                              ? Text("SQ",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.color_main,
                                                      fontSize: 18.sp))
                                              : Text("")),
                              Container(
                                margin: EdgeInsets.only(
                                    left: songUrlList.length == 0 ||
                                            songUrlList[index].level ==
                                                "standard"
                                        ? 30.w
                                        : 5.w,
                                    top: 5.h),
                                child: Text(
                                    "${_songListEntity == null ? "" : _songListEntity.playlist.tracks[index].ar[0].name}-${_songListEntity == null ? "" : _songListEntity.playlist.tracks[index].al.name}",
                                    style: TextStyle(
                                        color: Provider.of<MusicPlay>(context)
                                                    .song ==
                                                null
                                            ? Colors.black45
                                            : Provider.of<MusicPlay>(context)
                                                        .song
                                                        .id ==
                                                    _songListEntity.playlist
                                                        .tracks[index].id
                                                ? AppColors.color_main
                                                : Colors.black45,
                                        fontSize: 26.sp)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
                    childCount: _songListEntity == null
                        ? 0
                        : _songListEntity.playlist.tracks.length))
          ]),
        ),

        bottomNavigationBar: PlayWidget());
  }

  @override
  void updatePlaylistDetail(SongListEntity songListEntity) {
    _songListEntity = songListEntity;
    setState(() {
      _trackCount = _songListEntity.playlist.trackCount;
    });
    Provider.of<MusicPlay>(context, listen: false).trackCount = _trackCount;
    Provider.of<MusicPlay>(context, listen: false).songListEntity =
        _songListEntity;
    String param = "";
    for (int i = 0; i < _songListEntity.playlist.trackIds.length; i++) {
      param += _songListEntity.playlist.trackIds[i].id.toString();
      if (i != songListEntity.playlist.trackIds.length - 1) {
        param += ",";
      }
    }
    SongModel.getSongUrls(param, this);
  }

  @override
  void updateSongUrl(SongUrlEntity songUrlEntity) {
    songUrlList.clear();
    for (SongListPlaylistTrackId trackId in _songListEntity.playlist.trackIds) {
      for (SongUrlData songUrlData in songUrlEntity.data) {
        if (trackId.id == songUrlData.id) {
          songUrlList.add(songUrlData);
        }
      }
    }
    Provider.of<MusicPlay>(context, listen: false).songUrlList = songUrlList;
    setState(() {});
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _buildPlayListTop() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 5.h, right: 5.w),
                  margin: EdgeInsets.only(left: 30.w, top: 40.h),
                  height: 200.w,
                  width: 200.w,
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.vertical(
                          top: Radius.elliptical(4, 4),
                          bottom: Radius.elliptical(4, 4)),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(_songListEntity == null
                              ? ""
                              : _songListEntity.playlist.coverImgUrl))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(
                        R.assetsImgIcPlaycount,
                        width: 20.w,
                        color: Colors.white,
                      ),
                      Text(
                          "${_songListEntity == null ? "" : DataUtils.formatNumber(_songListEntity.playlist.playCount, false, 1)}",
                          style: TextStyle(color: Colors.white, fontSize: 20.sp))
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 400.w,
                      margin: EdgeInsets.only(left: 30.w, bottom: 10.h),
                      child: Text(
                        "${_songListEntity == null ? "" : _songListEntity.playlist.name}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34.sp,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                   InkWell(
                     onTap: (){
                       Routers.navigateTo(context, Routers.personalInfoPage);
                     },
                     child:  Container(
                         margin: EdgeInsets.only(left: 30.w, bottom: 10.h),
                         child: Row(
                           children: <Widget>[
                             ClipOval(
                               child: CachedNetworkImage(
                                 imageUrl: _songListEntity == null
                                     ? ""
                                     : _songListEntity.playlist.creator.avatarUrl,
                                 width: 40.w,
                               ),
                             ),
                             Text(
                                 "   ${_songListEntity == null ? "" : _songListEntity.playlist.creator.nickname}",
                                 style: TextStyle(
                                     color: Colors.white, fontSize: 30.sp)),
                             Image.asset(
                               R.assetsImgIcArrowR,
                               color: Colors.white,
                               width: 20.h,
                               height: 20.h,
                             )
                           ],
                         )),
                   ),
                    Container(
                      margin: EdgeInsets.only(left: 30.w, top: 50.h),
                      child: Row(
                        children: <Widget>[
                          Text("编辑信息",
                              style:
                              TextStyle(color: Colors.white, fontSize: 24.sp)),
                          Image.asset(
                            R.assetsImgIcArrowR,
                            color: Colors.white,
                            width: 20.h,
                            height: 20.h,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      print("评论");
                      Routers.navigateTo(context, Routers.commentPage);
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(R.assetsImgIcComment, width: 50.w),
                        Text(
                          "评论",
                          style: TextStyle(color: Colors.white, fontSize: 26.sp),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _sharePlayList();
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(R.assetsImgIcShare, width: 50.w),
                        Text(
                          "分享",
                          style: TextStyle(color: Colors.white, fontSize: 26.sp),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDownloadDialog();
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(R.assetsImgIcDownload, width: 50.w),
                        Text(
                          "下载",
                          style: TextStyle(color: Colors.white, fontSize: 26.sp),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Routers.navigateTo(context, Routers.editPlayListPage);
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(R.assetsImgIcMultiselect, width: 50.w),
                        Text(
                          "多选",
                          style: TextStyle(color: Colors.white, fontSize: 26.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
         Visibility(
             visible: showMenu,
             child: GZXDropDownMenu(controller: _dropdownMenuController,animationMilliseconds: 300,menus: [
           GZXDropdownMenuBuilder(
             dropDownHeight: 60.h * menus.length,
             dropDownWidget:  Container(
               child: ListView.builder(itemBuilder: (context,index){
                 return InkWell(
                   onTap: (){
                     switch(menus[index].value){
                       case "wifi":

                         break;
                       case "add":

                         break;
                       case "edit":

                         break;
                       case "orderby":

                         break;
                       case "del":

                         break;
                     }
                   },
                   child: Container(
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         Container(
                           margin:EdgeInsets.only(right: 5.w),
                           child: Image.asset(menus[index].icon,width: 60.w,color: Colors.black45),
                         ),
                         Container(
                           child: Text("${menus[index].title}"),
                         )
                       ],
                     ),
                   ),
                 );
               },itemCount: 5,shrinkWrap: true,),
             ),
           )
         ])),
      ],
    );
  }

  //评论歌单
  var bottomSheetKey = new GlobalKey();
  //分享歌单
  void _sharePlayList() {
    final RenderBox box = context.findRenderObject();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return SizedBox(
            height: 500.h,
            child: StatefulBuilder(
              key: bottomSheetKey,
              builder: (context, state) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(8, 8)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 30.w, top: 30.h),
                            child: Text("分享")),
                        Expanded(
                          child:  ListView.builder(
                            itemCount: _topItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: (){
                                  print(_topItems[index].key);
                                  Navigator.pop(context);
                                  switch(_topItems[index].key){
                                    case "shareMusic":
                                      Routers.navigateTo(context, Routers.musicDynamicPage);
                                      break;
                                    case "shareSms":

                                      break;
                                    case "shareLink":
                                      copyLink="分享${Provider.of<MusicPlay>(context,listen: false).songListEntity.playlist.creator.nickname}创建的歌单[${Provider.of<MusicPlay>(context,listen: false).songListEntity.playlist.name}] ：http://music.163.com/playlist/${Provider.of<MusicPlay>(context,listen: false).songListEntity.playlist.id
                                      }/${Provider.of<MusicPlay>(context,listen: false).songListEntity.playlist.creator.userId}/?userid=${Global.userDetailEntity.profile.userId}  (来自@网易云音乐)";
                                      Fluttertoast.showToast(msg: "已复制到剪切板");
                                      break;
                                  }
                                },
                                child:  Container(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(left: 50.w,top: 30.h),
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius: new BorderRadius.all(
                                                    Radius.elliptical(50, 50))),
                                            child: Image.asset(_topItems[index].icon,
                                                width: 100.w,height: 100.w)
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 50.w),
                                          child: Text("${_topItems[index].name}",style: TextStyle(fontSize: 26.sp),),
                                        )
                                      ]),
                                ),
                              );
                            },
                          ),
                        ),
                        Divider(height: 1.h,color: Colors.black12),
                        Expanded(
                          child:  ListView.builder(
                            itemCount: _bottomItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return  InkWell(
                                onTap: (){
                                  print(_bottomItems[index].key);
                                  Navigator.pop(context);
                                  switch(_bottomItems[index].key){
                                    case "shareFriend":
                                      Share.share("text",
                                          subject: "subject",
                                          sharePositionOrigin:
                                          box.localToGlobal(Offset.zero) &
                                          box.size);
                                      break;
                                    case "shareWx":

                                      break;
                                    case "shareQqZone":

                                      break;
                                    case "shareQq":

                                      break;
                                    case "shareWb":

                                      break;
                                  }
                                },
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(left: 50.w,top: 30.h),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: new BorderRadius.all(
                                                  Radius.elliptical(50, 50))),
                                          child: Image.asset(_bottomItems[index].icon,
                                              width: 100.w)
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 50.w),
                                        child: Text("${_bottomItems[index].name}",style: TextStyle(fontSize: 26.sp),),
                                      )
                                    ]),
                              );
                            },
                          ),
                        ),
                      ],
                    ));
              },
            ),
          );
        });

  }

  void _playMusic(int index) {
    if (Provider.of<MusicPlay>(context, listen: false).song != null &&
        _songListEntity.playlist.trackIds[index].id ==
            Provider.of<MusicPlay>(context, listen: false).song.id) {
      return;
    }
    Provider.of<MusicPlay>(context, listen: false).currentIndex = index;
    Provider.of<MusicPlay>(context, listen: false).readyPlay();
    Provider.of<MusicPlay>(context, listen: false).playStart();
  }

  @override
  void updateSongLyric(LyricEntity lyricEntity) {
    // TODO: implement updateSongLyric
  }

  void showDownloadDialog() {
    showDialog(context: context,builder: (BuildContext context) {
      return Dialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30.w,top: 30.h),
              child: Text("选择默认下载音质",style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.only(left: 30.w,top: 5.h),
                child: Text("可在账号-设置页修改",style: TextStyle(color: Colors.black45,fontSize: 22.sp)),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.only(left: 30.w,top: 30.h),
                child: Text("标准",style: TextStyle(fontSize: 28.sp)),
              ),
            ),
           InkWell(
             onTap: (){},
             child:  Container(
             margin: EdgeInsets.only(left: 30.w,top: 30.h),
             child: Text("较高",style: TextStyle(fontSize: 28.sp)),
           ),),
           InkWell(
             onTap: (){},
             child:  Container(
               margin: EdgeInsets.only(left: 30.w,top: 30.h),
               child: Text("极高",style: TextStyle(fontSize: 28.sp)),
             ),
           ),
          InkWell(
            onTap: (){},
            child:   Container(
              margin: EdgeInsets.only(left: 30.w,top: 30.h,bottom: 30.h),
              child: Text("无损音质",style: TextStyle(fontSize: 28.sp)),
            ),
          ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
      );
    });
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
