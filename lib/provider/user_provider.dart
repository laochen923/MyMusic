import 'package:flutter/foundation.dart';
import 'package:mymusic/user/entity/user_play_list_entity.dart';

class UserProvider with ChangeNotifier {
  int level;
  String backgroundUrl;
  int loveSongSheetCount;
  int collectSongSheetCount;
  List<UserPlayListPlaylist> playlist;

  void setUserDetailInfo(int level,String backgroundUrl) {
    this.level = level;
    this.backgroundUrl=backgroundUrl;
    notifyListeners();
  }

  void setUserInfo(String backgroundUrl){
    notifyListeners();
  }

  void setSongSheetCount(int loveSongSheetCount,int collectSongSheetCount) {
    this.loveSongSheetCount = loveSongSheetCount;
    this.collectSongSheetCount=collectSongSheetCount-1;
    notifyListeners();
  }
}
