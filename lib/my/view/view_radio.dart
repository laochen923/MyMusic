

import 'package:mymusic/my/entity/personal_fm_entity.dart';
import 'package:mymusic/my/entity/personalized_dj_entity.dart';

abstract class RadioView{
  void updateMyRadio();

  void updatePersonalizedDj(PersonalizedDjEntity entity);

  void updatePersonalFm(PersonalFmEntity entity);
}