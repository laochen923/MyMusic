import 'package:mymusic/main/entity/result_video_entity.dart';

resultVideoEntityFromJson(ResultVideoEntity data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new ResultVideoResult().fromJson(json['result']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultVideoEntityToJson(ResultVideoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['code'] = entity.code;
	return data;
}

resultVideoResultFromJson(ResultVideoResult data, Map<String, dynamic> json) {
	if (json['videoCount'] != null) {
		data.videoCount = json['videoCount']?.toInt();
	}
	if (json['videos'] != null) {
		data.videos = new List<ResultVideoResultVideo>();
		(json['videos'] as List).forEach((v) {
			data.videos.add(new ResultVideoResultVideo().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> resultVideoResultToJson(ResultVideoResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['videoCount'] = entity.videoCount;
	if (entity.videos != null) {
		data['videos'] =  entity.videos.map((v) => v.toJson()).toList();
	}
	return data;
}

resultVideoResultVideoFromJson(ResultVideoResultVideo data, Map<String, dynamic> json) {
	if (json['coverUrl'] != null) {
		data.coverUrl = json['coverUrl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['durationms'] != null) {
		data.durationms = json['durationms']?.toInt();
	}
	if (json['playTime'] != null) {
		data.playTime = json['playTime']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['creator'] != null) {
		data.creator = new List<ResultVideoResultVideosCreator>();
		(json['creator'] as List).forEach((v) {
			data.creator.add(new ResultVideoResultVideosCreator().fromJson(v));
		});
	}
	if (json['aliaName'] != null) {
		data.aliaName = json['aliaName'];
	}
	if (json['transName'] != null) {
		data.transName = json['transName'];
	}
	if (json['vid'] != null) {
		data.vid = json['vid']?.toString();
	}
	if (json['markTypes'] != null) {
		data.markTypes = new List<dynamic>();
		data.markTypes.addAll(json['markTypes']);
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	return data;
}

Map<String, dynamic> resultVideoResultVideoToJson(ResultVideoResultVideo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['coverUrl'] = entity.coverUrl;
	data['title'] = entity.title;
	data['durationms'] = entity.durationms;
	data['playTime'] = entity.playTime;
	data['type'] = entity.type;
	if (entity.creator != null) {
		data['creator'] =  entity.creator.map((v) => v.toJson()).toList();
	}
	data['aliaName'] = entity.aliaName;
	data['transName'] = entity.transName;
	data['vid'] = entity.vid;
	if (entity.markTypes != null) {
		data['markTypes'] =  [];
	}
	data['alg'] = entity.alg;
	return data;
}

resultVideoResultVideosCreatorFromJson(ResultVideoResultVideosCreator data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['userName'] != null) {
		data.userName = json['userName']?.toString();
	}
	return data;
}

Map<String, dynamic> resultVideoResultVideosCreatorToJson(ResultVideoResultVideosCreator entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['userName'] = entity.userName;
	return data;
}