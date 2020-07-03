import 'package:mymusic/discover/entity/comment_hot_wall_entity.dart';
import 'package:mymusic/net/dio_manager.dart';
import 'package:mymusic/yuncun/view/view_yuncun.dart';

class YunCunModel{

  //获取云村热门
  static  getCommentHotWall(YunCunView yunCunView) async{
    DioManager.getInstance().get(
        '/comment/hotwall/list',
        {"limit":6},
        //正常回调
            (data) async {
              yunCunView.updateCommentHotWall(new CommentHotWallEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }

  //获取热门话题
  static  getHotTopic(int limit,int offset,YunCunView yunCunView) async{
    DioManager.getInstance().get(
        '/hot/topic',
        {"limit":limit,
        "offset":offset},
        //正常回调
            (data) async {

        },
        //错误回调
            (error) {

        });
    return;
  }
}