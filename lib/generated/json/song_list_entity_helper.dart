import 'package:mymusic/my/entity/song_list_entity.dart';

songListEntityFromJson(SongListEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['relatedVideos'] != null) {
		data.relatedVideos = json['relatedVideos'];
	}
	if (json['playlist'] != null) {
		data.playlist = new SongListPlaylist().fromJson(json['playlist']);
	}
	if (json['urls'] != null) {
		data.urls = json['urls'];
	}
	if (json['privileges'] != null) {
		data.privileges = new List<SongListPrivilege>();
		(json['privileges'] as List).forEach((v) {
			data.privileges.add(new SongListPrivilege().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> songListEntityToJson(SongListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['relatedVideos'] = entity.relatedVideos;
	if (entity.playlist != null) {
		data['playlist'] = entity.playlist.toJson();
	}
	data['urls'] = entity.urls;
	if (entity.privileges != null) {
		data['privileges'] =  entity.privileges.map((v) => v.toJson()).toList();
	}
	return data;
}

songListPlaylistFromJson(SongListPlaylist data, Map<String, dynamic> json) {
	if (json['subscribers'] != null) {
		data.subscribers = new List<dynamic>();
		data.subscribers.addAll(json['subscribers']);
	}
	if (json['subscribed'] != null) {
		data.subscribed = json['subscribed'];
	}
	if (json['creator'] != null) {
		data.creator = new SongListPlaylistCreator().fromJson(json['creator']);
	}
	if (json['tracks'] != null) {
		data.tracks = new List<SongListPlaylistTrack>();
		(json['tracks'] as List).forEach((v) {
			data.tracks.add(new SongListPlaylistTrack().fromJson(v));
		});
	}
	if (json['trackIds'] != null) {
		data.trackIds = new List<SongListPlaylistTrackId>();
		(json['trackIds'] as List).forEach((v) {
			data.trackIds.add(new SongListPlaylistTrackId().fromJson(v));
		});
	}
	if (json['updateFrequency'] != null) {
		data.updateFrequency = json['updateFrequency'];
	}
	if (json['backgroundCoverId'] != null) {
		data.backgroundCoverId = json['backgroundCoverId']?.toInt();
	}
	if (json['backgroundCoverUrl'] != null) {
		data.backgroundCoverUrl = json['backgroundCoverUrl'];
	}
	if (json['titleImage'] != null) {
		data.titleImage = json['titleImage']?.toInt();
	}
	if (json['titleImageUrl'] != null) {
		data.titleImageUrl = json['titleImageUrl'];
	}
	if (json['englishTitle'] != null) {
		data.englishTitle = json['englishTitle'];
	}
	if (json['opRecommend'] != null) {
		data.opRecommend = json['opRecommend'];
	}
	if (json['ordered'] != null) {
		data.ordered = json['ordered'];
	}
	if (json['description'] != null) {
		data.description = json['description'];
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['specialType'] != null) {
		data.specialType = json['specialType']?.toInt();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toInt();
	}
	if (json['commentThreadId'] != null) {
		data.commentThreadId = json['commentThreadId']?.toString();
	}
	if (json['privacy'] != null) {
		data.privacy = json['privacy']?.toInt();
	}
	if (json['trackUpdateTime'] != null) {
		data.trackUpdateTime = json['trackUpdateTime']?.toInt();
	}
	if (json['trackCount'] != null) {
		data.trackCount = json['trackCount']?.toInt();
	}
	if (json['coverImgUrl'] != null) {
		data.coverImgUrl = json['coverImgUrl']?.toString();
	}
	if (json['playCount'] != null) {
		data.playCount = json['playCount']?.toInt();
	}
	if (json['trackNumberUpdateTime'] != null) {
		data.trackNumberUpdateTime = json['trackNumberUpdateTime']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['tags'] != null) {
		data.tags = new List<dynamic>();
		data.tags.addAll(json['tags']);
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['highQuality'] != null) {
		data.highQuality = json['highQuality'];
	}
	if (json['adType'] != null) {
		data.adType = json['adType']?.toInt();
	}
	if (json['coverImgId'] != null) {
		data.coverImgId = json['coverImgId']?.toInt();
	}
	if (json['newImported'] != null) {
		data.newImported = json['newImported'];
	}
	if (json['subscribedCount'] != null) {
		data.subscribedCount = json['subscribedCount']?.toInt();
	}
	if (json['cloudTrackCount'] != null) {
		data.cloudTrackCount = json['cloudTrackCount']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['shareCount'] != null) {
		data.shareCount = json['shareCount']?.toInt();
	}
	if (json['coverImgId_str'] != null) {
		data.coverimgidStr = json['coverImgId_str']?.toString();
	}
	if (json['commentCount'] != null) {
		data.commentCount = json['commentCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> songListPlaylistToJson(SongListPlaylist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.subscribers != null) {
		data['subscribers'] =  [];
	}
	data['subscribed'] = entity.subscribed;
	if (entity.creator != null) {
		data['creator'] = entity.creator.toJson();
	}
	if (entity.tracks != null) {
		data['tracks'] =  entity.tracks.map((v) => v.toJson()).toList();
	}
	if (entity.trackIds != null) {
		data['trackIds'] =  entity.trackIds.map((v) => v.toJson()).toList();
	}
	data['updateFrequency'] = entity.updateFrequency;
	data['backgroundCoverId'] = entity.backgroundCoverId;
	data['backgroundCoverUrl'] = entity.backgroundCoverUrl;
	data['titleImage'] = entity.titleImage;
	data['titleImageUrl'] = entity.titleImageUrl;
	data['englishTitle'] = entity.englishTitle;
	data['opRecommend'] = entity.opRecommend;
	data['ordered'] = entity.ordered;
	data['description'] = entity.description;
	data['userId'] = entity.userId;
	data['specialType'] = entity.specialType;
	data['updateTime'] = entity.updateTime;
	data['commentThreadId'] = entity.commentThreadId;
	data['privacy'] = entity.privacy;
	data['trackUpdateTime'] = entity.trackUpdateTime;
	data['trackCount'] = entity.trackCount;
	data['coverImgUrl'] = entity.coverImgUrl;
	data['playCount'] = entity.playCount;
	data['trackNumberUpdateTime'] = entity.trackNumberUpdateTime;
	data['status'] = entity.status;
	if (entity.tags != null) {
		data['tags'] =  [];
	}
	data['createTime'] = entity.createTime;
	data['highQuality'] = entity.highQuality;
	data['adType'] = entity.adType;
	data['coverImgId'] = entity.coverImgId;
	data['newImported'] = entity.newImported;
	data['subscribedCount'] = entity.subscribedCount;
	data['cloudTrackCount'] = entity.cloudTrackCount;
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['shareCount'] = entity.shareCount;
	data['coverImgId_str'] = entity.coverimgidStr;
	data['commentCount'] = entity.commentCount;
	return data;
}

songListPlaylistCreatorFromJson(SongListPlaylistCreator data, Map<String, dynamic> json) {
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
		data.experts = json['experts'];
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
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['avatarImgId_str'] != null) {
		data.avatarimgidStr = json['avatarImgId_str']?.toString();
	}
	return data;
}

Map<String, dynamic> songListPlaylistCreatorToJson(SongListPlaylistCreator entity) {
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
	data['experts'] = entity.experts;
	data['djStatus'] = entity.djStatus;
	data['vipType'] = entity.vipType;
	data['remarkName'] = entity.remarkName;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['avatarImgId_str'] = entity.avatarimgidStr;
	return data;
}

songListPlaylistTrackFromJson(SongListPlaylistTrack data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['pst'] != null) {
		data.pst = json['pst']?.toInt();
	}
	if (json['t'] != null) {
		data.t = json['t']?.toInt();
	}
	if (json['ar'] != null) {
		data.ar = new List<SongListPlaylistTracksAr>();
		(json['ar'] as List).forEach((v) {
			data.ar.add(new SongListPlaylistTracksAr().fromJson(v));
		});
	}
	if (json['alia'] != null) {
		data.alia = new List<dynamic>();
		data.alia.addAll(json['alia']);
	}
	if (json['pop'] != null) {
		data.pop = json['pop']?.toInt();
	}
	if (json['st'] != null) {
		data.st = json['st']?.toInt();
	}
	if (json['rt'] != null) {
		data.rt = json['rt'];
	}
	if (json['fee'] != null) {
		data.fee = json['fee']?.toInt();
	}
	if (json['v'] != null) {
		data.v = json['v']?.toInt();
	}
	if (json['crbt'] != null) {
		data.crbt = json['crbt'];
	}
	if (json['cf'] != null) {
		data.cf = json['cf']?.toString();
	}
	if (json['al'] != null) {
		data.al = new SongListPlaylistTracksAl().fromJson(json['al']);
	}
	if (json['dt'] != null) {
		data.dt = json['dt']?.toInt();
	}
	if (json['h'] != null) {
		data.h = new SongListPlaylistTracksH().fromJson(json['h']);
	}
	if (json['m'] != null) {
		data.m = new SongListPlaylistTracksM().fromJson(json['m']);
	}
	if (json['l'] != null) {
		data.l = new SongListPlaylistTracksL().fromJson(json['l']);
	}
	if (json['a'] != null) {
		data.a = json['a'];
	}
	if (json['cd'] != null) {
		data.cd = json['cd']?.toString();
	}
	if (json['no'] != null) {
		data.no = json['no']?.toInt();
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
	if (json['djId'] != null) {
		data.djId = json['djId']?.toInt();
	}
	if (json['copyright'] != null) {
		data.copyright = json['copyright']?.toInt();
	}
	if (json['s_id'] != null) {
		data.sId = json['s_id']?.toInt();
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	if (json['rtype'] != null) {
		data.rtype = json['rtype']?.toInt();
	}
	if (json['rurl'] != null) {
		data.rurl = json['rurl'];
	}
	if (json['mst'] != null) {
		data.mst = json['mst']?.toInt();
	}
	if (json['cp'] != null) {
		data.cp = json['cp']?.toInt();
	}
	if (json['mv'] != null) {
		data.mv = json['mv']?.toInt();
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toInt();
	}
	if (json['isSelected'] != null) {
		data.isSelected = json['isSelected'];
	}
	return data;
}

Map<String, dynamic> songListPlaylistTrackToJson(SongListPlaylistTrack entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['pst'] = entity.pst;
	data['t'] = entity.t;
	if (entity.ar != null) {
		data['ar'] =  entity.ar.map((v) => v.toJson()).toList();
	}
	if (entity.alia != null) {
		data['alia'] =  [];
	}
	data['pop'] = entity.pop;
	data['st'] = entity.st;
	data['rt'] = entity.rt;
	data['fee'] = entity.fee;
	data['v'] = entity.v;
	data['crbt'] = entity.crbt;
	data['cf'] = entity.cf;
	if (entity.al != null) {
		data['al'] = entity.al.toJson();
	}
	data['dt'] = entity.dt;
	if (entity.h != null) {
		data['h'] = entity.h.toJson();
	}
	if (entity.m != null) {
		data['m'] = entity.m.toJson();
	}
	if (entity.l != null) {
		data['l'] = entity.l.toJson();
	}
	data['a'] = entity.a;
	data['cd'] = entity.cd;
	data['no'] = entity.no;
	data['rtUrl'] = entity.rtUrl;
	data['ftype'] = entity.ftype;
	if (entity.rtUrls != null) {
		data['rtUrls'] =  [];
	}
	data['djId'] = entity.djId;
	data['copyright'] = entity.copyright;
	data['s_id'] = entity.sId;
	data['mark'] = entity.mark;
	data['rtype'] = entity.rtype;
	data['rurl'] = entity.rurl;
	data['mst'] = entity.mst;
	data['cp'] = entity.cp;
	data['mv'] = entity.mv;
	data['publishTime'] = entity.publishTime;
	data['isSelected'] = entity.isSelected;
	return data;
}

songListPlaylistTracksArFromJson(SongListPlaylistTracksAr data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['tns'] != null) {
		data.tns = new List<dynamic>();
		data.tns.addAll(json['tns']);
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	return data;
}

Map<String, dynamic> songListPlaylistTracksArToJson(SongListPlaylistTracksAr entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	if (entity.tns != null) {
		data['tns'] =  [];
	}
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	return data;
}

songListPlaylistTracksAlFromJson(SongListPlaylistTracksAl data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['tns'] != null) {
		data.tns = new List<dynamic>();
		data.tns.addAll(json['tns']);
	}
	if (json['pic_str'] != null) {
		data.picStr = json['pic_str']?.toString();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toInt();
	}
	return data;
}

Map<String, dynamic> songListPlaylistTracksAlToJson(SongListPlaylistTracksAl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['picUrl'] = entity.picUrl;
	if (entity.tns != null) {
		data['tns'] =  [];
	}
	data['pic_str'] = entity.picStr;
	data['pic'] = entity.pic;
	return data;
}

songListPlaylistTracksHFromJson(SongListPlaylistTracksH data, Map<String, dynamic> json) {
	if (json['br'] != null) {
		data.br = json['br']?.toInt();
	}
	if (json['fid'] != null) {
		data.fid = json['fid']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['vd'] != null) {
		data.vd = json['vd']?.toInt();
	}
	return data;
}

Map<String, dynamic> songListPlaylistTracksHToJson(SongListPlaylistTracksH entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

songListPlaylistTracksMFromJson(SongListPlaylistTracksM data, Map<String, dynamic> json) {
	if (json['br'] != null) {
		data.br = json['br']?.toInt();
	}
	if (json['fid'] != null) {
		data.fid = json['fid']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['vd'] != null) {
		data.vd = json['vd']?.toInt();
	}
	return data;
}

Map<String, dynamic> songListPlaylistTracksMToJson(SongListPlaylistTracksM entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

songListPlaylistTracksLFromJson(SongListPlaylistTracksL data, Map<String, dynamic> json) {
	if (json['br'] != null) {
		data.br = json['br']?.toInt();
	}
	if (json['fid'] != null) {
		data.fid = json['fid']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['vd'] != null) {
		data.vd = json['vd']?.toInt();
	}
	return data;
}

Map<String, dynamic> songListPlaylistTracksLToJson(SongListPlaylistTracksL entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

songListPlaylistTrackIdFromJson(SongListPlaylistTrackId data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['v'] != null) {
		data.v = json['v']?.toInt();
	}
	if (json['alg'] != null) {
		data.alg = json['alg'];
	}
	return data;
}

Map<String, dynamic> songListPlaylistTrackIdToJson(SongListPlaylistTrackId entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['v'] = entity.v;
	data['alg'] = entity.alg;
	return data;
}

songListPrivilegeFromJson(SongListPrivilege data, Map<String, dynamic> json) {
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

Map<String, dynamic> songListPrivilegeToJson(SongListPrivilege entity) {
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