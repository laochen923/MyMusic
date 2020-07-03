import 'package:mymusic/net/dio_manager.dart';
import 'package:mymusic/video/entity/video_entity.dart';
import 'package:mymusic/video/entity/video_group_entity.dart';
import 'package:mymusic/video/view/view_video.dart';

class VideoModel{

  //视频标签
  static  getVideoGroupList(VideoView videoView) async{
    DioManager.getInstance().get(
        '/video/group/list',
        null,
        //正常回调
            (data) async {
              videoView.updateTabs(new VideoGroupEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }

  //获取视频标签下的视频
  static  getVideoGroup(int id,VideoView videoView) async{
    DioManager.getInstance().get(
        '/video/group',
        {"id":id},
        //正常回调
            (data) async {
          videoView.updateVideos(new VideoEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }


}