import 'package:mymusic/my/entity/user_dj_entity.dart';

userDjEntityFromJson(UserDjEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['programs'] != null) {
		data.programs = new List<dynamic>();
		data.programs.addAll(json['programs']);
	}
	if (json['more'] != null) {
		data.more = json['more'];
	}
	return data;
}

Map<String, dynamic> userDjEntityToJson(UserDjEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['count'] = entity.count;
	if (entity.programs != null) {
		data['programs'] =  [];
	}
	data['more'] = entity.more;
	return data;
}