import 'package:mymusic/generated/json/base/json_convert_content.dart';

class ArtistSubEntity with JsonConvert<ArtistSubEntity> {
	List<ArtistSubData> data;
	bool hasMore;
	int count;
	int code;
}

class ArtistSubData with JsonConvert<ArtistSubData> {
	String info;
	int id;
	String name;
	dynamic trans;
	List<String> alias;
	int albumSize;
	int mvSize;
	int picId;
	String picUrl;
	String img1v1Url;
}
