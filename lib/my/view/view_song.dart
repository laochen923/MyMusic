import 'package:mymusic/my/entity/lyric_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/entity/song_url_entity.dart';

abstract class SongView{
    void updatePlaylistDetail(SongListEntity songListEntity);
    void updateSongUrl(SongUrlEntity songUrlEntity);
    void updateSongLyric(LyricEntity lyricEntity);
}