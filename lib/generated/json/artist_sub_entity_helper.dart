import 'package:mymusic/my/entity/artist_sub_entity.dart';

artistSubEntityFromJson(ArtistSubEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<ArtistSubData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ArtistSubData().fromJson(v));
		});
	}
	if (json['hasMore'] != null) {
		data.hasMore = json['hasMore'];
	}
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> artistSubEntityToJson(ArtistSubEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['hasMore'] = entity.hasMore;
	data['count'] = entity.count;
	data['code'] = entity.code;
	return data;
}

artistSubDataFromJson(ArtistSubData data, Map<String, dynamic> json) {
	if (json['info'] != null) {
		data.info = json['info']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['trans'] != null) {
		data.trans = json['trans'];
	}
	if (json['alias'] != null) {
		data.alias = json['alias']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['albumSize'] != null) {
		data.albumSize = json['albumSize']?.toInt();
	}
	if (json['mvSize'] != null) {
		data.mvSize = json['mvSize']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['img1v1Url'] != null) {
		data.img1v1Url = json['img1v1Url']?.toString();
	}
	return data;
}

Map<String, dynamic> artistSubDataToJson(ArtistSubData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['info'] = entity.info;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['trans'] = entity.trans;
	data['alias'] = entity.alias;
	data['albumSize'] = entity.albumSize;
	data['mvSize'] = entity.mvSize;
	data['picId'] = entity.picId;
	data['picUrl'] = entity.picUrl;
	data['img1v1Url'] = entity.img1v1Url;
	return data;
}