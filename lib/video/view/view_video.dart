import 'package:mymusic/video/entity/video_entity.dart';
import 'package:mymusic/video/entity/video_group_entity.dart';

abstract class VideoView{
void updateTabs(VideoGroupEntity entity);
void updateVideos(VideoEntity entity);
}