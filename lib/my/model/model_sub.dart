import 'package:mymusic/my/entity/artist_sub_entity.dart';
import 'package:mymusic/my/entity/personalized_dj_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/view/view_radio.dart';
import 'package:mymusic/my/view/view_song.dart';
import 'package:mymusic/my/view/view_sub.dart';
import 'package:mymusic/net/dio_manager.dart';

//电台
class SubModel {

  static getArtistSublist(SubView subView) async {
    DioManager.getInstance().get(
        '/artist/sublist',
       null,
        //正常回调
            (data) {
              subView.updateArtistSub(new ArtistSubEntity().fromJson(data));
        },
        //错误回调
            (error) {});
  }

  static getMvSublist() async {
    DioManager.getInstance().get(
        '/mv/sublist',
        null,
        //正常回调
            (data) {

        },
        //错误回调
            (error) {});
  }
}
