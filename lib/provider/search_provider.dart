import 'package:flutter/foundation.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/main/entity/hot_search_entity.dart';
import 'package:mymusic/main/entity/result_album_entity.dart';
import 'package:mymusic/main/entity/result_inclusive_entity.dart';
import 'package:mymusic/main/entity/result_singer_entity.dart';
import 'package:mymusic/main/entity/result_single_entity.dart';
import 'package:mymusic/main/entity/result_song_list_entity.dart';
import 'package:mymusic/main/entity/result_video_entity.dart';
import 'package:mymusic/utils/shared_preferences.dart';

class Search with ChangeNotifier {
  String defaultKey;
  String searchKey;
  List<HotSearchData> hotSearch;
  bool showHistory=false;
  List<String> searchHistory=new List();
  List<ResultSingleResultSong> songs=new List();
  List<ResultVideoResultVideo> videos=new List();
  List<ResultSingerResultArtist> artists=new List();
  List<ResultAlbumResultAlbum> albums=new List();
  List<ResultSongListResultPlaylist> playlists=new List();
  ResultInclusive resultInclusive;
  void setDefaultKey(String defaultKey){
    this.defaultKey=defaultKey;
    notifyListeners();
  }

  void setHotSearchData(List<HotSearchData> hotSearch){
    this.hotSearch=hotSearch;
    notifyListeners();
  }

  void addSearchHistory(String searchWord) {
    showHistory=true;
    if(!searchHistory.contains(searchWord)) {
      searchHistory.add(searchWord);
    }
    SharedPreferenceUtil.setStringList(Constants.SEARCH_HISTORY, searchHistory);
    notifyListeners();
  }

  void removeSearchHistory() {
    showHistory=false;
    searchHistory.clear();
    SharedPreferenceUtil.setStringList(Constants.SEARCH_HISTORY, null);
    notifyListeners();
  }
}
