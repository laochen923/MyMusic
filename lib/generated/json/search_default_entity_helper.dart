import 'package:mymusic/main/entity/search_default_entity.dart';

searchDefaultEntityFromJson(SearchDefaultEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new SearchDefaultData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> searchDefaultEntityToJson(SearchDefaultEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

searchDefaultDataFromJson(SearchDefaultData data, Map<String, dynamic> json) {
	if (json['showKeyword'] != null) {
		data.showKeyword = json['showKeyword']?.toString();
	}
	if (json['action'] != null) {
		data.action = json['action']?.toInt();
	}
	if (json['realkeyword'] != null) {
		data.realkeyword = json['realkeyword']?.toString();
	}
	if (json['searchType'] != null) {
		data.searchType = json['searchType']?.toInt();
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	if (json['gap'] != null) {
		data.gap = json['gap']?.toInt();
	}
	return data;
}

Map<String, dynamic> searchDefaultDataToJson(SearchDefaultData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['showKeyword'] = entity.showKeyword;
	data['action'] = entity.action;
	data['realkeyword'] = entity.realkeyword;
	data['searchType'] = entity.searchType;
	data['alg'] = entity.alg;
	data['gap'] = entity.gap;
	return data;
}