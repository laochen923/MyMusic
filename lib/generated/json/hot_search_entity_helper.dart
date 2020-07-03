import 'package:mymusic/main/entity/hot_search_entity.dart';

hotSearchEntityFromJson(HotSearchEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new List<HotSearchData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new HotSearchData().fromJson(v));
		});
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	return data;
}

Map<String, dynamic> hotSearchEntityToJson(HotSearchEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['message'] = entity.message;
	return data;
}

hotSearchDataFromJson(HotSearchData data, Map<String, dynamic> json) {
	if (json['searchWord'] != null) {
		data.searchWord = json['searchWord']?.toString();
	}
	if (json['score'] != null) {
		data.score = json['score']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['source'] != null) {
		data.source = json['source']?.toInt();
	}
	if (json['iconType'] != null) {
		data.iconType = json['iconType']?.toInt();
	}
	if (json['iconUrl'] != null) {
		data.iconUrl = json['iconUrl']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	return data;
}

Map<String, dynamic> hotSearchDataToJson(HotSearchData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['searchWord'] = entity.searchWord;
	data['score'] = entity.score;
	data['content'] = entity.content;
	data['source'] = entity.source;
	data['iconType'] = entity.iconType;
	data['iconUrl'] = entity.iconUrl;
	data['url'] = entity.url;
	data['alg'] = entity.alg;
	return data;
}