import 'package:mymusic/generated/json/base/json_convert_content.dart';

class ResultSingerEntity with JsonConvert<ResultSingerEntity> {
	ResultSingerResult result;
	int code;
}

class ResultSingerResult with JsonConvert<ResultSingerResult> {
	int artistCount;
	List<ResultSingerResultArtist> artists;
}

class ResultSingerResultArtist with JsonConvert<ResultSingerResultArtist> {
	int id;
	String name;
	String picUrl;
	List<dynamic> alias;
	int albumSize;
	int picId;
	String img1v1Url;
	int accountId;
	int img1v1;
	int mvSize;
	bool followed;
	String alg;
	dynamic trans;
}
