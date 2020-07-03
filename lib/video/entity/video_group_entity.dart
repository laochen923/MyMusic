import 'package:mymusic/generated/json/base/json_convert_content.dart';

class VideoGroupEntity with JsonConvert<VideoGroupEntity> {
	int code;
	String message;
	List<VideoGroupData> data;
}

class VideoGroupData with JsonConvert<VideoGroupData> {
	int id;
	String name;
	String url;
	dynamic relatedVideoType;
	bool selectTab;
	dynamic abExtInfo;
}
