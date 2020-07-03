import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/provider/user_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/user/entity/user_play_list_entity.dart';
import 'package:mymusic/user/model/model_user.dart';
import 'package:mymusic/user/view/view_user.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with UserView, AutomaticKeepAliveClientMixin{
  int _selectIndex = 0;
  int uid;
  int _lovePlayListId;
  List<UserPlayListPlaylist> playlist = new List();
  List<UserPlayListPlaylist> tempPlaylist = new List();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    UserModel.getUserInfo(context);
    SharedPreferenceUtil.getInt("uid").then((value) {
      if (value > 0) {
        uid = value;
        UserModel.getUserPlayList(value, this);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(R.assetsImgIcMyTopBg), fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Routers.navigateTo(context, Routers.personalInfoPage);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 50.w, top: 30.h),
                    child: ClipOval(
                      child: Image.network(
                        Global.userEntity!=null?Global.userEntity.profile.avatarUrl:"",
                        width: 120.w,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 30.w, top: 10.h),
                      child: Text(Global.userEntity!=null?Global.userEntity.profile.nickname:"",
                          style:
                              TextStyle(fontSize: 30.sp, color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(87, 86, 91, 1),
                          borderRadius:
                              new BorderRadius.all(Radius.elliptical(50, 50))),
                      height: 40.h,
                      width: 80.w,
                      child: FlatButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(0),
                        child: Text(
                            "Lv.${Provider.of<UserProvider>(context).level==null?"":Provider.of<UserProvider>(context).level}",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20.sp)),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Routers.navigateTo(context, Routers.localMusicPage);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40.h),
                          child: Image.asset(
                            R.assetsImgIcLocalMusic,
                            color: Colors.white,
                            height: 50.h,
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        child: Text(
                          "本地音乐",
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(color: Colors.white, fontSize: 24.sp),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Routers.navigateTo(context, Routers.downloadManagerPage);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40.h),
                          child: Image.asset(
                            R.assetsImgIcDownloadManager,
                            color: Colors.white,
                            height: 50.h,
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        child: Text(
                          "下载管理",
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(color: Colors.white, fontSize: 24.sp),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Routers.navigateTo(context, Routers.myRadioPage);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40.h),
                          child: Image.asset(
                            R.assetsImgIcMyRadio,
                            color: Colors.white,
                            height: 50.h,
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        child: Text(
                          "我的电台",
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(color: Colors.white, fontSize: 24.sp),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Routers.navigateTo(context, Routers.mySubPage);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40.h),
                          // 边框，
                          child: Image.asset(
                            R.assetsImgIcMySub,
                            color: Colors.white,
                            height: 50.h,
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        child: Text(
                          "我的收藏",
                          textAlign: TextAlign.right,
                          style:
                          TextStyle(color: Colors.white, fontSize: 24.sp),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Routers.navigateTo(context, Routers.followNewSongsPage);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40.h),
                          // 边框，
                          child: Image.asset(
                            R.assetsImgIcNewSong,
                            color: Colors.white,
                            height: 50.h,
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        child: Text(
                          "关注新歌",
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(color: Colors.white, fontSize: 24.sp),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Container(
          margin: EdgeInsets.only(top: 350.h),
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.vertical(
                  top: Radius.elliptical(8, 8)), // 也可控件一边圆角大小
              color: Colors.white),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 30.w, top: 40.h),
                      child: Text('我的音乐',
                          style: TextStyle(
                              fontSize: 35.sp, fontWeight: FontWeight.bold))),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.only(right: 30.w, top: 40.h),
                        child: new Image.asset(
                          R.assetsImgIcArrowR,
                          height: 26.h,
                        )),
                  )
                ],
              ),
              Container(
                height: 320.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 30.h),
                      width: 210.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.vertical(
                              top: Radius.elliptical(8, 8),
                              bottom: Radius.elliptical(8, 8)),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(155, 155, 155, 1),
                              Color.fromRGBO(88, 88, 88, 1)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Image.asset(
                            R.assetsImgIcLoveMusic,
                            width: 100.w,
                          ),
                          Text('我最喜欢的音乐',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 26.sp))
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Routers.navigateTo(context, Routers.personalFmPage);
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 10.w, top: 30.h),
                          width: 210.w,
                          height: 300.h,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.vertical(
                                top: Radius.elliptical(8, 8),
                                bottom: Radius.elliptical(8, 8)),
                            image: DecorationImage(
                                image: NetworkImage("${Provider.of<UserProvider>(context).backgroundUrl}"),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(left: 10.w, top: 70.h),
                                  child: new Image.asset(
                                    R.assetsImgIcPersonalFm,
                                    width: 100.w,
                                  )),
                              Text('私人FM',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 26.sp)),
                              Container(
                                margin: EdgeInsets.only(top: 20.h),
                                child: Text('最懂你的推荐',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 26.sp)),
                              )
                            ],
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.w, top: 30.h),
                        width: 210.w,
                        height: 300.h,
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.vertical(
                                top: Radius.elliptical(8, 8),
                                bottom: Radius.elliptical(8, 8)),
                            color: Color.fromRGBO(229, 228, 233, 1)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30.h),
                              child: Text('推荐',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 26.sp)),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10.w, top: 30.h),
                                child: new Image.asset(
                                  R.assetsImgIcHotsongPlay,
                                  width: 60.w,
                                )),
                            Text('热歌放映厅',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 26.sp)),
                            Container(
                              margin: EdgeInsets.only(top: 40.h),
                              child: Text('好音乐看得见',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 26.sp)),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 10.w, top: 30.h),
                        width: 210.w,
                        height: 300.h,
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.vertical(
                                top: Radius.elliptical(8, 8),
                                bottom: Radius.elliptical(8, 8)),
                            color: Color.fromRGBO(229, 228, 233, 1)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30.h),
                              child: Text('推荐',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 26.sp)),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10.w, top: 50.h),
                                child: new Image.asset(
                                  R.assetsImgIcSongSc,
                                  width: 60.w,
                                )),
                            Text('私藏推荐',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 26.sp)),
                            Container(
                              margin: EdgeInsets.only(top: 40.h),
                              child: Text('私藏冷门音乐',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 26.sp)),
                            )
                          ],
                        )),
                    Container(
                        margin:
                            EdgeInsets.only(left: 10.w, right: 20.w, top: 30.h),
                        width: 210.w,
                        height: 300.h,
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.vertical(
                                top: Radius.elliptical(8, 8),
                                bottom: Radius.elliptical(8, 8)),
                            color: Color.fromRGBO(229, 228, 233, 1)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30.h),
                              child: Text('推荐',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 26.sp)),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10.w, top: 30.h),
                                child: new Image.asset(
                                  R.assetsImgIcSongFriend,
                                  width: 60.w,
                                )),
                            Text('因乐交友',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 26.sp)),
                            Container(
                              margin: EdgeInsets.only(top: 40.h),
                              child: Text('找到音乐好友',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 26.sp)),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        _selectIndex = 0;
                        playlist.clear();
                        playlist.addAll(tempPlaylist.where((bean) {
                          return bean.userId == uid;
                        }));
                        playlist.add(null);
                        setState(() {});
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 30.w, top: 40.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('创建歌单',
                                  style: TextStyle(
                                      fontSize: 35.sp,
                                      color: _selectIndex == 0
                                          ? Colors.black
                                          : Color.fromRGBO(153, 153, 153, 1),
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '  ${Provider.of<UserProvider>(context).loveSongSheetCount!=null?Provider.of<UserProvider>(context).loveSongSheetCount-1:0}',
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      color: _selectIndex == 0
                                          ? Colors.black
                                          : Color.fromRGBO(153, 153, 153, 1),
                                      fontWeight: FontWeight.bold))
                            ],
                          ))),
                  InkWell(
                      onTap: () {
                        _selectIndex = 1;
                        playlist.clear();
                        playlist.addAll(tempPlaylist.where((bean) {
                          return bean.userId != uid;
                        }));
                        setState(() {});
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 30.w, top: 40.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('收藏歌单',
                                  style: TextStyle(
                                      fontSize: 35.sp,
                                      color: _selectIndex == 1
                                          ? Colors.black
                                          : Color.fromRGBO(153, 153, 153, 1),
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '  ${Provider.of<UserProvider>(context).collectSongSheetCount!=null?Provider.of<UserProvider>(context).collectSongSheetCount:0}',
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      color: _selectIndex == 1
                                          ? Colors.black
                                          : Color.fromRGBO(153, 153, 153, 1),
                                      fontWeight: FontWeight.bold))
                            ],
                          ))),
                  InkWell(
                    onTap: () {
                      //点击更多
                      showBottomMenu();
                    },
                    child: Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(left: 240.w),
                        padding: EdgeInsets.only( top: 40.h),
                        child: Icon(
                          Icons.more_vert,
                          size: 20,
                        )),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                      crossAxisCount: 2,
                      // 左右间隔
                      crossAxisSpacing: 10.0,
                      // 上下间隔
                      mainAxisSpacing: 10.0,
                      //宽高比
                      childAspectRatio: 2.4,
                      //子组件宽高长度比例
                    ),
                    itemCount: playlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildPlayListItem(playlist[index]);
                    }),
              )
            ],
          )),
    ]));
  }

  //构建歌单子选项
  Widget _buildPlayListItem(UserPlayListPlaylist playlist) {
    if (playlist == null) {
      return new GestureDetector(
          onTap: () {
            //处理点击事件
          },
          child: Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(8, 8),
                            bottom: Radius.elliptical(8, 8)),
                        color: Color.fromRGBO(243, 243, 243, 1)),
                    margin: EdgeInsets.only(right: 10.w),
                    height: 100.h,
                    width: 100.h,
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                  Container(
                    width: 140.w,
                    child: Text("创建歌单",
                        maxLines: 2,
                        style: TextStyle(fontSize: 26.sp),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              )));
    } else {
      return new GestureDetector(
          onTap: () {
            //处理点击事件
            Routers.navigateTo(context, Routers.playListPage,params: {"id":"${playlist.id}"});
          },
          child: Container(
              margin: EdgeInsets.only(left: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    margin: EdgeInsets.only(right: 10.w),
                    height: 100.h,
                    width: 100.h,
                    child: ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(playlist.coverImgUrl)),
                  ),
                  Column(children: <Widget>[
                    Container(
                      width: 140.w,
                      child: Text(playlist.name,
                          maxLines: 2,
                          style: TextStyle(fontSize: 26.sp),
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      width: 140.w,
                      child: Text("${playlist.trackCount}首",
                          style: TextStyle(
                              fontSize: 20.sp, color: Colors.black45)),
                    )
                  ])
                ],
              )));
    }
  }

  @override
  void getUserPlayListSuccess(UserPlayListEntity entity) {
    _lovePlayListId = entity.playlist[0].id;
    Provider.of<UserProvider>(context,listen: false).playlist=entity.playlist;
    entity.playlist.removeAt(0);
    tempPlaylist.addAll(entity.playlist);
    if (_selectIndex == 0) {
      //创建歌单
      playlist.addAll(tempPlaylist.where((bean) {
        return bean.userId == uid;
      }));
      playlist.add(null);
      setState(() {});
    }
  }

 //底部菜单
  void showBottomMenu() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.vertical(
                    top: Radius.elliptical(8, 8)),
                color: Colors.white),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 30.w,top: 20.h,bottom: 20.h),
                    child: Text(
                      "请选择",
                      style: TextStyle(color: Colors.black45),
                    )),
                Divider(
                    height: 1.h,
                    color: Colors.black12),
                new ListTile(
                  leading: new Icon(Icons.add,color: Color.fromRGBO(44, 44, 44, 1),),
                  title: new Text("创建新歌单"),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 80.w),child:
                Divider(
                    height: 1.h,
                    color: Colors.black45)),
                new ListTile(
                  leading: new ImageIcon ( AssetImage(R.assetsImgIcSheetManager),color: Color.fromRGBO(44, 44, 44, 1),),
                  title: new Text("歌单管理"),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 80.w),child:
                Divider(
                    height: 1.h,
                    color: Colors.black45)),
                new ListTile(
                  leading: new ImageIcon ( AssetImage(R.assetsImgIcSheetImport),color: Color.fromRGBO(44, 44, 44, 1),size: 18),
                  title: new Text("导入外部歌单"),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 80.w),child:
                Divider(
                    height: 1.h,
                    color: Colors.black45)),
                new ListTile(
                  leading: new ImageIcon ( AssetImage(R.assetsImgIcSheetRecovery),color: Color.fromRGBO(44, 44, 44, 1),),
                  title: new Text("恢复歌单"),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 80.w),child:
                Divider(
                    height: 1.h,
                    color: Colors.black45)),
                new ListTile(
                  leading: new ImageIcon ( AssetImage(R.assetsImgIcSheetDl),color: Color.fromRGBO(44, 44, 44, 1),),
                  title: new Text("切换至单列模式"),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                ),
              ],

            ),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void getUserDetailSuccess() {
    // TODO: implement getUserDetailSuccess
  }
}
