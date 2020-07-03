import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/my/entity/play_song_entity.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:mymusic/widgets/bottom_playlist.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayWidget extends StatelessWidget {
  double lastDownX = 0;

  @override
  Widget build(BuildContext context) {
    lastDownX = 0;
    return Consumer(
        builder: (BuildContext context, MusicPlay musicPlay, Widget child) {
      PlaySongEntity _song = musicPlay.song;
      return Listener(
        onPointerDown: (event) {
          lastDownX = event.position.dx;
        },
        onPointerUp: (event) {
          double distance = event.position.dx - lastDownX;
          if (distance.abs() > 20) {
            if (distance > 0) {
              musicPlay.playNext(true);
            } else {
              musicPlay.playNext(false);
            }
          }
        },
        child: InkWell(
          onTap: (){
            Routers.navigateTo(context, Routers.songPlayPage);
          },
          child: Container(
            height: 110.h,
            decoration: BoxDecoration(
              border: new Border.all(color: Colors.black12, width: 0.5.w),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: ClipOval(
                    child: Image.network(
                        _song == null ? "" : _song.pic == null ? "" : _song.pic,
                        width: 70.w),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 400.w,
                      margin: EdgeInsets.only(left: 10.w, top: 10.h),
                      child: Text(
                        "${_song == null ? "暂无播放歌曲" : _song.name == null ? "暂无播放歌曲" : _song.name}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: 400.w,
                      margin: EdgeInsets.only(left: 10.w),
                      child: Text(
                        "横滑可以切换上下首哦",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black45),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (_song.isPlay) {
                      musicPlay.playPause();
                    } else {
                      musicPlay.playStart();
                    }
                  },
                  child: Container(
                    child: Image.asset(
                        _song == null
                            ? R.assetsImgIcPlayStart
                            : _song.isPlay
                            ? R.assetsImgIcPlayPause
                            : R.assetsImgIcPlayStart,
                        width: 70.w),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //歌单
                    BottomPlayList().showBottomMenu(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 60.w),
                    child: Image.asset(R.assetsImgIcPlayList,
                        height: 80.h, fit: BoxFit.fitHeight),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }



}
