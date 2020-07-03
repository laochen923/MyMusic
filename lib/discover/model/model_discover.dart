import 'package:mymusic/discover/entity/banner_entity.dart';
import 'package:mymusic/discover/entity/comment_hot_wall_entity.dart';
import 'package:mymusic/discover/entity/dj_popular_entity.dart';
import 'package:mymusic/discover/entity/new_song_entity.dart';
import 'package:mymusic/discover/entity/personalized_entity.dart';
import 'package:mymusic/discover/entity/recommend_resource_entity.dart';
import 'package:mymusic/discover/entity/recommend_songs_entity.dart';
import 'package:mymusic/discover/view/view_discover.dart';
import 'package:mymusic/net/dio_manager.dart';

class DiscoverModel {
  //获取banner
  static getBanners(DiscoverView discoverView) async{
    DioManager.getInstance().get(
        '/banner',
        {"type":1},
        //正常回调
            (data) async {
          discoverView.updateBanner(new BannerEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
   return;
  }

  //获取每日推荐歌单
  static getRecommendResource(DiscoverView discoverView) async{
     DioManager.getInstance().get(
        '/recommend/resource',
       null,
        //正常回调
            (data) async {
          discoverView.updateRecommend(new RecommendResourceEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }
  //获取每日推荐歌曲
  static  getRecommendSongs(DiscoverView discoverView) async{
     DioManager.getInstance().get(
        '/recommend/songs',
        {"limit":10},
        //正常回调
            (data) async {
              discoverView.updateRecommendSongs(new RecommendSongsEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }

  //获取推荐歌单
  static  getPersonalized(DiscoverView discoverView) async{
    DioManager.getInstance().get(
        '/personalized',
        {"limit":6},
        //正常回调
            (data) async {
          discoverView.updatePersonalized(new PersonalizedEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }

  //获取云村热门
  static  getCommentHotWall(DiscoverView discoverView) async{
    DioManager.getInstance().get(
        '/comment/hotwall/list',
        {"limit":6},
        //正常回调
            (data) async {
              discoverView.updateCommentHotWall(new CommentHotWallEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }

//获取云村热门
  static  getRecommendDj(DiscoverView discoverView) async{
    DioManager.getInstance().get(
        '/dj/toplist/popular',
        {"limit":6},
        //正常回调
            (data) async {
          discoverView.updateRecommendDj(new DjPopularEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }

  static  getRecommendNewSongs(DiscoverView discoverView) async{
    DioManager.getInstance().get(
        '/personalized/newsong',
        {"limit":12},
        //正常回调
            (data) async {
          discoverView.updateNewSongs(new NewSongEntity().fromJson(data));
        },
        //错误回调
            (error) {

        });
    return;
  }


}
