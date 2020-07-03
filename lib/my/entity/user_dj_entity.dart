import 'package:mymusic/generated/json/base/json_convert_content.dart';

class UserDjEntity with JsonConvert<UserDjEntity> {
	int code;
	int count;
	List<dynamic> programs;
	bool more;
}
