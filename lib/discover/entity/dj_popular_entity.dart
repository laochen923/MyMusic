import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class DjPopularEntity with JsonConvert<DjPopularEntity> {
	int code;
	dynamic msg;
	DjPopularData data;
}

class DjPopularData with JsonConvert<DjPopularData> {
	int total;
	int updateTime;
	@JSONField(name: "list")
	List<HotDjPopular> xList;
}

class HotDjPopular with JsonConvert<HotDjPopular> {
	int id;
	int rank;
	int lastRank;
	int score;
	String nickName;
	String avatarUrl;
	int userType;
}
