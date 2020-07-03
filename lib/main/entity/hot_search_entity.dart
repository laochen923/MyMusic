import 'package:mymusic/generated/json/base/json_convert_content.dart';

class HotSearchEntity with JsonConvert<HotSearchEntity> {
	int code;
	List<HotSearchData> data;
	String message;
}

class HotSearchData with JsonConvert<HotSearchData> {
	String searchWord;
	int score;
	String content;
	int source;
	int iconType;
	String iconUrl;
	String url;
	String alg;
}
