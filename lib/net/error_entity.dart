import 'package:mymusic/generated/json/base/json_convert_content.dart';

class ErrorEntity with JsonConvert<ErrorEntity> {
	String msg;
	int code;
	String message;
}
