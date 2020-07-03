import 'package:mymusic/net/error_entity.dart';

errorEntityFromJson(ErrorEntity data, Map<String, dynamic> json) {
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	return data;
}

Map<String, dynamic> errorEntityToJson(ErrorEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	data['message'] = entity.message;
	return data;
}