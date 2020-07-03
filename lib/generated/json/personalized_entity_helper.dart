import 'package:mymusic/discover/entity/personalized_entity.dart';

personalizedEntityFromJson(PersonalizedEntity data, Map<String, dynamic> json) {
	if (json['hasTaste'] != null) {
		data.hasTaste = json['hasTaste'];
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toInt();
	}
	if (json['result'] != null) {
		data.result = new List<PersonalizedResult>();
		(json['result'] as List).forEach((v) {
			data.result.add(new PersonalizedResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> personalizedEntityToJson(PersonalizedEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['hasTaste'] = entity.hasTaste;
	data['code'] = entity.code;
	data['category'] = entity.category;
	if (entity.result != null) {
		data['result'] =  entity.result.map((v) => v.toJson()).toList();
	}
	return data;
}

personalizedResultFromJson(PersonalizedResult data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['copywriter'] != null) {
		data.copywriter = json['copywriter']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['canDislike'] != null) {
		data.canDislike = json['canDislike'];
	}
	if (json['trackNumberUpdateTime'] != null) {
		data.trackNumberUpdateTime = json['trackNumberUpdateTime']?.toInt();
	}
	if (json['playCount'] != null) {
		data.playCount = json['playCount']?.toInt();
	}
	if (json['trackCount'] != null) {
		data.trackCount = json['trackCount']?.toInt();
	}
	if (json['highQuality'] != null) {
		data.highQuality = json['highQuality'];
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	return data;
}

Map<String, dynamic> personalizedResultToJson(PersonalizedResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['name'] = entity.name;
	data['copywriter'] = entity.copywriter;
	data['picUrl'] = entity.picUrl;
	data['canDislike'] = entity.canDislike;
	data['trackNumberUpdateTime'] = entity.trackNumberUpdateTime;
	data['playCount'] = entity.playCount;
	data['trackCount'] = entity.trackCount;
	data['highQuality'] = entity.highQuality;
	data['alg'] = entity.alg;
	return data;
}