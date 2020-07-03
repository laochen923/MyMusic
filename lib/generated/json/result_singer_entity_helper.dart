import 'package:mymusic/main/entity/result_singer_entity.dart';

resultSingerEntityFromJson(ResultSingerEntity data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new ResultSingerResult().fromJson(json['result']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSingerEntityToJson(ResultSingerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['code'] = entity.code;
	return data;
}

resultSingerResultFromJson(ResultSingerResult data, Map<String, dynamic> json) {
	if (json['artistCount'] != null) {
		data.artistCount = json['artistCount']?.toInt();
	}
	if (json['artists'] != null) {
		data.artists = new List<ResultSingerResultArtist>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new ResultSingerResultArtist().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> resultSingerResultToJson(ResultSingerResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['artistCount'] = entity.artistCount;
	if (entity.artists != null) {
		data['artists'] =  entity.artists.map((v) => v.toJson()).toList();
	}
	return data;
}

resultSingerResultArtistFromJson(ResultSingerResultArtist data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	if (json['albumSize'] != null) {
		data.albumSize = json['albumSize']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['img1v1Url'] != null) {
		data.img1v1Url = json['img1v1Url']?.toString();
	}
	if (json['accountId'] != null) {
		data.accountId = json['accountId']?.toInt();
	}
	if (json['img1v1'] != null) {
		data.img1v1 = json['img1v1']?.toInt();
	}
	if (json['mvSize'] != null) {
		data.mvSize = json['mvSize']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	if (json['trans'] != null) {
		data.trans = json['trans'];
	}
	return data;
}

Map<String, dynamic> resultSingerResultArtistToJson(ResultSingerResultArtist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['picUrl'] = entity.picUrl;
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	data['albumSize'] = entity.albumSize;
	data['picId'] = entity.picId;
	data['img1v1Url'] = entity.img1v1Url;
	data['accountId'] = entity.accountId;
	data['img1v1'] = entity.img1v1;
	data['mvSize'] = entity.mvSize;
	data['followed'] = entity.followed;
	data['alg'] = entity.alg;
	data['trans'] = entity.trans;
	return data;
}