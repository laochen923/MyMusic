import 'package:mymusic/main/entity/search_suggest_entity.dart';

searchSuggestEntityFromJson(SearchSuggestEntity data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new SearchSuggestResult().fromJson(json['result']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> searchSuggestEntityToJson(SearchSuggestEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['code'] = entity.code;
	return data;
}

searchSuggestResultFromJson(SearchSuggestResult data, Map<String, dynamic> json) {
	if (json['allMatch'] != null) {
		data.allMatch = new List<SearchSuggest>();
		(json['allMatch'] as List).forEach((v) {
			data.allMatch.add(new SearchSuggest().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> searchSuggestResultToJson(SearchSuggestResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.allMatch != null) {
		data['allMatch'] =  entity.allMatch.map((v) => v.toJson()).toList();
	}
	return data;
}

searchSuggestFromJson(SearchSuggest data, Map<String, dynamic> json) {
	if (json['keyword'] != null) {
		data.keyword = json['keyword']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	if (json['lastKeyword'] != null) {
		data.lastKeyword = json['lastKeyword']?.toString();
	}
	return data;
}

Map<String, dynamic> searchSuggestToJson(SearchSuggest entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['keyword'] = entity.keyword;
	data['type'] = entity.type;
	data['alg'] = entity.alg;
	data['lastKeyword'] = entity.lastKeyword;
	return data;
}