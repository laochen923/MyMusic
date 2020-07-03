import 'package:mymusic/my/entity/song_url_entity.dart';

songUrlEntityFromJson(SongUrlEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<SongUrlData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new SongUrlData().fromJson(v));
		});
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> songUrlEntityToJson(SongUrlEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['code'] = entity.code;
	return data;
}

songUrlDataFromJson(SongUrlData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['br'] != null) {
		data.br = json['br']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['md5'] != null) {
		data.md5 = json['md5']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['expi'] != null) {
		data.expi = json['expi']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['gain'] != null) {
		data.gain = json['gain']?.toInt();
	}
	if (json['fee'] != null) {
		data.fee = json['fee']?.toInt();
	}
	if (json['uf'] != null) {
		data.uf = json['uf'];
	}
	if (json['payed'] != null) {
		data.payed = json['payed']?.toInt();
	}
	if (json['flag'] != null) {
		data.flag = json['flag']?.toInt();
	}
	if (json['canExtend'] != null) {
		data.canExtend = json['canExtend'];
	}
	if (json['freeTrialInfo'] != null) {
		data.freeTrialInfo = json['freeTrialInfo'];
	}
	if (json['level'] != null) {
		data.level = json['level']?.toString();
	}
	if (json['encodeType'] != null) {
		data.encodeType = json['encodeType']?.toString();
	}
	return data;
}

Map<String, dynamic> songUrlDataToJson(SongUrlData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['url'] = entity.url;
	data['br'] = entity.br;
	data['size'] = entity.size;
	data['md5'] = entity.md5;
	data['code'] = entity.code;
	data['expi'] = entity.expi;
	data['type'] = entity.type;
	data['gain'] = entity.gain;
	data['fee'] = entity.fee;
	data['uf'] = entity.uf;
	data['payed'] = entity.payed;
	data['flag'] = entity.flag;
	data['canExtend'] = entity.canExtend;
	data['freeTrialInfo'] = entity.freeTrialInfo;
	data['level'] = entity.level;
	data['encodeType'] = entity.encodeType;
	return data;
}