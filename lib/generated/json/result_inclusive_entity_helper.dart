import 'package:mymusic/main/entity/result_inclusive_entity.dart';
import 'package:mymusic/main/entity/result_album_entity.dart';
import 'package:mymusic/main/entity/result_singer_entity.dart';
import 'package:mymusic/main/entity/result_single_entity.dart';
import 'package:mymusic/main/entity/result_song_list_entity.dart';
import 'package:mymusic/main/entity/result_video_entity.dart';

resultInclusiveEntityFromJson(ResultInclusiveEntity data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new ResultInclusive().fromJson(json['result']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultInclusiveEntityToJson(ResultInclusiveEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['code'] = entity.code;
	return data;
}

resultInclusiveFromJson(ResultInclusive data, Map<String, dynamic> json) {
	if (json['song'] != null) {
		data.song = new Song().fromJson(json['song']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['playList'] != null) {
		data.playList = new PlayList().fromJson(json['playList']);
	}
	if (json['artist'] != null) {
		data.artist = new Artist().fromJson(json['artist']);
	}
	if (json['album'] != null) {
		data.album = new Album().fromJson(json['album']);
	}
	if (json['video'] != null) {
		data.video = new Video().fromJson(json['video']);
	}
	return data;
}

Map<String, dynamic> resultInclusiveToJson(ResultInclusive entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.song != null) {
		data['song'] = entity.song.toJson();
	}
	data['code'] = entity.code;
	if (entity.playList != null) {
		data['playList'] = entity.playList.toJson();
	}
	if (entity.artist != null) {
		data['artist'] = entity.artist.toJson();
	}
	if (entity.album != null) {
		data['album'] = entity.album.toJson();
	}
	if (entity.video != null) {
		data['video'] = entity.video.toJson();
	}
	return data;
}

songFromJson(Song data, Map<String, dynamic> json) {
	if (json['moreText'] != null) {
		data.moreText = json['moreText']?.toString();
	}
	if (json['songs'] != null) {
		data.songs = new List<ResultSingleResultSong>();
		(json['songs'] as List).forEach((v) {
			data.songs.add(new ResultSingleResultSong().fromJson(v));
		});
	}
	if (json['more'] != null) {
		data.more = json['more'];
	}
	if (json['resourceIds'] != null) {
		data.resourceIds = json['resourceIds']?.map((v) => v?.toInt())?.toList()?.cast<int>();
	}
	return data;
}

Map<String, dynamic> songToJson(Song entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['moreText'] = entity.moreText;
	if (entity.songs != null) {
		data['songs'] =  entity.songs.map((v) => v.toJson()).toList();
	}
	data['more'] = entity.more;
	data['resourceIds'] = entity.resourceIds;
	return data;
}

playListFromJson(PlayList data, Map<String, dynamic> json) {
	if (json['moreText'] != null) {
		data.moreText = json['moreText']?.toString();
	}
	if (json['playLists'] != null) {
		data.playLists = new List<ResultSongListResultPlaylist>();
		(json['playLists'] as List).forEach((v) {
			data.playLists.add(new ResultSongListResultPlaylist().fromJson(v));
		});
	}
	if (json['more'] != null) {
		data.more = json['more'];
	}
	if (json['resourceIds'] != null) {
		data.resourceIds = json['resourceIds']?.map((v) => v?.toInt())?.toList()?.cast<int>();
	}
	return data;
}

Map<String, dynamic> playListToJson(PlayList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['moreText'] = entity.moreText;
	if (entity.playLists != null) {
		data['playLists'] =  entity.playLists.map((v) => v.toJson()).toList();
	}
	data['more'] = entity.more;
	data['resourceIds'] = entity.resourceIds;
	return data;
}

artistFromJson(Artist data, Map<String, dynamic> json) {
	if (json['moreText'] != null) {
		data.moreText = json['moreText']?.toString();
	}
	if (json['artists'] != null) {
		data.artists = new List<ResultSingerResultArtist>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new ResultSingerResultArtist().fromJson(v));
		});
	}
	if (json['more'] != null) {
		data.more = json['more'];
	}
	if (json['resourceIds'] != null) {
		data.resourceIds = json['resourceIds']?.map((v) => v?.toInt())?.toList()?.cast<int>();
	}
	return data;
}

Map<String, dynamic> artistToJson(Artist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['moreText'] = entity.moreText;
	if (entity.artists != null) {
		data['artists'] =  entity.artists.map((v) => v.toJson()).toList();
	}
	data['more'] = entity.more;
	data['resourceIds'] = entity.resourceIds;
	return data;
}

albumFromJson(Album data, Map<String, dynamic> json) {
	if (json['moreText'] != null) {
		data.moreText = json['moreText']?.toString();
	}
	if (json['albums'] != null) {
		data.albums = new List<ResultAlbumResultAlbum>();
		(json['albums'] as List).forEach((v) {
			data.albums.add(new ResultAlbumResultAlbum().fromJson(v));
		});
	}
	if (json['more'] != null) {
		data.more = json['more'];
	}
	if (json['resourceIds'] != null) {
		data.resourceIds = json['resourceIds']?.map((v) => v?.toInt())?.toList()?.cast<int>();
	}
	return data;
}

Map<String, dynamic> albumToJson(Album entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['moreText'] = entity.moreText;
	if (entity.albums != null) {
		data['albums'] =  entity.albums.map((v) => v.toJson()).toList();
	}
	data['more'] = entity.more;
	data['resourceIds'] = entity.resourceIds;
	return data;
}

videoFromJson(Video data, Map<String, dynamic> json) {
	if (json['moreText'] != null) {
		data.moreText = json['moreText']?.toString();
	}
	if (json['videos'] != null) {
		data.videos = new List<ResultVideoResultVideo>();
		(json['videos'] as List).forEach((v) {
			data.videos.add(new ResultVideoResultVideo().fromJson(v));
		});
	}
	if (json['more'] != null) {
		data.more = json['more'];
	}
	if (json['resourceIds'] != null) {
		data.resourceIds = json['resourceIds']?.map((v) => v?.toInt())?.toList()?.cast<int>();
	}
	return data;
}

Map<String, dynamic> videoToJson(Video entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['moreText'] = entity.moreText;
	if (entity.videos != null) {
		data['videos'] =  entity.videos.map((v) => v.toJson()).toList();
	}
	data['more'] = entity.more;
	data['resourceIds'] = entity.resourceIds;
	return data;
}