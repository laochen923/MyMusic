import 'package:mymusic/discover/entity/banner_entity.dart';
import 'package:mymusic/discover/entity/comment_hot_wall_entity.dart';
import 'package:mymusic/discover/entity/dj_popular_entity.dart';
import 'package:mymusic/discover/entity/new_song_entity.dart';
import 'package:mymusic/discover/entity/personalized_entity.dart';
import 'package:mymusic/discover/entity/recommend_resource_entity.dart';
import 'package:mymusic/discover/entity/recommend_songs_entity.dart';

abstract class DiscoverView{
  void updateBanner(BannerEntity bannerEntity);

  void updateRecommend(RecommendResourceEntity entity);

  void updateRecommendSongs(RecommendSongsEntity entity);

  void updatePersonalized(PersonalizedEntity entity);

  void updateCommentHotWall(CommentHotWallEntity entity);

  void updateRecommendDj(DjPopularEntity entity);

  void updateNewSongs(NewSongEntity entity);


}