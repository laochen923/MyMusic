
import 'dart:isolate';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/my/entity/artist_sub_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/entity/song_url_entity.dart';
import 'package:mymusic/my/model/model_song.dart';
import 'package:mymusic/my/view/view_edit_song.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/provider/user_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/user/entity/user_play_list_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
class EditPlayListPage extends StatefulWidget {
  @override
  _EditPlayListPageState createState() => _EditPlayListPageState();
}

class _EditPlayListPageState extends State<EditPlayListPage> with EditSongView{
  int selectNumber=0;
  SongListEntity _songListEntity;
  List<UserPlayListPlaylist> playlist = new List();
  List<SongUrlData> songUrlList = new List();
  ReceivePort _port = ReceivePort();
  bool debug=true;
  @override
  void initState() {
    playlist.addAll(Provider.of<UserProvider>(context, listen: false)
        .playlist
        .where((bean) {
      return bean.userId == Global.userDetailEntity.profile.userId;
    }));
    _songListEntity=Provider.of<MusicPlay>(context,listen: false).songListEntity;
    songUrlList=Provider.of<MusicPlay>(context,listen: false).songUrlList;

    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState((){ });
    });

    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("已选择${selectNumber}项"),
        actions: <Widget>[
          Container(
          alignment: Alignment.center,
            margin: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: (){

              },
              child:Text("全选"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child:  ListView.builder(itemBuilder: (context,index){
          return InkWell(
            onTap: () {
              //播放音乐
              //_playMusic(index);
            },
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, top: 30.h),
                    child: Checkbox(tristate: false,value: _songListEntity.playlist.tracks[index].isSelected==null?false:_songListEntity.playlist.tracks[index].isSelected, onChanged: (value){
                        print(value);
                        setState(() {
                          _songListEntity.playlist.tracks[index].isSelected=value;
                        });
                    }),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 30.h),
                        child: Text(
                            "${_songListEntity == null ? "" : _songListEntity.playlist.tracks[index].name}",
                            style: TextStyle(
                                color:Colors.black)),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 20.w),
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
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 330.w),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Icon(Icons.menu, color: Colors.black12),
                    ),
                  )
                ],
              ),
            ),
          );
        },itemCount: _songListEntity.playlist.tracks.length,shrinkWrap: true,),
      ),
      bottomNavigationBar: Container(
        height: 120.h,
        decoration: BoxDecoration(
          border: new Border(
              top:
              BorderSide(color: Colors.black12, width: 1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: (){
                //下一首播放
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Image.asset(R.assetsImgIcNextplay,width: 40.w,color: Colors.black45),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text("下一首播放",style: TextStyle(fontSize: 22.sp,color: Colors.black87),),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                //加入歌单
                showAddDialog();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Image.asset(R.assetsImgIcBottomAdd,width: 40.w,color: Colors.black45),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text("加入歌单",style: TextStyle(fontSize: 22.sp,color: Colors.black87),),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                //下载歌曲
                _findLocalPath(context).then((value) async {
                  for(int i=0;i< _songListEntity.playlist.tracks.length;i++){
                    if(_songListEntity.playlist.tracks[i].isSelected!=null&&_songListEntity.playlist.tracks[i].isSelected){
                      final taskId = await FlutterDownloader.enqueue(
                        url: songUrlList[i].url,
                        fileName: _songListEntity.playlist.tracks[i].name+".mp3",
                        savedDir: value,
                        showNotification: false, // show download progress in status bar (for Android)
                        openFileFromNotification: false, // click on notification to open downloaded file (for Android)
                      );
                      final tasks = await FlutterDownloader.loadTasks();
                     //FlutterDownloader.open(taskId: taskId);
                      //SongModel.downloadFile(songUrlList[i].url,_songListEntity.playlist.tracks[i].name, context);
                    }
                  }
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Image.asset(R.assetsImgIcDownload,width: 40.w,color: Colors.black45),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text("下载",style: TextStyle(fontSize: 22.sp,color: Colors.black87),),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                //从歌单删除
                String tracks="";
                _songListEntity.playlist.tracks.forEach((track) {
                  if(track.isSelected){
                    tracks+=track.id.toString()+",";
                  }
                });
                SongModel.operatorPlaylist(this,"del",_songListEntity.playlist.id,tracks.substring(0,tracks.length-1));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Image.asset(R.assetsImgIcBottomDel,width: 40.w,color: Colors.black45),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text("删除",style: TextStyle(fontSize: 22.sp,color: Colors.black87),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _findLocalPath(BuildContext context) async {
    if(!kIsWeb){
      final directory = Theme.of(context).platform == TargetPlatform.android
          ? await getExternalStorageDirectory()
          : await getApplicationSupportDirectory();
      var _localPath = directory.path + '/Download';

      final savedDir = Directory(_localPath);
      //判断下载路径是否存在
      bool hasExisted = await savedDir.exists();
      //不存在就新建路径
      if (!hasExisted) {
        savedDir.create();
      }
      return savedDir.path;
    }else{
      return "";
    }
    // 因为Apple没有外置存储，所以第一步我们需要先对所在平台进行判断
    // 如果是android，使用getExternalStorageDirectory
    // 如果是iOS，使用getApplicationSupportDirectory

  }

  @override
  void updateArtistSub(ArtistSubEntity entity) {
  }

  void showAddDialog() {
    showDialog(context: context,builder: (BuildContext context) {
      return Dialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30.w,top: 30.h),
              child: Text("收藏到歌单",style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 30.h),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics(),
                  itemCount: playlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildPlayListItem(playlist[index]);
                  })
            )
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
      );
    });
  }

  Widget _buildPlayListItem(UserPlayListPlaylist playlist) {
    return new GestureDetector(
        onTap: () {
          //处理点击事件
          String tracks="";
          _songListEntity.playlist.tracks.forEach((track) {
            if(track.isSelected){
              tracks+=track.id.toString()+",";
            }
          });
          SongModel.operatorPlaylist(this,"add",playlist.id,tracks.substring(0,tracks.length-1));
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
                    width: 200.w,
                    margin: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: Text(playlist.name,
                        maxLines: 2,
                        style: TextStyle(fontSize: 26.sp),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 5.h),
                    width: 200.w,
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

  @override
  void operatorResult(String msg,int code) {
    if(code==502) {
      Fluttertoast.showToast(msg: msg);
      Navigator.pop(context);
    }else{
      Navigator.pop(context);
    }
  }
}
