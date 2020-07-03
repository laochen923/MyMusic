import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/my/entity/comments_entity.dart';
import 'package:mymusic/my/entity/lyric_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/entity/song_url_entity.dart';
import 'package:mymusic/my/view/view_comment.dart';
import 'package:mymusic/my/view/view_edit_song.dart';
import 'package:mymusic/my/view/view_newsong.dart';
import 'package:mymusic/my/view/view_share.dart';
import 'package:mymusic/my/view/view_song.dart';
import 'package:mymusic/net/dio_manager.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:provider/provider.dart';

class SongModel {
  static void getPlaylistDetail(String id, SongView myView) async {
    DioManager.getInstance().get('/playlist/detail', {"id": id, "br": 320000},
        //正常回调
        (data) async {
      SongListEntity songListEntity = new SongListEntity().fromJson(data);
      myView.updatePlaylistDetail(songListEntity);
    },
        //错误回调
        (error) {});
  }

  static void getSongUrls(String param, SongView myView) async {
    DioManager.getInstance().get('/song/url', {"id": param},
        //正常回调
        (data) async {
      myView.updateSongUrl(new SongUrlEntity().fromJson(data));
    },
        //错误回调
        (error) {});
  }

  static void getSongLyric(int id) async {
    DioManager.getInstance().get('/lyric', {"id": id},
        //正常回调
        (data) async {
      Global.lyricEntity = new LyricEntity().fromJson(data);
    },
        //错误回调
        (error) {});
  }

  static void getTopSong(NewSongView newSongView) async {
    DioManager.getInstance().get(
        '/top/song',
        {"type": 96, "limit": 20},
        //正常回调
        (data) async {},
        //错误回调
        (error) {});
  }

  //op: 从歌单增加单曲为 add, 删除为 del
  //
  //pid: 歌单 id tracks: 歌曲 id,可多个,用逗号隔开
  static void operatorPlaylist(
      EditSongView editSongView, String op, int pid, String tracks) async {
    DioManager.getInstance().post(
        '/playlist/tracks',
        {"op": op, "pid": pid, "tracks": tracks},
        //正常回调
        (data) async {
          editSongView.operatorResult(data["msg"],data["code"]);
        },
        //错误回调
        (error) {});
  }

  static void downloadFile(String url,String name, BuildContext context) async {
    DioManager.getInstance().downloadFile(url,name,context,);
  }

  //可选参数 : type: 资源类型，默认歌曲 song，可传 song,playlist,mv,djradio,djprogram
  static void shareMessage(
      NewSongView newSongView, int id, String type, String msg) async {
    DioManager.getInstance().post(
        '/share/resource',
        {"type": type, "id": id, "msg": msg},
        //正常回调
        (data) async {},
        //错误回调
        (error) {});
  }

//t:1 发送, 2 回复,0 删除
//
//tpye: 数字,资源类型,对应歌曲,mv,专辑,歌单,电台,视频对应以下类型
//
//0: 歌曲
//
//1: mv
//
//2: 歌单
//
//3: 专辑
//
//4: 电台
//
//5: 视频
//
//6: 动态
//id:对应资源 id
//
//content :要发送的内容
//
//commentId :回复的评论id (回复评论时必填)
  static void comment(CommentView commentView, int t, int type, int id,
      String content, int commentId) async {
    DioManager.getInstance().post(
        '/comment',
        {"t": t, "type": type, "id": id,"content":content,"commentId":commentId},
        //正常回调
        (data) async {
          commentView.commentsSuccess();
        },
        //错误回调
        (error) {});
  }

  static void getComments(CommentView commentView, int id,int offset,int before) async {
    DioManager.getInstance().post(
        '/comment/playlist',
        {"id": id,"limit":30,"offset":offset,"before":before},
        //正常回调
            (data) async {
              commentView.updateComments(new CommentsEntity().fromJson(data));
            },
        //错误回调
            (error) {});
  }
  //必选参数 : id : 资源 id, 如歌曲 id,mv id
  //
  //cid : 评论 id
  //
  //t : 是否点赞 ,1 为点赞 ,0 为取消点赞
  //
  //tpye: 数字 , 资源类型 , 对应歌曲 , mv, 专辑 , 歌单 , 电台, 视频对应以下类型
  //
  //0: 歌曲
  //
  //1: mv
  //
  //2: 歌单
  //
  //3: 专辑
  //
  //4: 电台
  //
  //5: 视频
  //
  //6: 动态
  static void commentLike(CommentView commentView, int id,int cid,int t,int type) async {
    DioManager.getInstance().post(
        '/comment/like',
        {"id": id,"cid":cid,"t":t,"type":type},
        //正常回调
            (data) async {

        },
        //错误回调
            (error) {});
  }

  static void shareToCloudMusic(ShareView shareView, int id,String type,String msg) async {
    DioManager.getInstance().post(
        '/share/resource',
        {"id": id,"type":type,"msg":msg},
        //正常回调
            (data) async {
              shareView.shareSuccess();
        },
        //错误回调
            (error) {});
  }
}
