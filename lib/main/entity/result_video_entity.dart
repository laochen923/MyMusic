import 'package:mymusic/generated/json/base/json_convert_content.dart';

class ResultVideoEntity with JsonConvert<ResultVideoEntity> {
	ResultVideoResult result;
	int code;
}

class ResultVideoResult with JsonConvert<ResultVideoResult> {
	int videoCount;
	List<ResultVideoResultVideo> videos;
}

class ResultVideoResultVideo with JsonConvert<ResultVideoResultVideo> {
	String coverUrl;
	String title;
	int durationms;
	int playTime;
	int type;
	List<ResultVideoResultVideosCreator> creator;
	dynamic aliaName;
	dynamic transName;
	String vid;
	List<dynamic> markTypes;
	String alg;
}

class ResultVideoResultVideosCreator with JsonConvert<ResultVideoResultVideosCreator> {
	int userId;
	String userName;
}
