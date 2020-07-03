import 'package:mymusic/main/entity/result_song_list_entity.dart';

resultSongListEntityFromJson(ResultSongListEntity data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new ResultSongListResult().fromJson(json['result']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSongListEntityToJson(ResultSongListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['code'] = entity.code;
	return data;
}

resultSongListResultFromJson(ResultSongListResult data, Map<String, dynamic> json) {
	if (json['playlists'] != null) {
		data.playlists = new List<ResultSongListResultPlaylist>();
		(json['playlists'] as List).forEach((v) {
			data.playlists.add(new ResultSongListResultPlaylist().fromJson(v));
		});
	}
	if (json['playlistCount'] != null) {
		data.playlistCount = json['playlistCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSongListResultToJson(ResultSongListResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.playlists != null) {
		data['playlists'] =  entity.playlists.map((v) => v.toJson()).toList();
	}
	data['playlistCount'] = entity.playlistCount;
	return data;
}

resultSongListResultPlaylistFromJson(ResultSongListResultPlaylist data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['coverImgUrl'] != null) {
		data.coverImgUrl = json['coverImgUrl']?.toString();
	}
	if (json['creator'] != null) {
		data.creator = new ResultSongListResultPlaylistsCreator().fromJson(json['creator']);
	}
	if (json['subscribed'] != null) {
		data.subscribed = json['subscribed'];
	}
	if (json['trackCount'] != null) {
		data.trackCount = json['trackCount']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['playCount'] != null) {
		data.playCount = json['playCount']?.toInt();
	}
	if (json['bookCount'] != null) {
		data.bookCount = json['bookCount']?.toInt();
	}
	if (json['officialTags'] != null) {
		data.officialTags = json['officialTags'];
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['highQuality'] != null) {
		data.highQuality = json['highQuality'];
	}
	if (json['track'] != null) {
		data.track = new ResultSongListResultPlaylistsTrack().fromJson(json['track']);
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistToJson(ResultSongListResultPlaylist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['coverImgUrl'] = entity.coverImgUrl;
	if (entity.creator != null) {
		data['creator'] = entity.creator.toJson();
	}
	data['subscribed'] = entity.subscribed;
	data['trackCount'] = entity.trackCount;
	data['userId'] = entity.userId;
	data['playCount'] = entity.playCount;
	data['bookCount'] = entity.bookCount;
	data['officialTags'] = entity.officialTags;
	data['description'] = entity.description;
	data['highQuality'] = entity.highQuality;
	if (entity.track != null) {
		data['track'] = entity.track.toJson();
	}
	data['alg'] = entity.alg;
	return data;
}

resultSongListResultPlaylistsCreatorFromJson(ResultSongListResultPlaylistsCreator data, Map<String, dynamic> json) {
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['experts'] != null) {
		data.experts = json['experts'];
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsCreatorToJson(ResultSongListResultPlaylistsCreator entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['nickname'] = entity.nickname;
	data['userId'] = entity.userId;
	data['userType'] = entity.userType;
	data['authStatus'] = entity.authStatus;
	data['expertTags'] = entity.expertTags;
	data['experts'] = entity.experts;
	return data;
}

resultSongListResultPlaylistsTrackFromJson(ResultSongListResultPlaylistsTrack data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['position'] != null) {
		data.position = json['position']?.toInt();
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['fee'] != null) {
		data.fee = json['fee']?.toInt();
	}
	if (json['copyrightId'] != null) {
		data.copyrightId = json['copyrightId']?.toInt();
	}
	if (json['disc'] != null) {
		data.disc = json['disc']?.toString();
	}
	if (json['no'] != null) {
		data.no = json['no']?.toInt();
	}
	if (json['artists'] != null) {
		data.artists = new List<ResultSongListResultPlaylistsTrackArtist>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new ResultSongListResultPlaylistsTrackArtist().fromJson(v));
		});
	}
	if (json['album'] != null) {
		data.album = new ResultSongListResultPlaylistsTrackAlbum().fromJson(json['album']);
	}
	if (json['starred'] != null) {
		data.starred = json['starred'];
	}
	if (json['popularity'] != null) {
		data.popularity = json['popularity']?.toInt();
	}
	if (json['score'] != null) {
		data.score = json['score']?.toInt();
	}
	if (json['starredNum'] != null) {
		data.starredNum = json['starredNum']?.toInt();
	}
	if (json['duration'] != null) {
		data.duration = json['duration']?.toInt();
	}
	if (json['playedNum'] != null) {
		data.playedNum = json['playedNum']?.toInt();
	}
	if (json['dayPlays'] != null) {
		data.dayPlays = json['dayPlays']?.toInt();
	}
	if (json['hearTime'] != null) {
		data.hearTime = json['hearTime']?.toInt();
	}
	if (json['ringtone'] != null) {
		data.ringtone = json['ringtone']?.toString();
	}
	if (json['crbt'] != null) {
		data.crbt = json['crbt'];
	}
	if (json['audition'] != null) {
		data.audition = json['audition'];
	}
	if (json['copyFrom'] != null) {
		data.copyFrom = json['copyFrom']?.toString();
	}
	if (json['commentThreadId'] != null) {
		data.commentThreadId = json['commentThreadId']?.toString();
	}
	if (json['rtUrl'] != null) {
		data.rtUrl = json['rtUrl'];
	}
	if (json['ftype'] != null) {
		data.ftype = json['ftype']?.toInt();
	}
	if (json['rtUrls'] != null) {
		data.rtUrls = new List<dynamic>();
		data.rtUrls.addAll(json['rtUrls']);
	}
	if (json['copyright'] != null) {
		data.copyright = json['copyright']?.toInt();
	}
	if (json['mvid'] != null) {
		data.mvid = json['mvid']?.toInt();
	}
	if (json['rtype'] != null) {
		data.rtype = json['rtype']?.toInt();
	}
	if (json['rurl'] != null) {
		data.rurl = json['rurl'];
	}
	if (json['hMusic'] != null) {
		data.hMusic = new ResultSongListResultPlaylistsTrackHMusic().fromJson(json['hMusic']);
	}
	if (json['mMusic'] != null) {
		data.mMusic = new ResultSongListResultPlaylistsTrackMMusic().fromJson(json['mMusic']);
	}
	if (json['lMusic'] != null) {
		data.lMusic = new ResultSongListResultPlaylistsTrackLMusic().fromJson(json['lMusic']);
	}
	if (json['bMusic'] != null) {
		data.bMusic = new ResultSongListResultPlaylistsTrackBMusic().fromJson(json['bMusic']);
	}
	if (json['mp3Url'] != null) {
		data.mp3Url = json['mp3Url'];
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsTrackToJson(ResultSongListResultPlaylistsTrack entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['position'] = entity.position;
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	data['status'] = entity.status;
	data['fee'] = entity.fee;
	data['copyrightId'] = entity.copyrightId;
	data['disc'] = entity.disc;
	data['no'] = entity.no;
	if (entity.artists != null) {
		data['artists'] =  entity.artists.map((v) => v.toJson()).toList();
	}
	if (entity.album != null) {
		data['album'] = entity.album.toJson();
	}
	data['starred'] = entity.starred;
	data['popularity'] = entity.popularity;
	data['score'] = entity.score;
	data['starredNum'] = entity.starredNum;
	data['duration'] = entity.duration;
	data['playedNum'] = entity.playedNum;
	data['dayPlays'] = entity.dayPlays;
	data['hearTime'] = entity.hearTime;
	data['ringtone'] = entity.ringtone;
	data['crbt'] = entity.crbt;
	data['audition'] = entity.audition;
	data['copyFrom'] = entity.copyFrom;
	data['commentThreadId'] = entity.commentThreadId;
	data['rtUrl'] = entity.rtUrl;
	data['ftype'] = entity.ftype;
	if (entity.rtUrls != null) {
		data['rtUrls'] =  [];
	}
	data['copyright'] = entity.copyright;
	data['mvid'] = entity.mvid;
	data['rtype'] = entity.rtype;
	data['rurl'] = entity.rurl;
	if (entity.hMusic != null) {
		data['hMusic'] = entity.hMusic.toJson();
	}
	if (entity.mMusic != null) {
		data['mMusic'] = entity.mMusic.toJson();
	}
	if (entity.lMusic != null) {
		data['lMusic'] = entity.lMusic.toJson();
	}
	if (entity.bMusic != null) {
		data['bMusic'] = entity.bMusic.toJson();
	}
	data['mp3Url'] = entity.mp3Url;
	return data;
}

resultSongListResultPlaylistsTrackArtistFromJson(ResultSongListResultPlaylistsTrackArtist data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['img1v1Id'] != null) {
		data.img1v1Id = json['img1v1Id']?.toInt();
	}
	if (json['briefDesc'] != null) {
		data.briefDesc = json['briefDesc']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['img1v1Url'] != null) {
		data.img1v1Url = json['img1v1Url']?.toString();
	}
	if (json['albumSize'] != null) {
		data.albumSize = json['albumSize']?.toInt();
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	if (json['trans'] != null) {
		data.trans = json['trans']?.toString();
	}
	if (json['musicSize'] != null) {
		data.musicSize = json['musicSize']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsTrackArtistToJson(ResultSongListResultPlaylistsTrackArtist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['picId'] = entity.picId;
	data['img1v1Id'] = entity.img1v1Id;
	data['briefDesc'] = entity.briefDesc;
	data['picUrl'] = entity.picUrl;
	data['img1v1Url'] = entity.img1v1Url;
	data['albumSize'] = entity.albumSize;
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	data['trans'] = entity.trans;
	data['musicSize'] = entity.musicSize;
	return data;
}

resultSongListResultPlaylistsTrackAlbumFromJson(ResultSongListResultPlaylistsTrackAlbum data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['blurPicUrl'] != null) {
		data.blurPicUrl = json['blurPicUrl']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toInt();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toInt();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toInt();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['tags'] != null) {
		data.tags = json['tags']?.toString();
	}
	if (json['company'] != null) {
		data.company = json['company'];
	}
	if (json['briefDesc'] != null) {
		data.briefDesc = json['briefDesc']?.toString();
	}
	if (json['artist'] != null) {
		data.artist = new ResultSongListResultPlaylistsTrackAlbumArtist().fromJson(json['artist']);
	}
	if (json['songs'] != null) {
		data.songs = new List<dynamic>();
		data.songs.addAll(json['songs']);
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['copyrightId'] != null) {
		data.copyrightId = json['copyrightId']?.toInt();
	}
	if (json['commentThreadId'] != null) {
		data.commentThreadId = json['commentThreadId']?.toString();
	}
	if (json['artists'] != null) {
		data.artists = new List<ResultSongListResultPlaylistsTrackAlbumArtist>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new ResultSongListResultPlaylistsTrackAlbumArtist().fromJson(v));
		});
	}
	if (json['picId_str'] != null) {
		data.picidStr = json['picId_str']?.toString();
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsTrackAlbumToJson(ResultSongListResultPlaylistsTrackAlbum entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['size'] = entity.size;
	data['picId'] = entity.picId;
	data['blurPicUrl'] = entity.blurPicUrl;
	data['companyId'] = entity.companyId;
	data['pic'] = entity.pic;
	data['picUrl'] = entity.picUrl;
	data['publishTime'] = entity.publishTime;
	data['description'] = entity.description;
	data['tags'] = entity.tags;
	data['company'] = entity.company;
	data['briefDesc'] = entity.briefDesc;
	if (entity.artist != null) {
		data['artist'] = entity.artist.toJson();
	}
	if (entity.songs != null) {
		data['songs'] =  [];
	}
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	data['status'] = entity.status;
	data['copyrightId'] = entity.copyrightId;
	data['commentThreadId'] = entity.commentThreadId;
	if (entity.artists != null) {
		data['artists'] =  entity.artists.map((v) => v.toJson()).toList();
	}
	data['picId_str'] = entity.picidStr;
	return data;
}

resultSongListResultPlaylistsTrackAlbumArtistFromJson(ResultSongListResultPlaylistsTrackAlbumArtist data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['img1v1Id'] != null) {
		data.img1v1Id = json['img1v1Id']?.toInt();
	}
	if (json['briefDesc'] != null) {
		data.briefDesc = json['briefDesc']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['img1v1Url'] != null) {
		data.img1v1Url = json['img1v1Url']?.toString();
	}
	if (json['albumSize'] != null) {
		data.albumSize = json['albumSize']?.toInt();
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	if (json['trans'] != null) {
		data.trans = json['trans']?.toString();
	}
	if (json['musicSize'] != null) {
		data.musicSize = json['musicSize']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsTrackAlbumArtistToJson(ResultSongListResultPlaylistsTrackAlbumArtist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['picId'] = entity.picId;
	data['img1v1Id'] = entity.img1v1Id;
	data['briefDesc'] = entity.briefDesc;
	data['picUrl'] = entity.picUrl;
	data['img1v1Url'] = entity.img1v1Url;
	data['albumSize'] = entity.albumSize;
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	data['trans'] = entity.trans;
	data['musicSize'] = entity.musicSize;
	return data;
}

resultSongListResultPlaylistsTrackHMusicFromJson(ResultSongListResultPlaylistsTrackHMusic data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['extension'] != null) {
		data.extension = json['extension']?.toString();
	}
	if (json['sr'] != null) {
		data.sr = json['sr']?.toInt();
	}
	if (json['dfsId'] != null) {
		data.dfsId = json['dfsId']?.toInt();
	}
	if (json['bitrate'] != null) {
		data.bitrate = json['bitrate']?.toInt();
	}
	if (json['playTime'] != null) {
		data.playTime = json['playTime']?.toInt();
	}
	if (json['volumeDelta'] != null) {
		data.volumeDelta = json['volumeDelta']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsTrackHMusicToJson(ResultSongListResultPlaylistsTrackHMusic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['size'] = entity.size;
	data['extension'] = entity.extension;
	data['sr'] = entity.sr;
	data['dfsId'] = entity.dfsId;
	data['bitrate'] = entity.bitrate;
	data['playTime'] = entity.playTime;
	data['volumeDelta'] = entity.volumeDelta;
	return data;
}

resultSongListResultPlaylistsTrackMMusicFromJson(ResultSongListResultPlaylistsTrackMMusic data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['extension'] != null) {
		data.extension = json['extension']?.toString();
	}
	if (json['sr'] != null) {
		data.sr = json['sr']?.toInt();
	}
	if (json['dfsId'] != null) {
		data.dfsId = json['dfsId']?.toInt();
	}
	if (json['bitrate'] != null) {
		data.bitrate = json['bitrate']?.toInt();
	}
	if (json['playTime'] != null) {
		data.playTime = json['playTime']?.toInt();
	}
	if (json['volumeDelta'] != null) {
		data.volumeDelta = json['volumeDelta']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsTrackMMusicToJson(ResultSongListResultPlaylistsTrackMMusic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['size'] = entity.size;
	data['extension'] = entity.extension;
	data['sr'] = entity.sr;
	data['dfsId'] = entity.dfsId;
	data['bitrate'] = entity.bitrate;
	data['playTime'] = entity.playTime;
	data['volumeDelta'] = entity.volumeDelta;
	return data;
}

resultSongListResultPlaylistsTrackLMusicFromJson(ResultSongListResultPlaylistsTrackLMusic data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['extension'] != null) {
		data.extension = json['extension']?.toString();
	}
	if (json['sr'] != null) {
		data.sr = json['sr']?.toInt();
	}
	if (json['dfsId'] != null) {
		data.dfsId = json['dfsId']?.toInt();
	}
	if (json['bitrate'] != null) {
		data.bitrate = json['bitrate']?.toInt();
	}
	if (json['playTime'] != null) {
		data.playTime = json['playTime']?.toInt();
	}
	if (json['volumeDelta'] != null) {
		data.volumeDelta = json['volumeDelta']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsTrackLMusicToJson(ResultSongListResultPlaylistsTrackLMusic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['size'] = entity.size;
	data['extension'] = entity.extension;
	data['sr'] = entity.sr;
	data['dfsId'] = entity.dfsId;
	data['bitrate'] = entity.bitrate;
	data['playTime'] = entity.playTime;
	data['volumeDelta'] = entity.volumeDelta;
	return data;
}

resultSongListResultPlaylistsTrackBMusicFromJson(ResultSongListResultPlaylistsTrackBMusic data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['extension'] != null) {
		data.extension = json['extension']?.toString();
	}
	if (json['sr'] != null) {
		data.sr = json['sr']?.toInt();
	}
	if (json['dfsId'] != null) {
		data.dfsId = json['dfsId']?.toInt();
	}
	if (json['bitrate'] != null) {
		data.bitrate = json['bitrate']?.toInt();
	}
	if (json['playTime'] != null) {
		data.playTime = json['playTime']?.toInt();
	}
	if (json['volumeDelta'] != null) {
		data.volumeDelta = json['volumeDelta']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultSongListResultPlaylistsTrackBMusicToJson(ResultSongListResultPlaylistsTrackBMusic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['size'] = entity.size;
	data['extension'] = entity.extension;
	data['sr'] = entity.sr;
	data['dfsId'] = entity.dfsId;
	data['bitrate'] = entity.bitrate;
	data['playTime'] = entity.playTime;
	data['volumeDelta'] = entity.volumeDelta;
	return data;
}