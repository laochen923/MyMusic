import 'package:mymusic/my/entity/play_song_entity.dart';

playSongEntityFromJson(PlaySongEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['listId'] != null) {
		data.listId = json['listId']?.toString();
	}
	if (json['seek'] != null) {
		data.seek = json['seek']?.toInt();
	}
	if (json['isPlay'] != null) {
		data.isPlay = json['isPlay'];
	}
	if (json['index'] != null) {
		data.index = json['index']?.toInt();
	}
	if (json['isLocal'] != null) {
		data.isLocal = json['isLocal'];
	}
	return data;
}

Map<String, dynamic> playSongEntityToJson(PlaySongEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['url'] = entity.url;
	data['pic'] = entity.pic;
	data['name'] = entity.name;
	data['listId'] = entity.listId;
	data['seek'] = entity.seek;
	data['isPlay'] = entity.isPlay;
	data['index'] = entity.index;
	data['isLocal'] = entity.isLocal;
	return data;
}