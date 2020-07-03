import 'package:mymusic/user/entity/count_entity.dart';

countEntityFromJson(CountEntity data, Map<String, dynamic> json) {
	if (json['programCount'] != null) {
		data.programCount = json['programCount']?.toInt();
	}
	if (json['djRadioCount'] != null) {
		data.djRadioCount = json['djRadioCount']?.toInt();
	}
	if (json['mvCount'] != null) {
		data.mvCount = json['mvCount']?.toInt();
	}
	if (json['artistCount'] != null) {
		data.artistCount = json['artistCount']?.toInt();
	}
	if (json['newProgramCount'] != null) {
		data.newProgramCount = json['newProgramCount']?.toInt();
	}
	if (json['createDjRadioCount'] != null) {
		data.createDjRadioCount = json['createDjRadioCount']?.toInt();
	}
	if (json['createdPlaylistCount'] != null) {
		data.createdPlaylistCount = json['createdPlaylistCount']?.toInt();
	}
	if (json['subPlaylistCount'] != null) {
		data.subPlaylistCount = json['subPlaylistCount']?.toInt();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> countEntityToJson(CountEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['programCount'] = entity.programCount;
	data['djRadioCount'] = entity.djRadioCount;
	data['mvCount'] = entity.mvCount;
	data['artistCount'] = entity.artistCount;
	data['newProgramCount'] = entity.newProgramCount;
	data['createDjRadioCount'] = entity.createDjRadioCount;
	data['createdPlaylistCount'] = entity.createdPlaylistCount;
	data['subPlaylistCount'] = entity.subPlaylistCount;
	data['code'] = entity.code;
	return data;
}