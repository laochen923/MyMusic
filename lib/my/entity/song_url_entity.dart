import 'package:mymusic/generated/json/base/json_convert_content.dart';

class SongUrlEntity with JsonConvert<SongUrlEntity> {
	List<SongUrlData> data;
	int code;
}

class SongUrlData with JsonConvert<SongUrlData> {
	int id;
	String url;
	int br;
	int size;
	String md5;
	int code;
	int expi;
	String type;
	int gain;
	int fee;
	dynamic uf;
	int payed;
	int flag;
	bool canExtend;
	dynamic freeTrialInfo;
	String level;
	String encodeType;
}
