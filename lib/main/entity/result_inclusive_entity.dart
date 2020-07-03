import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/main/entity/result_album_entity.dart';
import 'package:mymusic/main/entity/result_singer_entity.dart';
import 'package:mymusic/main/entity/result_single_entity.dart';
import 'package:mymusic/main/entity/result_song_list_entity.dart';
import 'package:mymusic/main/entity/result_video_entity.dart';

class ResultInclusiveEntity with JsonConvert<ResultInclusiveEntity> {
  ResultInclusive result;
  int code;
}

class ResultInclusive with JsonConvert<ResultInclusive>{
     Song song;
     int code;
     PlayList playList;
     Artist artist;
     Album album;
     Video video;
}

class Song with JsonConvert<Song>{
  String moreText;
  List<ResultSingleResultSong> songs;
  bool more;
  List<int> resourceIds;
}

class PlayList with JsonConvert<PlayList>{
  String moreText;
  List<ResultSongListResultPlaylist> playLists;
  bool more;
  List<int> resourceIds;
}

class Artist with JsonConvert<Artist>{
  String moreText;
  List<ResultSingerResultArtist> artists;
  bool more;
  List<int> resourceIds;
}

class Album with JsonConvert<Album>{
  String moreText;
  List<ResultAlbumResultAlbum> albums;
  bool more;
  List<int> resourceIds;
}

class Video with JsonConvert<Video>{
  String moreText;
  List<ResultVideoResultVideo> videos;
  bool more;
  List<int> resourceIds;
}


