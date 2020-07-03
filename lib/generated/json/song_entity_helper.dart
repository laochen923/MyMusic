import 'package:mymusic/my/entity/song_entity.dart';

localSongEntityFromJson(LocalSongEntity data, Map<String, dynamic> json) {
	if (json['songs'] != null) {
		data.songs = new List<LocalSong>();
		(json['songs'] as List).forEach((v) {
			data.songs.add(new LocalSong().fromJson(v));
		});
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> localSongEntityToJson(LocalSongEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.songs != null) {
		data['songs'] =  entity.songs.map((v) => v.toJson()).toList();
	}
	data['code'] = entity.code;
	return data;
}

localSongFromJson(LocalSong data, Map<String, dynamic> json) {
	if (json['singer'] != null) {
		data.singer = json['singer']?.toString();
	}
	if (json['song'] != null) {
		data.song = json['song']?.toString();
	}
	if (json['path'] != null) {
		data.path = json['path']?.toString();
	}
	if (json['album'] != null) {
		data.album = json['album']?.toString();
	}
	if (json['duration'] != null) {
		data.duration = json['duration']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	return data;
}

Map<String, dynamic> localSongToJson(LocalSong entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['singer'] = entity.singer;
	data['song'] = entity.song;
	data['path'] = entity.path;
	data['album'] = entity.album;
	data['duration'] = entity.duration;
	data['size'] = entity.size;
	return data;
}