import 'package:flutter/cupertino.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/main/entity/hot_search_entity.dart';
import 'package:mymusic/main/entity/result_album_entity.dart';
import 'package:mymusic/main/entity/result_inclusive_entity.dart';
import 'package:mymusic/main/entity/result_singer_entity.dart';
import 'package:mymusic/main/entity/result_single_entity.dart';
import 'package:mymusic/main/entity/result_song_list_entity.dart';
import 'package:mymusic/main/entity/result_video_entity.dart';
import 'package:mymusic/main/entity/search_default_entity.dart';
import 'package:mymusic/main/entity/search_suggest_entity.dart';
import 'package:mymusic/main/view/view_search.dart';
import 'package:mymusic/net/dio_manager.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchModel {
  static void getSearchDefault(BuildContext context) async {
    DioManager.getInstance().get('/search/default', null,
        //正常回调
        (data) async {
      Provider.of<Search>(context, listen: false).setDefaultKey(
          new SearchDefaultEntity().fromJson(data).data.realkeyword);
    },
        //错误回调
        (error) {});
  }

  static void getSearchHot(BuildContext context) async {
    DioManager.getInstance().get(
        '/search/hot',
        null,
        //正常回调
        (data) async {},
        //错误回调
        (error) {});
  }

  static void getSearchHotDetail(BuildContext context) async {
    DioManager.getInstance().get('/search/hot/detail', null,
        //正常回调
        (data) async {
      Provider.of<Search>(context, listen: false)
          .setHotSearchData(new HotSearchEntity().fromJson(data).data);
    },
        //错误回调
        (error) {});
  }

  static void getSearchSuggest(String keywords, SearchView searchView) async {
    DioManager.getInstance()
        .get('/search/suggest', {"keywords": keywords, "type": "mobile"},
            //正常回调
            (data) async {
      searchView.updateSearchSuggest(
          new SearchSuggestEntity().fromJson(data).result.allMatch);
    },
            //错误回调
            (error) {});
  }

  static void search(
      String keywords, BuildContext context, int offset, int type) async {
    print("search-----${type}");
    DioManager.getInstance().get('/search',
        {"keywords": keywords, "limit": 30, "offset": offset, "type": type},
        //正常回调
        (data) async {
      switch (type) {
        case Constants.SEARCH_TYPE_INCLUSIVE:
          Provider.of<Search>(context,listen: false).resultInclusive=new ResultInclusiveEntity().fromJson(data).result;
          break;
        case Constants.SEARCH_TYPE_SINGLE:
          Provider.of<Search>(context,listen: false).songs=new ResultSingleEntity().fromJson(data).result.songs;
          break;
        case Constants.SEARCH_TYPE_VIDEO:
          Provider.of<Search>(context,listen: false).videos=new ResultVideoEntity().fromJson(data).result.videos;
          break;
        case Constants.SEARCH_TYPE_SINGER:
          Provider.of<Search>(context,listen: false).artists=new ResultSingerEntity().fromJson(data).result.artists;
          break;
        case Constants.SEARCH_TYPE_ALBUM:
          Provider.of<Search>(context,listen: false).albums=new ResultAlbumEntity().fromJson(data).result.albums;
          break;
        case Constants.SEARCH_TYPE_SONG_LIST:
          Provider.of<Search>(context,listen: false).playlists=new ResultSongListEntity().fromJson(data).result.playlists;
          break;
      }
      Provider.of<Search>(context,listen: false).notifyListeners();
    },
        //错误回调
        (error) {});
  }
}
