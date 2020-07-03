import 'package:mymusic/generated/json/base/json_convert_content.dart';

class CountEntity with JsonConvert<CountEntity> {
	int programCount;
	int djRadioCount;
	int mvCount;
	int artistCount;
	int newProgramCount;
	int createDjRadioCount;
	int createdPlaylistCount;
	int subPlaylistCount;
	int code;
}
