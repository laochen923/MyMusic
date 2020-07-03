import 'package:mymusic/generated/json/base/json_convert_content.dart';

class PersonalizedEntity with JsonConvert<PersonalizedEntity> {
	bool hasTaste;
	int code;
	int category;
	List<PersonalizedResult> result;
}

class PersonalizedResult with JsonConvert<PersonalizedResult> {
	int id;
	int type;
	String name;
	String copywriter;
	String picUrl;
	bool canDislike;
	int trackNumberUpdateTime;
	int playCount;
	int trackCount;
	bool highQuality;
	String alg;
}
