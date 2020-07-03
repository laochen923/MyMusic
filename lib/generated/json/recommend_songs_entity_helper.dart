import 'package:mymusic/discover/entity/recommend_songs_entity.dart';

recommendSongsEntityFromJson(RecommendSongsEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['recommend'] != null) {
		data.recommend = new List<SongsRecommend>();
		(json['recommend'] as List).forEach((v) {
			data.recommend.add(new SongsRecommend().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> recommendSongsEntityToJson(RecommendSongsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	if (entity.recommend != null) {
		data['recommend'] =  entity.recommend.map((v) => v.toJson()).toList();
	}
	return data;
}

songsRecommendFromJson(SongsRecommend data, Map<String, dynamic> json) {
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
		data.artists = new List<SongsRecommendArtists>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new SongsRecommendArtists().fromJson(v));
		});
	}
	if (json['album'] != null) {
		data.album = new SongsRecommendAlbum().fromJson(json['album']);
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
		data.ringtone = json['ringtone'];
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
	if (json['transName'] != null) {
		data.transName = json['transName'];
	}
	if (json['sign'] != null) {
		data.sign = json['sign'];
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	if (json['hMusic'] != null) {
		data.hMusic = new SongsRecommendHMusic().fromJson(json['hMusic']);
	}
	if (json['mMusic'] != null) {
		data.mMusic = new SongsRecommendMMusic().fromJson(json['mMusic']);
	}
	if (json['lMusic'] != null) {
		data.lMusic = new SongsRecommendLMusic().fromJson(json['lMusic']);
	}
	if (json['bMusic'] != null) {
		data.bMusic = new SongsRecommendBMusic().fromJson(json['bMusic']);
	}
	if (json['mvid'] != null) {
		data.mvid = json['mvid']?.toInt();
	}
	if (json['mp3Url'] != null) {
		data.mp3Url = json['mp3Url'];
	}
	if (json['rtype'] != null) {
		data.rtype = json['rtype']?.toInt();
	}
	if (json['rurl'] != null) {
		data.rurl = json['rurl'];
	}
	if (json['reason'] != null) {
		data.reason = json['reason']?.toString();
	}
	if (json['privilege'] != null) {
		data.privilege = new SongsRecommendPrivilege().fromJson(json['privilege']);
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	return data;
}

Map<String, dynamic> songsRecommendToJson(SongsRecommend entity) {
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
	data['transName'] = entity.transName;
	data['sign'] = entity.sign;
	data['mark'] = entity.mark;
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
	data['mvid'] = entity.mvid;
	data['mp3Url'] = entity.mp3Url;
	data['rtype'] = entity.rtype;
	data['rurl'] = entity.rurl;
	data['reason'] = entity.reason;
	if (entity.privilege != null) {
		data['privilege'] = entity.privilege.toJson();
	}
	data['alg'] = entity.alg;
	return data;
}

songsRecommendArtistsFromJson(SongsRecommendArtists data, Map<String, dynamic> json) {
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
	if (json['topicPerson'] != null) {
		data.topicPerson = json['topicPerson']?.toInt();
	}
	return data;
}

Map<String, dynamic> songsRecommendArtistsToJson(SongsRecommendArtists entity) {
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
	data['topicPerson'] = entity.topicPerson;
	return data;
}

songsRecommendAlbumFromJson(SongsRecommendAlbum data, Map<String, dynamic> json) {
	if (json['algnalgame'] != null) {
		data.algnalgame = json['algnalgame']?.toString();
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
		data.company = json['company']?.toString();
	}
	if (json['briefDesc'] != null) {
		data.briefDesc = json['briefDesc']?.toString();
	}
	if (json['artist'] != null) {
		data.artist = new SongsRecommendAlbumArtist().fromJson(json['artist']);
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
		data.artists = new List<SongsRecommendAlbumArtists>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new SongsRecommendAlbumArtists().fromJson(v));
		});
	}
	if (json['subType'] != null) {
		data.subType = json['subType']?.toString();
	}
	if (json['transName'] != null) {
		data.transName = json['transName'];
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	return data;
}

Map<String, dynamic> songsRecommendAlbumToJson(SongsRecommendAlbum entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['algnalgame'] = entity.algnalgame;
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
	data['subType'] = entity.subType;
	data['transName'] = entity.transName;
	data['mark'] = entity.mark;
	return data;
}

songsRecommendAlbumArtistFromJson(SongsRecommendAlbumArtist data, Map<String, dynamic> json) {
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
	if (json['topicPerson'] != null) {
		data.topicPerson = json['topicPerson']?.toInt();
	}
	return data;
}

Map<String, dynamic> songsRecommendAlbumArtistToJson(SongsRecommendAlbumArtist entity) {
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
	data['topicPerson'] = entity.topicPerson;
	return data;
}

songsRecommendAlbumArtistsFromJson(SongsRecommendAlbumArtists data, Map<String, dynamic> json) {
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
	if (json['topicPerson'] != null) {
		data.topicPerson = json['topicPerson']?.toInt();
	}
	return data;
}

Map<String, dynamic> songsRecommendAlbumArtistsToJson(SongsRecommendAlbumArtists entity) {
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
	data['topicPerson'] = entity.topicPerson;
	return data;
}

songsRecommendHMusicFromJson(SongsRecommendHMusic data, Map<String, dynamic> json) {
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

Map<String, dynamic> songsRecommendHMusicToJson(SongsRecommendHMusic entity) {
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

songsRecommendMMusicFromJson(SongsRecommendMMusic data, Map<String, dynamic> json) {
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

Map<String, dynamic> songsRecommendMMusicToJson(SongsRecommendMMusic entity) {
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

songsRecommendLMusicFromJson(SongsRecommendLMusic data, Map<String, dynamic> json) {
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

Map<String, dynamic> songsRecommendLMusicToJson(SongsRecommendLMusic entity) {
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

songsRecommendBMusicFromJson(SongsRecommendBMusic data, Map<String, dynamic> json) {
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

Map<String, dynamic> songsRecommendBMusicToJson(SongsRecommendBMusic entity) {
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

songsRecommendPrivilegeFromJson(SongsRecommendPrivilege data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['fee'] != null) {
		data.fee = json['fee']?.toInt();
	}
	if (json['payed'] != null) {
		data.payed = json['payed']?.toInt();
	}
	if (json['st'] != null) {
		data.st = json['st']?.toInt();
	}
	if (json['pl'] != null) {
		data.pl = json['pl']?.toInt();
	}
	if (json['dl'] != null) {
		data.dl = json['dl']?.toInt();
	}
	if (json['sp'] != null) {
		data.sp = json['sp']?.toInt();
	}
	if (json['cp'] != null) {
		data.cp = json['cp']?.toInt();
	}
	if (json['subp'] != null) {
		data.subp = json['subp']?.toInt();
	}
	if (json['cs'] != null) {
		data.cs = json['cs'];
	}
	if (json['maxbr'] != null) {
		data.maxbr = json['maxbr']?.toInt();
	}
	if (json['fl'] != null) {
		data.fl = json['fl']?.toInt();
	}
	if (json['toast'] != null) {
		data.toast = json['toast'];
	}
	if (json['flag'] != null) {
		data.flag = json['flag']?.toInt();
	}
	if (json['preSell'] != null) {
		data.preSell = json['preSell'];
	}
	return data;
}

Map<String, dynamic> songsRecommendPrivilegeToJson(SongsRecommendPrivilege entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['fee'] = entity.fee;
	data['payed'] = entity.payed;
	data['st'] = entity.st;
	data['pl'] = entity.pl;
	data['dl'] = entity.dl;
	data['sp'] = entity.sp;
	data['cp'] = entity.cp;
	data['subp'] = entity.subp;
	data['cs'] = entity.cs;
	data['maxbr'] = entity.maxbr;
	data['fl'] = entity.fl;
	data['toast'] = entity.toast;
	data['flag'] = entity.flag;
	data['preSell'] = entity.preSell;
	return data;
}