import 'package:mymusic/user/entity/user_play_list_entity.dart';

userPlayListEntityFromJson(UserPlayListEntity data, Map<String, dynamic> json) {
	if (json['more'] != null) {
		data.more = json['more'];
	}
	if (json['playlist'] != null) {
		data.playlist = new List<UserPlayListPlaylist>();
		(json['playlist'] as List).forEach((v) {
			data.playlist.add(new UserPlayListPlaylist().fromJson(v));
		});
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> userPlayListEntityToJson(UserPlayListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['more'] = entity.more;
	if (entity.playlist != null) {
		data['playlist'] =  entity.playlist.map((v) => v.toJson()).toList();
	}
	data['code'] = entity.code;
	return data;
}

userPlayListPlaylistFromJson(UserPlayListPlaylist data, Map<String, dynamic> json) {
	if (json['subscribers'] != null) {
		data.subscribers = new List<dynamic>();
		data.subscribers.addAll(json['subscribers']);
	}
	if (json['subscribed'] != null) {
		data.subscribed = json['subscribed'];
	}
	if (json['creator'] != null) {
		data.creator = new UserPlayListPlaylistCreator().fromJson(json['creator']);
	}
	if (json['artists'] != null) {
		data.artists = json['artists'];
	}
	if (json['tracks'] != null) {
		data.tracks = json['tracks'];
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
	if (json['recommendInfo'] != null) {
		data.recommendInfo = json['recommendInfo'];
	}
	if (json['ordered'] != null) {
		data.ordered = json['ordered'];
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['adType'] != null) {
		data.adType = json['adType']?.toInt();
	}
	if (json['trackNumberUpdateTime'] != null) {
		data.trackNumberUpdateTime = json['trackNumberUpdateTime']?.toInt();
	}
	if (json['subscribedCount'] != null) {
		data.subscribedCount = json['subscribedCount']?.toInt();
	}
	if (json['cloudTrackCount'] != null) {
		data.cloudTrackCount = json['cloudTrackCount']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['highQuality'] != null) {
		data.highQuality = json['highQuality'];
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['tags'] != null) {
		data.tags = new List<dynamic>();
		data.tags.addAll(json['tags']);
	}
	if (json['totalDuration'] != null) {
		data.totalDuration = json['totalDuration']?.toInt();
	}
	if (json['trackCount'] != null) {
		data.trackCount = json['trackCount']?.toInt();
	}
	if (json['privacy'] != null) {
		data.privacy = json['privacy']?.toInt();
	}
	if (json['trackUpdateTime'] != null) {
		data.trackUpdateTime = json['trackUpdateTime']?.toInt();
	}
	if (json['playCount'] != null) {
		data.playCount = json['playCount']?.toInt();
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
	if (json['coverImgUrl'] != null) {
		data.coverImgUrl = json['coverImgUrl']?.toString();
	}
	if (json['coverImgId'] != null) {
		data.coverImgId = json['coverImgId']?.toInt();
	}
	if (json['newImported'] != null) {
		data.newImported = json['newImported'];
	}
	if (json['anonimous'] != null) {
		data.anonimous = json['anonimous'];
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['coverImgId_str'] != null) {
		data.coverimgidStr = json['coverImgId_str']?.toString();
	}
	return data;
}

Map<String, dynamic> userPlayListPlaylistToJson(UserPlayListPlaylist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.subscribers != null) {
		data['subscribers'] =  [];
	}
	data['subscribed'] = entity.subscribed;
	if (entity.creator != null) {
		data['creator'] = entity.creator.toJson();
	}
	data['artists'] = entity.artists;
	data['tracks'] = entity.tracks;
	data['updateFrequency'] = entity.updateFrequency;
	data['backgroundCoverId'] = entity.backgroundCoverId;
	data['backgroundCoverUrl'] = entity.backgroundCoverUrl;
	data['titleImage'] = entity.titleImage;
	data['titleImageUrl'] = entity.titleImageUrl;
	data['englishTitle'] = entity.englishTitle;
	data['opRecommend'] = entity.opRecommend;
	data['recommendInfo'] = entity.recommendInfo;
	data['ordered'] = entity.ordered;
	data['description'] = entity.description;
	data['adType'] = entity.adType;
	data['trackNumberUpdateTime'] = entity.trackNumberUpdateTime;
	data['subscribedCount'] = entity.subscribedCount;
	data['cloudTrackCount'] = entity.cloudTrackCount;
	data['createTime'] = entity.createTime;
	data['highQuality'] = entity.highQuality;
	data['userId'] = entity.userId;
	data['status'] = entity.status;
	if (entity.tags != null) {
		data['tags'] =  [];
	}
	data['totalDuration'] = entity.totalDuration;
	data['trackCount'] = entity.trackCount;
	data['privacy'] = entity.privacy;
	data['trackUpdateTime'] = entity.trackUpdateTime;
	data['playCount'] = entity.playCount;
	data['specialType'] = entity.specialType;
	data['updateTime'] = entity.updateTime;
	data['commentThreadId'] = entity.commentThreadId;
	data['coverImgUrl'] = entity.coverImgUrl;
	data['coverImgId'] = entity.coverImgId;
	data['newImported'] = entity.newImported;
	data['anonimous'] = entity.anonimous;
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['coverImgId_str'] = entity.coverimgidStr;
	return data;
}

userPlayListPlaylistCreatorFromJson(UserPlayListPlaylistCreator data, Map<String, dynamic> json) {
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

Map<String, dynamic> userPlayListPlaylistCreatorToJson(UserPlayListPlaylistCreator entity) {
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