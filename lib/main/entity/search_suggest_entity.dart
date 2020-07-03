import 'package:mymusic/generated/json/base/json_convert_content.dart';

class SearchSuggestEntity with JsonConvert<SearchSuggestEntity> {
	SearchSuggestResult result;
	int code;
}

class SearchSuggestResult with JsonConvert<SearchSuggestResult> {
	List<SearchSuggest> allMatch;
}

class SearchSuggest with JsonConvert<SearchSuggest> {
	String keyword;
	int type;
	String alg;
	String lastKeyword;
}
