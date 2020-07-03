import 'package:mymusic/discover/entity/dj_popular_entity.dart';

djPopularEntityFromJson(DjPopularEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'];
	}
	if (json['data'] != null) {
		data.data = new DjPopularData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> djPopularEntityToJson(DjPopularEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

djPopularDataFromJson(DjPopularData data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<HotDjPopular>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HotDjPopular().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> djPopularDataToJson(DjPopularData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['updateTime'] = entity.updateTime;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

hotDjPopularFromJson(HotDjPopular data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['rank'] != null) {
		data.rank = json['rank']?.toInt();
	}
	if (json['lastRank'] != null) {
		data.lastRank = json['lastRank']?.toInt();
	}
	if (json['score'] != null) {
		data.score = json['score']?.toInt();
	}
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	return data;
}

Map<String, dynamic> hotDjPopularToJson(HotDjPopular entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['rank'] = entity.rank;
	data['lastRank'] = entity.lastRank;
	data['score'] = entity.score;
	data['nickName'] = entity.nickName;
	data['avatarUrl'] = entity.avatarUrl;
	data['userType'] = entity.userType;
	return data;
}