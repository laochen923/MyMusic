import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/my/entity/lyric_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/entity/song_url_entity.dart';
import 'package:mymusic/my/model/model_song.dart';
import 'package:mymusic/my/view/view_song.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/splash/model/model_splash.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SongView{
  Timer _timer;
  int count = 3;

  startTime() async {
    var _duration = new Duration(seconds: 1);
    new Timer(_duration, () {
      _timer = new Timer.periodic(const Duration(milliseconds: 1000), (v) {
        count--;
        if (count == 0) {
          navigationPage();
        } else {
          setState(() {});
        }
      });
      return _timer;
    });
  }

  int uid;

  @override
  void initState() {
    startTime();
    SharedPreferenceUtil.getInt("uid").then((value) {
      uid = value;
      if (value > 0) {
        SplashModel.refreshLogin(context);
        SharedPreferenceUtil.getSongInfo().then((value) {
          value.isPlay = false;
          Provider.of<MusicPlay>(context, listen: false).song = value;
          SongModel.getSongLyric(value.id);
          if(value.listId!=null&&value.listId.isNotEmpty) {
            SongModel.getPlaylistDetail(value.listId, this);
          }
        });
        SharedPreferenceUtil.getPlayMode().then((value) {
          if (value == 0) {
            Provider.of<MusicPlay>(context, listen: false).playMode =
                Constants.PLAY_MODE_LIST;
          } else {
            Provider.of<MusicPlay>(context, listen: false).playMode = value;
          }
        });

        SharedPreferenceUtil.getStringList(Constants.SEARCH_HISTORY).then((value){
          if(value!=null){
            Provider.of<Search>(context,listen: false).searchHistory=value;
          }
        });

      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 720, height: 1280,allowFontScaling: false);
    return Container(
      constraints: BoxConstraints.expand(),
      child: new Image.asset(
        R.assetsImgSplashView,
        fit: BoxFit.fill,
      ),
    );
  }

  void navigationPage() {
    _timer.cancel();
    if (uid!=null&&uid > 0) {
      Routers.navigateTo(context, Routers.mainPage, replace: true);
    } else {
      Routers.navigateTo(context, Routers.welcome, replace: true);
    }
  }

  @override
  void updatePlaylistDetail(SongListEntity songListEntity) {
    Provider.of<MusicPlay>(context,listen: false).trackCount=songListEntity.playlist.trackCount;
    Provider.of<MusicPlay>(context,listen: false).songListEntity=songListEntity;
    String param = "";
    for (int i = 0; i < songListEntity.playlist.trackIds.length; i++) {
      param += songListEntity.playlist.trackIds[i].id.toString();
      if (i != songListEntity.playlist.trackIds.length - 1) {
        param += ",";
      }
    }
    SongModel.getSongUrls(param, this);
  }

  @override
  void updateSongUrl(SongUrlEntity songUrlEntity) {
    List<SongUrlData> songUrlList=new List();
    for (SongListPlaylistTrackId trackId in Provider.of<MusicPlay>(context,listen: false).songListEntity.playlist.trackIds) {
      for (SongUrlData songUrlData in songUrlEntity.data) {
        if (trackId.id == songUrlData.id) {
          songUrlList.add(songUrlData);
        }
      }
    }
    Provider.of<MusicPlay>(context,listen: false).songUrlList=songUrlList;
  }

  @override
  void updateSongLyric(LyricEntity lyricEntity) {
    // TODO: implement updateSongLyric
  }
}
