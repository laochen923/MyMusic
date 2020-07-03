import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/my/entity/lyric_entity.dart';
import 'package:mymusic/my/entity/play_song_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/entity/song_url_entity.dart';
import 'package:mymusic/my/model/model_song.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
class MusicPlay with ChangeNotifier {
  PlaySongEntity song;
  AudioPlayer audioPlayer = new AudioPlayer();
  AudioCache audioCache = AudioCache();
  Duration duration;
  Duration position;
  List<SongUrlData> songUrlList = new List();
  int trackCount = 0;
  SongListEntity songListEntity;
  LyricEntity lyricEntity;
  double seek=0;
  int currentIndex=0; //当前播放位置
  int lyricIndex=0;
  int playMode=Constants.PLAY_MODE_LIST; //播放模式
  bool isLocal=false;
  get durationText => duration==null?"":duration.inHours==0?duration?.toString()?.split('.')?.first.replaceFirst("0:", "") ?? '':duration?.toString()?.split('.')?.first ?? '';
  get positionText => position==null?"":position.inHours==0?position?.toString()?.split('.')?.first.replaceFirst("0:", "") ?? '':position?.toString()?.split('.')?.first ?? '';

  MusicPlay(){
    audioPlayer.onPlayerCompletion.listen((event) {
      print("播放完毕");
      seek=0;
      lyricIndex=0;
      position=new Duration(milliseconds: 0);
      notifyListeners();
      playNext(true);
    });
    try{
      if (Platform.isIOS) {
        if (audioCache.fixedPlayer != null) {
          audioCache.fixedPlayer.startHeadlessService();
        }
        audioPlayer.setNotification(
            title: 'My Music',
            artist: song.name,
            albumTitle: '${songListEntity.playlist.tracks[currentIndex].ar[0].name}-${songListEntity.playlist.tracks[currentIndex].al.name}',
            imageUrl: song.pic,
            forwardSkipInterval: const Duration(seconds: 30), // default is 30s
            backwardSkipInterval: const Duration(seconds: 30), // default is 30s
            duration: duration,
            elapsedTime: Duration(seconds: 0));
        audioPlayer.startHeadlessService();
      }
    } catch(e){

    }

    audioPlayer.onAudioPositionChanged.listen((position){
      this.position=position;
      seek=(position.inMilliseconds/duration.inMilliseconds)*100;
      if(seek>100){
        seek=100;
      }
      notifyListeners();
    });
    audioPlayer.onPlayerStateChanged.listen((event) {
      if(AudioPlayerState.PAUSED.index==event.index){
        print("onPlayerStateChanged:PAUSED");
      }
      if(AudioPlayerState.STOPPED.index==event.index){
        print("onPlayerStateChanged:STOPPED");
      }
      if(AudioPlayerState.PLAYING.index==event.index){
        print("onPlayerStateChanged:PLAYING");
      }
    });
    audioPlayer.onDurationChanged.listen((duration){
      this.duration=duration;
      notifyListeners();
    });
  }

  void like(){}


  //开始
  void playStart() async{
    seek=0;
    lyricIndex=0;
    showNotification();
    position=new Duration(milliseconds: 0);
    if(songUrlList[currentIndex].url==null||songUrlList[currentIndex].level==null){
      Fluttertoast.showToast(msg: "根本版权方要求，该歌曲需要开通VIP");
      song.isPlay=false;
      notifyListeners();
      return;
    }
    if(AudioPlayerState.PLAYING==audioPlayer.state){
      int result=await audioPlayer.stop();
      if(result==1){
        int result;
        if(song.url.contains("http")){
          result=await audioPlayer.play(song.url,isLocal: isLocal);
        }else{
          result=await audioPlayer.play(song.url,isLocal: true);
        }

        if(result==1){
          song.isPlay = true;
          print("歌曲${song.name},播放成功");
          SongModel.getSongLyric(song.id);
          SharedPreferenceUtil.saveSongInfo(song);
          notifyListeners();
        }else{
          song.isPlay=false;
          print("歌曲${song.name},播放失败");
        }
      }
    }else{
      int result;
      if(song.url.contains("http")){
        result=await audioPlayer.play(song.url,isLocal: isLocal);
      }else{
        result=await audioPlayer.play(song.url,isLocal: true);
      }
      if(result==1){
        song.isPlay = true;
        print("歌曲${song.name},播放成功11");
        notifyListeners();
        SongModel.getSongLyric(song.id);
        SharedPreferenceUtil.saveSongInfo(song);
      }else{
        song.isPlay=false;
        print("歌曲${song.name},播放失败");
      }
    }
  }

  //暂停
  void playPause()async {
    song.isPlay = false;
    int result=await audioPlayer.pause();
    if(result==1){
      print("歌曲${song.name},暂停");
    }else{
      print("歌曲${song.name},暂停失败");
    }
    notifyListeners();
  }

  //停止
  void playStop() async{
    song.isPlay = false;
    int result=await audioPlayer.stop();
    if(result==1){
      print("歌曲${song.name},停止播放");
    }else{
      print("歌曲${song.name},停止失败");
    }
    notifyListeners();
  }

  //播放进度控制
  void setSeek(Duration position) async{
    int result=await audioPlayer.seek(position);
    song.seek = position.inMilliseconds;
    notifyListeners();
  }

  //设置播放歌曲的信息
  void setSong(int id, String url, String pic, String name,
      String listId,int seek, int index,bool isPlay) {
    if(song==null){
      song=new PlaySongEntity();
    }
    song.id = id;
    song.url = url;
    song.pic = pic;
    song.name = name;
    song.seek = seek;
    song.listId=listId;
    song.isPlay=isPlay;
    song.index=index;
    currentIndex=index;
    //持久换歌曲信息
    SharedPreferenceUtil.saveSongInfo(song);
  }
  //自动播放下一曲
  void playNext(bool isNext) {
    print("playMode:${playMode}");
    switch (playMode) {
      case Constants.PLAY_MODE_LIST:
      //顺序播放
        if (isNext) {
          if (currentIndex < trackCount - 1) {
            currentIndex++;
          } else {
            currentIndex = 0;
          }
        } else {
          if (currentIndex > 0) {
            currentIndex--;
          } else {
            currentIndex = trackCount - 1;
          }
        }
        break;
      case Constants.PLAY_MODE_RANDOM:
        currentIndex = new Random().nextInt(trackCount);
        break;
      case Constants.PLAY_MODE_SINGLE:
        currentIndex = currentIndex;
        break;
    }
    readyPlay();
    playStart();
  }
  
  //准备数据
  void readyPlay() {
    if(song==null){
      song=new PlaySongEntity();
    }
    song.id = songListEntity.playlist.tracks[currentIndex].id;
    if (null == songUrlList[currentIndex].url) {
      song.url =
      "https://music.163.com/song/media/outer/url?id=${songUrlList[currentIndex].id}.mp3";
    } else {
      song.url = songUrlList[currentIndex].url;
    }
    song.pic = songListEntity.playlist.tracks[currentIndex].al.picUrl;
    song.name = songListEntity.playlist.tracks[currentIndex].name;
    song.id = songListEntity.playlist.tracks[currentIndex].id;
    song.listId = songListEntity.playlist.id.toString();
    song.seek = 0;
    song.isPlay = true;
    song.index = currentIndex;

  }
  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    var response = await http.get(url);
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
  showNotification() async {
    var largeIconPath = await _downloadAndSaveFile(
        song.pic, 'largeIcon.png');
    // Native channel
    const platform = const MethodChannel("com.jack.mymusic");
    bool result = false;
    try {
      result = await platform.invokeMethod("showNotification",{"songPic":largeIconPath,
        "songName":song.name,
        "songCreator":'${songListEntity.playlist.tracks[currentIndex].ar[0].name}-${songListEntity.playlist.tracks[currentIndex].al.name}'
      }); //分析2
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
}
