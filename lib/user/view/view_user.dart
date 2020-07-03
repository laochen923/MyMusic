
import 'package:mymusic/user/entity/user_play_list_entity.dart';

abstract class UserView{
  void getUserPlayListSuccess(UserPlayListEntity entity);

  void getUserDetailSuccess();
}