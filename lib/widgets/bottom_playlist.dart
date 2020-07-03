import 'package:flutter/material.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomPlayList{
  factory BottomPlayList() =>_getInstance();
  static BottomPlayList get instance => _getInstance();
  static BottomPlayList _instance;
  BottomPlayList._internal() {
    // 初始化
  }
  static BottomPlayList _getInstance() {
    if (_instance == null) {
      _instance = new BottomPlayList._internal();
    }
    return _instance;
  }

  var bottomSheetKey = new GlobalKey();
  ScrollController _scrollController = new ScrollController();
  void showBottomMenu(BuildContext context) {
    MusicPlay musicPlay = Provider.of<MusicPlay>(context, listen: false);

    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return StatefulBuilder(
            key: bottomSheetKey,
            builder: (context, state) {
              return Container(
                  margin: EdgeInsets.all(30.w),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.vertical(
                          top: Radius.elliptical(8, 8),
                          bottom: Radius.elliptical(8, 8)),
                      color: Colors.white),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 34.w, top: 40.h),
                            child: Text("当前播放",
                                style: TextStyle(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            margin: EdgeInsets.only(top: 40.h),
                            child: Text("(${musicPlay.trackCount})",
                                style: TextStyle(
                                    fontSize: 30.sp, color: Colors.black45)))
                      ]),
                      Row(children: <Widget>[
                        InkWell(
                          onTap: () {
                            state(() {
                              switch (musicPlay.playMode) {
                                case Constants.PLAY_MODE_SINGLE:
                                  musicPlay.playMode =
                                      Constants.PLAY_MODE_RANDOM;
                                  break;
                                case Constants.PLAY_MODE_RANDOM:
                                  musicPlay.playMode = Constants.PLAY_MODE_LIST;
                                  break;
                                case Constants.PLAY_MODE_LIST:
                                  musicPlay.playMode =
                                      Constants.PLAY_MODE_SINGLE;
                                  break;
                              }
                            });
                            SharedPreferenceUtil.savePlayMode(
                                musicPlay.playMode);
                          },
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 30.w, top: 10.h),
                                child: Image.asset(
                                  Constants
                                      .PLAY_MODE_PIC[musicPlay.playMode - 1],
                                  width: 30.w,
                                  color: Colors.black45,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.w, top: 10.h),
                                child: Text(Constants
                                    .PLAY_MODE_NAME[musicPlay.playMode - 1]),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //收藏全部
                            _collectAll();
                          },
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 200.w, top: 10.h),
                                child: Image.asset(
                                  R.assetsImgIcCollectAll,
                                  width: 30.w,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.w, top: 10.h),
                                child: Text("收藏全部"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 10.h),
                          height: 30.h,
                          child: VerticalDivider(
                              width: 2.w, color: Colors.black45),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w, top: 10.h),
                          child: Image.asset(
                            R.assetsImgIcPlayDelete,
                            width: 70.w,
                            color: Colors.black45,
                          ),
                        )
                      ]),
                      Container(
                        child: Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              controller: _scrollController,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () async {
                                      if (musicPlay.currentIndex == index) {
                                        //防止重复播放
                                        return;
                                      }
                                      musicPlay.currentIndex = index;
                                      musicPlay.readyPlay();
                                      musicPlay.playStart();
                                      state(() {});
                                    },
                                    child:Container(
                                      height: 120.h,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              height: 25.h,
                                              padding: EdgeInsets.all(2),
                                              margin: EdgeInsets.only(left: 30.w),
                                              decoration: musicPlay
                                                  .songUrlList[index]
                                                  .level ==
                                                  "standard"
                                                  ? null
                                                  : BoxDecoration(
                                                  borderRadius:
                                                  new BorderRadius.all(
                                                    Radius.elliptical(3, 3),
                                                  ),
                                                  border: new Border.all(
                                                      color:
                                                      AppColors.color_main,
                                                      width: 1.w)),
                                              child: musicPlay.songUrlList[index]
                                                  .level ==
                                                  null
                                                  ? Text("VIP",
                                                  style: TextStyle(
                                                      color:
                                                      AppColors.color_main,
                                                      fontSize: 18.sp))
                                                  : musicPlay.songUrlList[index]
                                                  .level ==
                                                  "exhigh"
                                                  ? Text("SQ",
                                                  style: TextStyle(
                                                      color:
                                                      AppColors.color_main,
                                                      fontSize: 18.sp))
                                                  : Text("")),
                                          Container(
                                              margin: EdgeInsets.only(left: 5.w),
                                              child: index == musicPlay.currentIndex
                                                  ? Image.asset(
                                                R.assetsImgIcPlayFlag,
                                                width: 30.w,
                                              )
                                                  : Text("")),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: index == musicPlay.currentIndex
                                                    ? 10.w
                                                    : 0),
                                            constraints: BoxConstraints(
                                              maxWidth: 300.w,
                                            ),
                                            child: Text(
                                              "${musicPlay.songListEntity.playlist.tracks[index].name}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: index == musicPlay.currentIndex
                                                      ? AppColors.color_main
                                                      : Colors.black),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                " - ${musicPlay.songListEntity.playlist.tracks[index].ar[0].name}",
                                                style: TextStyle(
                                                    fontSize: 24.sp,
                                                    color:
                                                    index == musicPlay.currentIndex
                                                        ? AppColors.color_main
                                                        : Colors.black45),
                                                textAlign: TextAlign.start),
                                          )
                                        ],
                                      ),
                                    )

                                );
                              },
                              itemCount:
                              musicPlay.songListEntity==null?0:musicPlay.songListEntity.playlist.tracks.length,
                            )),
                      )
                    ],
                  ));
            },
          );
        });
    Future.delayed(Duration(milliseconds: 100), () {
      //跳转到正在播放的位置
      _scrollController.animateTo(musicPlay.currentIndex * 120.h,
          duration: new Duration(seconds: 1), curve: Curves.ease);
    });
  }

  //收藏全部
  void _collectAll() {}

}