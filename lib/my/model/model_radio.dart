import 'package:mymusic/my/entity/personal_fm_entity.dart';
import 'package:mymusic/my/entity/personalized_dj_entity.dart';
import 'package:mymusic/my/entity/song_list_entity.dart';
import 'package:mymusic/my/view/view_radio.dart';
import 'package:mymusic/my/view/view_song.dart';
import 'package:mymusic/net/dio_manager.dart';

//电台
class RadioModel {

  //获取用户电台
  static getUserRadio(int uid) async {
    DioManager.getInstance().get(
        '/user/dj',
        {"uid": uid},
        //正常回调
            (data) {

        },
        //错误回调
            (error) {});
  }


  //获取推荐电台
  static getDjProgram(RadioView radioView) async {
    DioManager.getInstance().get(
        '/personalized/djprogram',
       null,
        //正常回调
            (data) {
              radioView.updatePersonalizedDj(new PersonalizedDjEntity().fromJson(data));
        },
        //错误回调
            (error) {});
  }

  //获取推荐电台
  static getPersonalFm(RadioView radioView) async {
    DioManager.getInstance().get(
        '/personal_fm',
        null,
        //正常回调
            (data) {
          radioView.updatePersonalFm(new PersonalFmEntity().fromJson(data));
        },
        //错误回调
            (error) {});
  }

}
