import 'package:mymusic/my/entity/lyric_entity.dart';

lyricEntityFromJson(LyricEntity data, Map<String, dynamic> json) {
	if (json['sgc'] != null) {
		data.sgc = json['sgc'];
	}
	if (json['sfy'] != null) {
		data.sfy = json['sfy'];
	}
	if (json['qfy'] != null) {
		data.qfy = json['qfy'];
	}
	if (json['lrc'] != null) {
		data.lrc = new LyricLrc().fromJson(json['lrc']);
	}
	if (json['klyric'] != null) {
		data.klyric = new LyricKlyric().fromJson(json['klyric']);
	}
	if (json['tlyric'] != null) {
		data.tlyric = new LyricTlyric().fromJson(json['tlyric']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> lyricEntityToJson(LyricEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['sgc'] = entity.sgc;
	data['sfy'] = entity.sfy;
	data['qfy'] = entity.qfy;
	if (entity.lrc != null) {
		data['lrc'] = entity.lrc.toJson();
	}
	if (entity.klyric != null) {
		data['klyric'] = entity.klyric.toJson();
	}
	if (entity.tlyric != null) {
		data['tlyric'] = entity.tlyric.toJson();
	}
	data['code'] = entity.code;
	return data;
}

lyricLrcFromJson(LyricLrc data, Map<String, dynamic> json) {
	if (json['version'] != null) {
		data.version = json['version']?.toInt();
	}
	if (json['lyric'] != null) {
		data.lyric = json['lyric']?.toString();
	}
	return data;
}

Map<String, dynamic> lyricLrcToJson(LyricLrc entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['version'] = entity.version;
	data['lyric'] = entity.lyric;
	return data;
}

lyricKlyricFromJson(LyricKlyric data, Map<String, dynamic> json) {
	if (json['version'] != null) {
		data.version = json['version']?.toInt();
	}
	if (json['lyric'] != null) {
		data.lyric = json['lyric']?.toString();
	}
	return data;
}

Map<String, dynamic> lyricKlyricToJson(LyricKlyric entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['version'] = entity.version;
	data['lyric'] = entity.lyric;
	return data;
}

lyricTlyricFromJson(LyricTlyric data, Map<String, dynamic> json) {
	if (json['version'] != null) {
		data.version = json['version']?.toInt();
	}
	if (json['lyric'] != null) {
		data.lyric = json['lyric'];
	}
	return data;
}

Map<String, dynamic> lyricTlyricToJson(LyricTlyric entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['version'] = entity.version;
	data['lyric'] = entity.lyric;
	return data;
}