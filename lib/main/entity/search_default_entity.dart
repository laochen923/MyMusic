import 'package:mymusic/generated/json/base/json_convert_content.dart';

class SearchDefaultEntity with JsonConvert<SearchDefaultEntity> {
	int code;
	SearchDefaultData data;
}

class SearchDefaultData with JsonConvert<SearchDefaultData> {
	String showKeyword;
	int action;
	String realkeyword;
	int searchType;
	String alg;
	int gap;
}
