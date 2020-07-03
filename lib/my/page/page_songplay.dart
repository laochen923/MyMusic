import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/my/entity/lyric_entity.dart';
import 'package:mymusic/my/entity/play_song_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/entity/song_url_entity.dart';
import 'package:mymusic/my/view/view_song.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:mymusic/widgets/bottom_playlist.dart';
import 'package:mymusic/widgets/magnetic_widget.dart';
import 'package:provider/provider.dart';


class SongPlay extends StatefulWidget {
  @override
  _SongPlayState createState() => _SongPlayState();
}

class _SongPlayState extends State<SongPlay>
    with TickerProviderStateMixin, SongView {
  Animation<double> _rotateTwee;
  AnimationController controller;
  bool showFilm = true;
  bool showLyric = false;
  Animation animationRecord;
  AnimationController controllerRecord;
  RegExp regex = new RegExp(r"\[.*\]");
  ItemScrollController itemScrollController;

  ItemPositionsListener itemPositionsListener;
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);
    _rotateTwee = new Tween(begin: -0.08, end: 0.00).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controllerRecord = new AnimationController(
        duration: const Duration(milliseconds: 15000), vsync: this);
    animationRecord =
        new CurvedAnimation(parent: controllerRecord, curve: Curves.linear);
    animationRecord.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerRecord.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controllerRecord.forward();
      }
    });
    itemScrollController = new ItemScrollController();

    itemPositionsListener = ItemPositionsListener.create();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: Consumer(
        builder: (BuildContext context, MusicPlay musicPlay, Widget child) {
      PlaySongEntity _song = musicPlay.song;
      if (_song.isPlay) {
        controller.forward();
        controllerRecord.forward();
      } else {
        controller.stop();
        controller.reverse();
        controllerRecord.stop();
      }
      if(Global.lyricEntity != null && Global.lyricEntity.lrc != null){
        scrollTo(musicPlay.lyricIndex);
      }

      return Stack(children: <Widget>[
        InkWell(
            onTap: () {
              showFilm = !showFilm;
              showLyric = !showLyric;
              setState(() {});
            },
            child: buildSongPlayBg(musicPlay)),
        Container(
          height: 140.h,
          padding: EdgeInsets.only(top: 40.h),
          alignment: Alignment.bottomLeft,
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 25,
                  color: Colors.white),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 450.w,
                      height: 40.h,
                      child: Marquee(
                        text:
                            "${musicPlay.song.name}(${musicPlay.songListEntity.playlist.tracks[musicPlay.currentIndex].ar[0].name}-${musicPlay.songListEntity == null ? "" : musicPlay.songListEntity.playlist.tracks[musicPlay.currentIndex].al.name})",
                        style: TextStyle(color: Colors.white),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        blankSpace: 60.0,
                        velocity: 40.0,
                        startPadding: 10.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50.h,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "${musicPlay.songListEntity.playlist.tracks[musicPlay.currentIndex].ar[0].name}",
                            style: TextStyle(color: Colors.white30),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                            },
                            child: Container(
                                height: 50.h,
                                padding: EdgeInsets.only(
                                    bottom: 10.h, right: 30.w, left: 5.w),
                                alignment: Alignment.bottomLeft,
                                child: new Icon(Icons.arrow_forward_ios,
                                    size: 12, color: Colors.white30)))
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ]),
              InkWell(
                  onTap: () {
                    goLivePage();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: Image.asset(
                      R.assetsImgIcPlayLive,
                      width: 40.w,
                    ),
                  )),
              InkWell(
                  onTap: () {
                    shareSong();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40.w),
                    child: Image.asset(
                      R.assetsImgIcShare,
                      width: 40.w,
                    ),
                  ))
            ],
          ),
        ),
        Visibility(
          visible: showFilm,
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 300.h),
            child: new RotationTransition(
                alignment: Alignment.center,
                turns: animationRecord,
                child: InkWell(
                  onTap: () {
                    showFilm = !showFilm;
                    showLyric = !showLyric;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 500.w,
                    height: 500.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(R.assetsImgIcVinylRecordsBg))),
                    child: ClipOval(
                        child: CachedNetworkImage(
                      imageUrl: musicPlay.song.pic,
                      width: 340.w,
                      height: 340.w,
                    )),
                  ),
                )),
          ),
        ),
        Visibility(
            visible: showFilm,
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 120.h, left: 80.w),
              child: MagneticWidget(
                  turns: _rotateTwee,
                  alignment: FractionalOffset.topLeft,
                  child: new Container(
                    child: new Image.asset(R.assetsImgIcMagnetic, scale: 0.6),
                  )),
            )),

        Align(
          child: Container(
            height: 300.h,
            margin: EdgeInsets.only(bottom: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Visibility(
                    visible: showFilm,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  width: 80.w,
                                  height: 80.w,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    R.assetsImgIcSpUnLike,
                                    color: Colors.white,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 80.w,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    R.assetsImgIcSpDownload,
                                    color: Colors.white,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 80.w,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    R.assetsImgIcSpRing,
                                    color: Colors.white,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 80.w,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    R.assetsImgIcSpNoComment,
                                    color: Colors.white,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 80.w,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    R.assetsImgIcSpMore,
                                    color: Colors.white,
                                    fit: BoxFit.fill,
                                  ),
                                ))
                          ],
                        ))),
                Container(
                    height: 50.h,
                    margin: EdgeInsets.only(bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text("${musicPlay.positionText}",
                              style: TextStyle(color: Colors.white, fontSize: 24.sp)),
                        ),
                        Container(
                          width: 540.w,
                          margin: EdgeInsets.only(left: 20.w),
                          child: SliderTheme(
                            //自定义风格
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                //进度条滑块左边颜色
                                inactiveTrackColor: Colors.white30,
                                //进度条滑块右边颜色
                                thumbColor: Colors.white,
                                //滑块颜色
                                overlayShape: RoundSliderOverlayShape(
                                  //可继承SliderComponentShape自定义形状
                                  overlayRadius: 0, //滑块外圈大小
                                ),
                                thumbShape: RoundSliderThumbShape(
                                  //可继承SliderComponentShape自定义形状
                                  disabledThumbRadius: 5, //禁用是滑块大小
                                  enabledThumbRadius: 5, //滑块大小
                                ),
                                inactiveTickMarkColor: Colors.black,
                                tickMarkShape: RoundSliderTickMarkShape(
                                  //继承SliderTickMarkShape可自定义刻度形状
                                  tickMarkRadius: 4.0, //刻度大小
                                ),
                                showValueIndicator: ShowValueIndicator.onlyForDiscrete,
                                //气泡显示的形式
                                trackHeight: 1 //进度条宽度
                            ),
                            child: Slider(
                              value: musicPlay.seek,
                              onChanged: (v) {
                                setState(() {
                                  musicPlay.seek = v;
                                  Duration position = new Duration(
                                      milliseconds: (musicPlay.seek /
                                          100 *
                                          musicPlay.duration.inMilliseconds)
                                          .toInt());
                                  musicPlay.audioPlayer.seek(position);
                                });
                              },
                              max: 100,
                              min: 0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20.w),
                          child: Text("${musicPlay.durationText}",
                              style: TextStyle(color: Colors.white30, fontSize: 24.sp)),
                        )
                      ],
                    )),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              switch (musicPlay.playMode) {
                                case Constants.PLAY_MODE_SINGLE:
                                  musicPlay.playMode = Constants.PLAY_MODE_RANDOM;
                                  break;
                                case Constants.PLAY_MODE_RANDOM:
                                  musicPlay.playMode = Constants.PLAY_MODE_LIST;
                                  break;
                                case Constants.PLAY_MODE_LIST:
                                  musicPlay.playMode = Constants.PLAY_MODE_SINGLE;
                                  break;
                              }
                              SharedPreferenceUtil.savePlayMode(musicPlay.playMode);
                              setState(() {});
                            },
                            child: Container(
                              width: 70.w,
                              height: 70.w,
                              alignment: Alignment.center,
                              child: Image.asset(
                                Constants.PLAY_MODE_SP_PIC[musicPlay.playMode - 1],
                                color: Colors.white,
                                fit: BoxFit.fill,
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              musicPlay.playNext(false);
                            },
                            child: Container(
                              width: 50.w,
                              height: 50.w,
                              alignment: Alignment.center,
                              child: Image.asset(
                                R.assetsImgIcSpPrevious,
                                color: Colors.white,
                                fit: BoxFit.fill,
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              if (_song.isPlay) {
                                musicPlay.playPause();
                              } else {
                                musicPlay.playStart();
                              }
                            },
                            child: Container(
                              width: 100.w,
                              height: 100.w,
                              alignment: Alignment.center,
                              child: Image.asset(
                                _song == null
                                    ? R.assetsImgIcSpPlay
                                    : _song.isPlay
                                    ? R.assetsImgIcSpPause
                                    : R.assetsImgIcSpPlay,
                                color: Colors.white,
                                fit: BoxFit.fill,
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              musicPlay.playNext(true);
                            },
                            child: Container(
                              width: 50.w,
                              height: 50.w,
                              alignment: Alignment.center,
                              child: Image.asset(
                                R.assetsImgIcSpPlayNext,
                                color: Colors.white,
                                fit: BoxFit.fill,
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              BottomPlayList().showBottomMenu(context);
                            },
                            child: Container(
                              width: 70.w,
                              height: 70.w,
                              alignment: Alignment.center,
                              child: Image.asset(
                                R.assetsImgIcSpPlaylist,
                                color: Colors.white,
                                fit: BoxFit.fill,
                              ),
                            ))
                      ],
                    )),
              ],
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),

        Global.lyricEntity == null || Global.lyricEntity.lrc == null
            ? Visibility(
                visible: showLyric,
                child: Center(
                  child: Container(
                      child: Text(
                    "暂无歌词",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
                ))
            : Visibility(
                visible: showLyric,
                child: Container(
                    height: 900.h,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 160.h),
                      child: ScrollablePositionedList.builder(
                        scrollDirection: Axis.vertical,
                        itemScrollController: itemScrollController,
                        itemPositionsListener: itemPositionsListener,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                print("object");
                                showFilm = !showFilm;
                                showLyric = !showLyric;
                                setState(() {});
                              },
                            child: Container(
                              child: Text(
                                "${Global.lyricEntity == null ? "" : Global.lyricEntity.lrc.lyric.split(regex)[index].replaceAll(regex, "")}",
                                style: TextStyle(
                                    color: Global.lyricEntity == null
                                        ? Colors.white30
                                        : getTimeStr(
                                        Global.lyricEntity.lrc.lyric
                                            .split(
                                            new RegExp(r"\["))[index]
                                            .replaceAll(
                                            new RegExp(r"\].*"), ""),
                                        index <
                                            Global.lyricEntity.lrc
                                                .lyric
                                                .split(regex)
                                                .length -
                                                1
                                            ? Global
                                            .lyricEntity.lrc.lyric
                                            .split(new RegExp(r"\["))[
                                        index + 1]
                                            .replaceAll(
                                            new RegExp(r"\].*"),
                                            "")
                                            : null,
                                        musicPlay.positionText,
                                        index)
                                        ? Colors.white
                                        : Colors.white30),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                        itemCount: Global.lyricEntity == null ||
                                Global.lyricEntity.lrc.lyric == null
                            ? 0
                            : Global.lyricEntity.lrc.lyric
                                .split(regex)
                                .length,
                      ),
                    ),
              ),
        /*Global.lyricEntity == null || Global.lyricEntity.lrc == null
            ?Text(""):
        Visibility(
          visible: showLyric,
          child: Center(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 60.w),
                    width: 550.w,
                    child:  Divider(height: 0.5.h, color: Colors.white30)
                ),
                Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Text("${musicPlay.positionText}",
                        style: TextStyle(color: Colors.white, fontSize: 24.sp)))
              ],
            ),
          ),
        ),*/
      ]);
    }));
  }

  Widget buildSongPlayBg(MusicPlay musicPlay) {
    return Container(
            height: ScreenUtil.screenHeight,
            width: ScreenUtil.screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(musicPlay.song.pic),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                      Colors.black54,
                      BlendMode.overlay,
                    ))),
            child: new BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: Opacity(
                opacity: 0.6,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),
          );
  }

  bool getTimeStr(
      String startTime, String endTime, String currentTime, int index) {
    if (startTime == null || startTime.isEmpty) {
      startTime = "00:00.000";
    }
    if (currentTime == null || currentTime.isEmpty) {
      currentTime = "00:00";
    }
    if (!startTime.contains(new RegExp(r".*[0-9].*")) ||
        (endTime != null && !endTime.contains(new RegExp(r".*[0-9].*")))||startTime.contains(new RegExp(r"by:"))||(endTime!=null&&endTime.contains(new RegExp(r"by:")))){
      return false;
    }
    List<String> result =
        startTime.split(new RegExp(r"\."))[0].split(new RegExp(r"\:"));
    var d2;
    if (endTime != null) {
      List<String> result2 =
          endTime.split(new RegExp(r"\."))[0].split(new RegExp(r"\:"));
      d2 = new DateTime(
          0, 0, 0, 0, int.parse(result2[0]), int.parse(result2[1]));
    }
    List<String> result3 = currentTime.split(new RegExp(r"\:"));
    var d1 =
        new DateTime(0, 0, 0, 0, int.parse(result[0]), int.parse(result[1]));

    var d3 =
        new DateTime(0, 0, 0, 0, int.parse(result3[0]), int.parse(result3[1]));

    bool value = endTime != null
        ? (d3.isAfter(d1) && d3.isBefore(d2))
        : d3.isAtSameMomentAs(d1) || d3.isAfter(d1);
    if (value) {
      Provider.of<MusicPlay>(context).lyricIndex = index;
    }
    return value;
  }

  //跳转到直播页面
  void goLivePage() {}

  //分享歌曲
  void shareSong() {

  }

  @override
  void dispose() {
    controllerRecord.dispose();
    controller.dispose();
    super.dispose();
  }

  void scrollTo(int index) async {
    if(itemScrollController.isAttached){
      await itemScrollController.scrollTo(
          index: index,
          duration: new Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
          alignment: 0.5);
    }
  }

  void jumpTo(int index) {
    if (index != 0 &&
        index != Global.lyricEntity.lrc.lyric.split(regex).length - 1) {
      itemScrollController.jumpTo(index: index, alignment: 0.5);
    }
  }

  @override
  void updatePlaylistDetail(SongListEntity songListEntity) {}

  @override
  void updateSongUrl(SongUrlEntity songUrlEntity) {}

  @override
  void updateSongLyric(LyricEntity lyricEntity) {}
}
