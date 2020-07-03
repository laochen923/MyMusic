import 'package:mymusic/generated/json/base/json_convert_content.dart';

class LocalSongEntity with JsonConvert<LocalSongEntity>{
   List<LocalSong> songs;
   int code;
}

class LocalSong with JsonConvert<LocalSong>{
   String singer;//歌手
   String song;//歌曲名
   String path;//歌曲的地址
   String album;
   int duration;//歌曲长度
   int size;//歌曲的大小
}