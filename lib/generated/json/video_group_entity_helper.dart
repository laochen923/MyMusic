import 'package:mymusic/video/entity/video_group_entity.dart';

videoGroupEntityFromJson(VideoGroupEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<VideoGroupData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new VideoGroupData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> videoGroupEntityToJson(VideoGroupEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

videoGroupDataFromJson(VideoGroupData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['relatedVideoType'] != null) {
		data.relatedVideoType = json['relatedVideoType'];
	}
	if (json['selectTab'] != null) {
		data.selectTab = json['selectTab'];
	}
	if (json['abExtInfo'] != null) {
		data.abExtInfo = json['abExtInfo'];
	}
	return data;
}

Map<String, dynamic> videoGroupDataToJson(VideoGroupData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['url'] = entity.url;
	data['relatedVideoType'] = entity.relatedVideoType;
	data['selectTab'] = entity.selectTab;
	data['abExtInfo'] = entity.abExtInfo;
	return data;
}