import 'package:mymusic/main/entity/result_single_entity.dart';

resultSingleEntityFromJson(ResultSingleEntity data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new ResultSingleResult().fromJson(json['result']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSingleEntityToJson(ResultSingleEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['code'] = entity.code;
	return data;
}

resultSingleResultFromJson(ResultSingleResult data, Map<String, dynamic> json) {
	if (json['songs'] != null) {
		data.songs = new List<ResultSingleResultSong>();
		(json['songs'] as List).forEach((v) {
			data.songs.add(new ResultSingleResultSong().fromJson(v));
		});
	}
	if (json['songCount'] != null) {
		data.songCount = json['songCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSingleResultToJson(ResultSingleResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.songs != null) {
		data['songs'] =  entity.songs.map((v) => v.toJson()).toList();
	}
	data['songCount'] = entity.songCount;
	return data;
}

resultSingleResultSongFromJson(ResultSingleResultSong data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['artists'] != null) {
		data.artists = new List<ResultSingleResultSongsArtist>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new ResultSingleResultSongsArtist().fromJson(v));
		});
	}
	if (json['album'] != null) {
		data.album = new ResultSingleResultSongsAlbum().fromJson(json['album']);
	}
	if (json['duration'] != null) {
		data.duration = json['duration']?.toInt();
	}
	if (json['copyrightId'] != null) {
		data.copyrightId = json['copyrightId']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['alias'] != null) {
		data.alias = json['alias']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['rtype'] != null) {
		data.rtype = json['rtype']?.toInt();
	}
	if (json['ftype'] != null) {
		data.ftype = json['ftype']?.toInt();
	}
	if (json['mvid'] != null) {
		data.mvid = json['mvid']?.toInt();
	}
	if (json['fee'] != null) {
		data.fee = json['fee']?.toInt();
	}
	if (json['rUrl'] != null) {
		data.rUrl = json['rUrl'];
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	if (json['al'] != null) {
		data.al = new Al().fromJson(json['al']);
	}
	if (json['ar'] != null) {
		data.ar = new List<Ar>();
		(json['ar'] as List).forEach((v) {
			data.ar.add(new Ar().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> resultSingleResultSongToJson(ResultSingleResultSong entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	if (entity.artists != null) {
		data['artists'] =  entity.artists.map((v) => v.toJson()).toList();
	}
	if (entity.album != null) {
		data['album'] = entity.album.toJson();
	}
	data['duration'] = entity.duration;
	data['copyrightId'] = entity.copyrightId;
	data['status'] = entity.status;
	data['alias'] = entity.alias;
	data['rtype'] = entity.rtype;
	data['ftype'] = entity.ftype;
	data['mvid'] = entity.mvid;
	data['fee'] = entity.fee;
	data['rUrl'] = entity.rUrl;
	data['mark'] = entity.mark;
	if (entity.al != null) {
		data['al'] = entity.al.toJson();
	}
	if (entity.ar != null) {
		data['ar'] =  entity.ar.map((v) => v.toJson()).toList();
	}
	return data;
}

alFromJson(Al data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> alToJson(Al entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['picUrl'] = entity.picUrl;
	return data;
}

arFromJson(Ar data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> arToJson(Ar entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

resultSingleResultSongsArtistFromJson(ResultSingleResultSongsArtist data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl'];
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
	if (json['img1v1'] != null) {
		data.img1v1 = json['img1v1']?.toInt();
	}
	if (json['trans'] != null) {
		data.trans = json['trans'];
	}
	return data;
}

Map<String, dynamic> resultSingleResultSongsArtistToJson(ResultSingleResultSongsArtist entity) {
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
	data['img1v1'] = entity.img1v1;
	data['trans'] = entity.trans;
	return data;
}

resultSingleResultSongsAlbumFromJson(ResultSingleResultSongsAlbum data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['artist'] != null) {
		data.artist = new ResultSingleResultSongsAlbumArtist().fromJson(json['artist']);
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['copyrightId'] != null) {
		data.copyrightId = json['copyrightId']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSingleResultSongsAlbumToJson(ResultSingleResultSongsAlbum entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	if (entity.artist != null) {
		data['artist'] = entity.artist.toJson();
	}
	data['publishTime'] = entity.publishTime;
	data['size'] = entity.size;
	data['copyrightId'] = entity.copyrightId;
	data['status'] = entity.status;
	data['picId'] = entity.picId;
	data['mark'] = entity.mark;
	return data;
}

resultSingleResultSongsAlbumArtistFromJson(ResultSingleResultSongsAlbumArtist data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl'];
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
	if (json['img1v1'] != null) {
		data.img1v1 = json['img1v1']?.toInt();
	}
	if (json['trans'] != null) {
		data.trans = json['trans'];
	}
	return data;
}

Map<String, dynamic> resultSingleResultSongsAlbumArtistToJson(ResultSingleResultSongsAlbumArtist entity) {
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
	data['img1v1'] = entity.img1v1;
	data['trans'] = entity.trans;
	return data;
}