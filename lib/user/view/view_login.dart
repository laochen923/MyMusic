
import 'package:mymusic/net/error_entity.dart';
import 'package:mymusic/user/entity/user_entity.dart';

abstract class LoginView{
  void loginSuccess(UserEntity userEntity);

  void loginFailed(ErrorEntity error);

  void showLoading();

  void hideLoading();
}
