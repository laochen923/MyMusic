import 'package:mymusic/my/entity/personalized_dj_entity.dart';

personalizedDjEntityFromJson(PersonalizedDjEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toInt();
	}
	if (json['result'] != null) {
		data.result = new List<PersonalizedDjResult>();
		(json['result'] as List).forEach((v) {
			data.result.add(new PersonalizedDjResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> personalizedDjEntityToJson(PersonalizedDjEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['category'] = entity.category;
	if (entity.result != null) {
		data['result'] =  entity.result.map((v) => v.toJson()).toList();
	}
	return data;
}

personalizedDjResultFromJson(PersonalizedDjResult data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['copywriter'] != null) {
		data.copywriter = json['copywriter']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['canDislike'] != null) {
		data.canDislike = json['canDislike'];
	}
	if (json['trackNumberUpdateTime'] != null) {
		data.trackNumberUpdateTime = json['trackNumberUpdateTime'];
	}
	if (json['program'] != null) {
		data.program = new PersonalizedDjResultProgram().fromJson(json['program']);
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	return data;
}

Map<String, dynamic> personalizedDjResultToJson(PersonalizedDjResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['name'] = entity.name;
	data['copywriter'] = entity.copywriter;
	data['picUrl'] = entity.picUrl;
	data['canDislike'] = entity.canDislike;
	data['trackNumberUpdateTime'] = entity.trackNumberUpdateTime;
	if (entity.program != null) {
		data['program'] = entity.program.toJson();
	}
	data['alg'] = entity.alg;
	return data;
}

personalizedDjResultProgramFromJson(PersonalizedDjResultProgram data, Map<String, dynamic> json) {
	if (json['mainSong'] != null) {
		data.mainSong = new PersonalizedDjResultProgramMainSong().fromJson(json['mainSong']);
	}
	if (json['songs'] != null) {
		data.songs = json['songs'];
	}
	if (json['dj'] != null) {
		data.dj = new PersonalizedDjResultProgramDj().fromJson(json['dj']);
	}
	if (json['blurCoverUrl'] != null) {
		data.blurCoverUrl = json['blurCoverUrl']?.toString();
	}
	if (json['radio'] != null) {
		data.radio = new PersonalizedDjResultProgramRadio().fromJson(json['radio']);
	}
	if (json['subscribedCount'] != null) {
		data.subscribedCount = json['subscribedCount']?.toInt();
	}
	if (json['reward'] != null) {
		data.reward = json['reward'];
	}
	if (json['mainTrackId'] != null) {
		data.mainTrackId = json['mainTrackId']?.toInt();
	}
	if (json['serialNum'] != null) {
		data.serialNum = json['serialNum']?.toInt();
	}
	if (json['listenerCount'] != null) {
		data.listenerCount = json['listenerCount']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['coverUrl'] != null) {
		data.coverUrl = json['coverUrl']?.toString();
	}
	if (json['commentThreadId'] != null) {
		data.commentThreadId = json['commentThreadId']?.toString();
	}
	if (json['channels'] != null) {
		data.channels = new List<dynamic>();
		data.channels.addAll(json['channels']);
	}
	if (json['titbits'] != null) {
		data.titbits = json['titbits'];
	}
	if (json['titbitImages'] != null) {
		data.titbitImages = json['titbitImages'];
	}
	if (json['pubStatus'] != null) {
		data.pubStatus = json['pubStatus']?.toInt();
	}
	if (json['trackCount'] != null) {
		data.trackCount = json['trackCount']?.toInt();
	}
	if (json['bdAuditStatus'] != null) {
		data.bdAuditStatus = json['bdAuditStatus']?.toInt();
	}
	if (json['programFeeType'] != null) {
		data.programFeeType = json['programFeeType']?.toInt();
	}
	if (json['buyed'] != null) {
		data.buyed = json['buyed'];
	}
	if (json['programDesc'] != null) {
		data.programDesc = json['programDesc'];
	}
	if (json['h5Links'] != null) {
		data.h5Links = new List<dynamic>();
		data.h5Links.addAll(json['h5Links']);
	}
	if (json['coverId'] != null) {
		data.coverId = json['coverId']?.toInt();
	}
	if (json['adjustedPlayCount'] != null) {
		data.adjustedPlayCount = json['adjustedPlayCount']?.toInt();
	}
	if (json['canReward'] != null) {
		data.canReward = json['canReward'];
	}
	if (json['auditStatus'] != null) {
		data.auditStatus = json['auditStatus']?.toInt();
	}
	if (json['publish'] != null) {
		data.publish = json['publish'];
	}
	if (json['duration'] != null) {
		data.duration = json['duration']?.toInt();
	}
	if (json['shareCount'] != null) {
		data.shareCount = json['shareCount']?.toInt();
	}
	if (json['subscribed'] != null) {
		data.subscribed = json['subscribed'];
	}
	if (json['likedCount'] != null) {
		data.likedCount = json['likedCount']?.toInt();
	}
	if (json['commentCount'] != null) {
		data.commentCount = json['commentCount']?.toInt();
	}
	if (json['isPublish'] != null) {
		data.isPublish = json['isPublish'];
	}
	return data;
}

Map<String, dynamic> personalizedDjResultProgramToJson(PersonalizedDjResultProgram entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.mainSong != null) {
		data['mainSong'] = entity.mainSong.toJson();
	}
	data['songs'] = entity.songs;
	if (entity.dj != null) {
		data['dj'] = entity.dj.toJson();
	}
	data['blurCoverUrl'] = entity.blurCoverUrl;
	if (entity.radio != null) {
		data['radio'] = entity.radio.toJson();
	}
	data['subscribedCount'] = entity.subscribedCount;
	data['reward'] = entity.reward;
	data['mainTrackId'] = entity.mainTrackId;
	data['serialNum'] = entity.serialNum;
	data['listenerCount'] = entity.listenerCount;
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['createTime'] = entity.createTime;
	data['description'] = entity.description;
	data['userId'] = entity.userId;
	data['coverUrl'] = entity.coverUrl;
	data['commentThreadId'] = entity.commentThreadId;
	if (entity.channels != null) {
		data['channels'] =  [];
	}
	data['titbits'] = entity.titbits;
	data['titbitImages'] = entity.titbitImages;
	data['pubStatus'] = entity.pubStatus;
	data['trackCount'] = entity.trackCount;
	data['bdAuditStatus'] = entity.bdAuditStatus;
	data['programFeeType'] = entity.programFeeType;
	data['buyed'] = entity.buyed;
	data['programDesc'] = entity.programDesc;
	if (entity.h5Links != null) {
		data['h5Links'] =  [];
	}
	data['coverId'] = entity.coverId;
	data['adjustedPlayCount'] = entity.adjustedPlayCount;
	data['canReward'] = entity.canReward;
	data['auditStatus'] = entity.auditStatus;
	data['publish'] = entity.publish;
	data['duration'] = entity.duration;
	data['shareCount'] = entity.shareCount;
	data['subscribed'] = entity.subscribed;
	data['likedCount'] = entity.likedCount;
	data['commentCount'] = entity.commentCount;
	data['isPublish'] = entity.isPublish;
	return data;
}

personalizedDjResultProgramMainSongFromJson(PersonalizedDjResultProgramMainSong data, Map<String, dynamic> json) {
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
		data.artists = new List<PersonalizedDjResultProgramMainSongArtist>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new PersonalizedDjResultProgramMainSongArtist().fromJson(v));
		});
	}
	if (json['album'] != null) {
		data.album = new PersonalizedDjResultProgramMainSongAlbum().fromJson(json['album']);
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
	if (json['noCopyrightRcmd'] != null) {
		data.noCopyrightRcmd = json['noCopyrightRcmd'];
	}
	if (json['mvid'] != null) {
		data.mvid = json['mvid']?.toInt();
	}
	if (json['bMusic'] != null) {
		data.bMusic = new PersonalizedDjResultProgramMainSongBMusic().fromJson(json['bMusic']);
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
	if (json['hMusic'] != null) {
		data.hMusic = new PersonalizedDjResultProgramMainSongHMusic().fromJson(json['hMusic']);
	}
	if (json['mMusic'] != null) {
		data.mMusic = json['mMusic'];
	}
	if (json['lMusic'] != null) {
		data.lMusic = new PersonalizedDjResultProgramMainSongLMusic().fromJson(json['lMusic']);
	}
	return data;
}

Map<String, dynamic> personalizedDjResultProgramMainSongToJson(PersonalizedDjResultProgramMainSong entity) {
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
	data['noCopyrightRcmd'] = entity.noCopyrightRcmd;
	data['mvid'] = entity.mvid;
	if (entity.bMusic != null) {
		data['bMusic'] = entity.bMusic.toJson();
	}
	data['mp3Url'] = entity.mp3Url;
	data['rtype'] = entity.rtype;
	data['rurl'] = entity.rurl;
	if (entity.hMusic != null) {
		data['hMusic'] = entity.hMusic.toJson();
	}
	data['mMusic'] = entity.mMusic;
	if (entity.lMusic != null) {
		data['lMusic'] = entity.lMusic.toJson();
	}
	return data;
}

personalizedDjResultProgramMainSongArtistFromJson(PersonalizedDjResultProgramMainSongArtist data, Map<String, dynamic> json) {
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

Map<String, dynamic> personalizedDjResultProgramMainSongArtistToJson(PersonalizedDjResultProgramMainSongArtist entity) {
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

personalizedDjResultProgramMainSongAlbumFromJson(PersonalizedDjResultProgramMainSongAlbum data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type'];
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['blurPicUrl'] != null) {
		data.blurPicUrl = json['blurPicUrl'];
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
		data.artist = new PersonalizedDjResultProgramMainSongAlbumArtist().fromJson(json['artist']);
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
		data.artists = new List<PersonalizedDjResultProgramMainSongAlbumArtist>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new PersonalizedDjResultProgramMainSongAlbumArtist().fromJson(v));
		});
	}
	if (json['subType'] != null) {
		data.subType = json['subType'];
	}
	if (json['transName'] != null) {
		data.transName = json['transName'];
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	return data;
}

Map<String, dynamic> personalizedDjResultProgramMainSongAlbumToJson(PersonalizedDjResultProgramMainSongAlbum entity) {
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
	data['subType'] = entity.subType;
	data['transName'] = entity.transName;
	data['mark'] = entity.mark;
	return data;
}

personalizedDjResultProgramMainSongAlbumArtistFromJson(PersonalizedDjResultProgramMainSongAlbumArtist data, Map<String, dynamic> json) {
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

Map<String, dynamic> personalizedDjResultProgramMainSongAlbumArtistToJson(PersonalizedDjResultProgramMainSongAlbumArtist entity) {
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

personalizedDjResultProgramMainSongBMusicFromJson(PersonalizedDjResultProgramMainSongBMusic data, Map<String, dynamic> json) {
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

Map<String, dynamic> personalizedDjResultProgramMainSongBMusicToJson(PersonalizedDjResultProgramMainSongBMusic entity) {
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

personalizedDjResultProgramMainSongHMusicFromJson(PersonalizedDjResultProgramMainSongHMusic data, Map<String, dynamic> json) {
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

Map<String, dynamic> personalizedDjResultProgramMainSongHMusicToJson(PersonalizedDjResultProgramMainSongHMusic entity) {
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

personalizedDjResultProgramMainSongLMusicFromJson(PersonalizedDjResultProgramMainSongLMusic data, Map<String, dynamic> json) {
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

Map<String, dynamic> personalizedDjResultProgramMainSongLMusicToJson(PersonalizedDjResultProgramMainSongLMusic entity) {
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

personalizedDjResultProgramDjFromJson(PersonalizedDjResultProgramDj data, Map<String, dynamic> json) {
	if (json['defaultAvatar'] != null) {
		data.defaultAvatar = json['defaultAvatar'];
	}
	if (json['province'] != null) {
		data.province = json['province']?.toInt();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toInt();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['detailDescription'] != null) {
		data.detailDescription = json['detailDescription']?.toString();
	}
	if (json['avatarImgId'] != null) {
		data.avatarImgId = json['avatarImgId']?.toInt();
	}
	if (json['backgroundImgId'] != null) {
		data.backgroundImgId = json['backgroundImgId']?.toInt();
	}
	if (json['backgroundUrl'] != null) {
		data.backgroundUrl = json['backgroundUrl']?.toString();
	}
	if (json['authority'] != null) {
		data.authority = json['authority']?.toInt();
	}
	if (json['mutual'] != null) {
		data.mutual = json['mutual'];
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['experts'] != null) {
		data.experts = new PersonalizedDjResultProgramDjExperts().fromJson(json['experts']);
	}
	if (json['djStatus'] != null) {
		data.djStatus = json['djStatus']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['remarkName'] != null) {
		data.remarkName = json['remarkName'];
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['avatarImgId_str'] != null) {
		data.avatarimgidStr = json['avatarImgId_str']?.toString();
	}
	if (json['brand'] != null) {
		data.brand = json['brand']?.toString();
	}
	return data;
}

Map<String, dynamic> personalizedDjResultProgramDjToJson(PersonalizedDjResultProgramDj entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['defaultAvatar'] = entity.defaultAvatar;
	data['province'] = entity.province;
	data['authStatus'] = entity.authStatus;
	data['followed'] = entity.followed;
	data['avatarUrl'] = entity.avatarUrl;
	data['accountStatus'] = entity.accountStatus;
	data['gender'] = entity.gender;
	data['city'] = entity.city;
	data['birthday'] = entity.birthday;
	data['userId'] = entity.userId;
	data['userType'] = entity.userType;
	data['nickname'] = entity.nickname;
	data['signature'] = entity.signature;
	data['description'] = entity.description;
	data['detailDescription'] = entity.detailDescription;
	data['avatarImgId'] = entity.avatarImgId;
	data['backgroundImgId'] = entity.backgroundImgId;
	data['backgroundUrl'] = entity.backgroundUrl;
	data['authority'] = entity.authority;
	data['mutual'] = entity.mutual;
	data['expertTags'] = entity.expertTags;
	if (entity.experts != null) {
		data['experts'] = entity.experts.toJson();
	}
	data['djStatus'] = entity.djStatus;
	data['vipType'] = entity.vipType;
	data['remarkName'] = entity.remarkName;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['avatarImgId_str'] = entity.avatarimgidStr;
	data['brand'] = entity.brand;
	return data;
}

personalizedDjResultProgramDjExpertsFromJson(PersonalizedDjResultProgramDjExperts data, Map<String, dynamic> json) {
	if (json['1'] != null) {
		data.x1 = json['1']?.toString();
	}
	return data;
}

Map<String, dynamic> personalizedDjResultProgramDjExpertsToJson(PersonalizedDjResultProgramDjExperts entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	return data;
}

personalizedDjResultProgramRadioFromJson(PersonalizedDjResultProgramRadio data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['dj'] != null) {
		data.dj = json['dj'];
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['subCount'] != null) {
		data.subCount = json['subCount']?.toInt();
	}
	if (json['programCount'] != null) {
		data.programCount = json['programCount']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['categoryId'] != null) {
		data.categoryId = json['categoryId']?.toInt();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['radioFeeType'] != null) {
		data.radioFeeType = json['radioFeeType']?.toInt();
	}
	if (json['feeScope'] != null) {
		data.feeScope = json['feeScope']?.toInt();
	}
	if (json['buyed'] != null) {
		data.buyed = json['buyed'];
	}
	if (json['videos'] != null) {
		data.videos = json['videos'];
	}
	if (json['finished'] != null) {
		data.finished = json['finished'];
	}
	if (json['underShelf'] != null) {
		data.underShelf = json['underShelf'];
	}
	if (json['purchaseCount'] != null) {
		data.purchaseCount = json['purchaseCount']?.toInt();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toInt();
	}
	if (json['originalPrice'] != null) {
		data.originalPrice = json['originalPrice']?.toInt();
	}
	if (json['discountPrice'] != null) {
		data.discountPrice = json['discountPrice'];
	}
	if (json['lastProgramCreateTime'] != null) {
		data.lastProgramCreateTime = json['lastProgramCreateTime']?.toInt();
	}
	if (json['lastProgramName'] != null) {
		data.lastProgramName = json['lastProgramName'];
	}
	if (json['lastProgramId'] != null) {
		data.lastProgramId = json['lastProgramId']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['rcmdText'] != null) {
		data.rcmdText = json['rcmdText']?.toString();
	}
	if (json['hightQuality'] != null) {
		data.hightQuality = json['hightQuality'];
	}
	if (json['whiteList'] != null) {
		data.whiteList = json['whiteList'];
	}
	if (json['composeVideo'] != null) {
		data.composeVideo = json['composeVideo'];
	}
	if (json['subed'] != null) {
		data.subed = json['subed'];
	}
	return data;
}

Map<String, dynamic> personalizedDjResultProgramRadioToJson(PersonalizedDjResultProgramRadio entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['dj'] = entity.dj;
	data['name'] = entity.name;
	data['picUrl'] = entity.picUrl;
	data['desc'] = entity.desc;
	data['subCount'] = entity.subCount;
	data['programCount'] = entity.programCount;
	data['createTime'] = entity.createTime;
	data['categoryId'] = entity.categoryId;
	data['category'] = entity.category;
	data['radioFeeType'] = entity.radioFeeType;
	data['feeScope'] = entity.feeScope;
	data['buyed'] = entity.buyed;
	data['videos'] = entity.videos;
	data['finished'] = entity.finished;
	data['underShelf'] = entity.underShelf;
	data['purchaseCount'] = entity.purchaseCount;
	data['price'] = entity.price;
	data['originalPrice'] = entity.originalPrice;
	data['discountPrice'] = entity.discountPrice;
	data['lastProgramCreateTime'] = entity.lastProgramCreateTime;
	data['lastProgramName'] = entity.lastProgramName;
	data['lastProgramId'] = entity.lastProgramId;
	data['picId'] = entity.picId;
	data['rcmdText'] = entity.rcmdText;
	data['hightQuality'] = entity.hightQuality;
	data['whiteList'] = entity.whiteList;
	data['composeVideo'] = entity.composeVideo;
	data['subed'] = entity.subed;
	return data;
}