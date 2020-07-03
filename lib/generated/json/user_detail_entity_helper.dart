import 'package:mymusic/user/entity/user_detail_entity.dart';
import 'package:flutter/foundation.dart';

userDetailEntityFromJson(UserDetailEntity data, Map<String, dynamic> json) {
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	if (json['listenSongs'] != null) {
		data.listenSongs = json['listenSongs']?.toInt();
	}
	if (json['userPoint'] != null) {
		data.userPoint = new UserDetailUserPoint().fromJson(json['userPoint']);
	}
	if (json['mobileSign'] != null) {
		data.mobileSign = json['mobileSign'];
	}
	if (json['pcSign'] != null) {
		data.pcSign = json['pcSign'];
	}
	if (json['profile'] != null) {
		data.profile = new UserDetailProfile().fromJson(json['profile']);
	}
	if (json['peopleCanSeeMyPlayRecord'] != null) {
		data.peopleCanSeeMyPlayRecord = json['peopleCanSeeMyPlayRecord'];
	}
	if (json['bindings'] != null) {
		data.bindings = new List<UserDetailBinding>();
		(json['bindings'] as List).forEach((v) {
			data.bindings.add(new UserDetailBinding().fromJson(v));
		});
	}
	if (json['adValid'] != null) {
		data.adValid = json['adValid'];
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['createDays'] != null) {
		data.createDays = json['createDays']?.toInt();
	}
	return data;
}

Map<String, dynamic> userDetailEntityToJson(UserDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['level'] = entity.level;
	data['listenSongs'] = entity.listenSongs;
	if (entity.userPoint != null) {
		data['userPoint'] = entity.userPoint.toJson();
	}
	data['mobileSign'] = entity.mobileSign;
	data['pcSign'] = entity.pcSign;
	if (entity.profile != null) {
		data['profile'] = entity.profile.toJson();
	}
	data['peopleCanSeeMyPlayRecord'] = entity.peopleCanSeeMyPlayRecord;
	if (entity.bindings != null) {
		data['bindings'] =  entity.bindings.map((v) => v.toJson()).toList();
	}
	data['adValid'] = entity.adValid;
	data['code'] = entity.code;
	data['createTime'] = entity.createTime;
	data['createDays'] = entity.createDays;
	return data;
}

userDetailUserPointFromJson(UserDetailUserPoint data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['balance'] != null) {
		data.balance = json['balance']?.toInt();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toInt();
	}
	if (json['version'] != null) {
		data.version = json['version']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['blockBalance'] != null) {
		data.blockBalance = json['blockBalance']?.toInt();
	}
	return data;
}

Map<String, dynamic> userDetailUserPointToJson(UserDetailUserPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['balance'] = entity.balance;
	data['updateTime'] = entity.updateTime;
	data['version'] = entity.version;
	data['status'] = entity.status;
	data['blockBalance'] = entity.blockBalance;
	return data;
}

userDetailProfileFromJson(UserDetailProfile data, Map<String, dynamic> json) {
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['djStatus'] != null) {
		data.djStatus = json['djStatus']?.toInt();
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toInt();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['mutual'] != null) {
		data.mutual = json['mutual'];
	}
	if (json['remarkName'] != null) {
		data.remarkName = json['remarkName'];
	}
	if (json['avatarImgId'] != null) {
		data.avatarImgId = json['avatarImgId']?.toInt();
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toInt();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['detailDescription'] != null) {
		data.detailDescription = json['detailDescription']?.toString();
	}
	if (json['experts'] != null) {
		data.experts = new UserDetailProfileExperts().fromJson(json['experts']);
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['defaultAvatar'] != null) {
		data.defaultAvatar = json['defaultAvatar'];
	}
	if (json['backgroundImgId'] != null) {
		data.backgroundImgId = json['backgroundImgId']?.toInt();
	}
	if (json['backgroundUrl'] != null) {
		data.backgroundUrl = json['backgroundUrl']?.toString();
	}
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['authority'] != null) {
		data.authority = json['authority']?.toInt();
	}
	if (json['followeds'] != null) {
		data.followeds = json['followeds']?.toInt();
	}
	if (json['follows'] != null) {
		data.follows = json['follows']?.toInt();
	}
	if (json['blacklist'] != null) {
		data.blacklist = json['blacklist'];
	}
	if (json['eventCount'] != null) {
		data.eventCount = json['eventCount']?.toInt();
	}
	if (json['allSubscribedCount'] != null) {
		data.allSubscribedCount = json['allSubscribedCount']?.toInt();
	}
	if (json['playlistBeSubscribedCount'] != null) {
		data.playlistBeSubscribedCount = json['playlistBeSubscribedCount']?.toInt();
	}
	if (json['avatarImgId_str'] != null) {
		data.avatarimgidStr = json['avatarImgId_str']?.toString();
	}
	if (json['followTime'] != null) {
		data.followTime = json['followTime'];
	}
	if (json['followMe'] != null) {
		data.followMe = json['followMe'];
	}
	if (json['artistIdentity'] != null) {
		data.artistIdentity = new List<dynamic>();
		data.artistIdentity.addAll(json['artistIdentity']);
	}
	if (json['cCount'] != null) {
		data.cCount = json['cCount']?.toInt();
	}
	if (json['sDJPCount'] != null) {
		data.sDJPCount = json['sDJPCount']?.toInt();
	}
	if (json['playlistCount'] != null) {
		data.playlistCount = json['playlistCount']?.toInt();
	}
	if (json['sCount'] != null) {
		data.sCount = json['sCount']?.toInt();
	}
	if (json['newFollows'] != null) {
		data.newFollows = json['newFollows']?.toInt();
	}
	return data;
}

Map<String, dynamic> userDetailProfileToJson(UserDetailProfile entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['nickname'] = entity.nickname;
	data['createTime'] = entity.createTime;
	data['djStatus'] = entity.djStatus;
	data['accountStatus'] = entity.accountStatus;
	data['province'] = entity.province;
	data['vipType'] = entity.vipType;
	data['followed'] = entity.followed;
	data['mutual'] = entity.mutual;
	data['remarkName'] = entity.remarkName;
	data['avatarImgId'] = entity.avatarImgId;
	data['birthday'] = entity.birthday;
	data['gender'] = entity.gender;
	data['avatarUrl'] = entity.avatarUrl;
	data['userType'] = entity.userType;
	data['authStatus'] = entity.authStatus;
	data['detailDescription'] = entity.detailDescription;
	if (entity.experts != null) {
		data['experts'] = entity.experts.toJson();
	}
	data['expertTags'] = entity.expertTags;
	data['city'] = entity.city;
	data['defaultAvatar'] = entity.defaultAvatar;
	data['backgroundImgId'] = entity.backgroundImgId;
	data['backgroundUrl'] = entity.backgroundUrl;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['description'] = entity.description;
	data['userId'] = entity.userId;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['signature'] = entity.signature;
	data['authority'] = entity.authority;
	data['followeds'] = entity.followeds;
	data['follows'] = entity.follows;
	data['blacklist'] = entity.blacklist;
	data['eventCount'] = entity.eventCount;
	data['allSubscribedCount'] = entity.allSubscribedCount;
	data['playlistBeSubscribedCount'] = entity.playlistBeSubscribedCount;
	data['avatarImgId_str'] = entity.avatarimgidStr;
	data['followTime'] = entity.followTime;
	data['followMe'] = entity.followMe;
	if (entity.artistIdentity != null) {
		data['artistIdentity'] =  [];
	}
	data['cCount'] = entity.cCount;
	data['sDJPCount'] = entity.sDJPCount;
	data['playlistCount'] = entity.playlistCount;
	data['sCount'] = entity.sCount;
	data['newFollows'] = entity.newFollows;
	return data;
}

userDetailProfileExpertsFromJson(UserDetailProfileExperts data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> userDetailProfileExpertsToJson(UserDetailProfileExperts entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

userDetailBindingFromJson(UserDetailBinding data, Map<String, dynamic> json) {
	if (json['expiresIn'] != null) {
		data.expiresIn = json['expiresIn']?.toInt();
	}
	if (json['refreshTime'] != null) {
		data.refreshTime = json['refreshTime']?.toInt();
	}
	if (json['bindingTime'] != null) {
		data.bindingTime = json['bindingTime']?.toInt();
	}
	if (json['tokenJsonStr'] != null) {
		data.tokenJsonStr = json['tokenJsonStr'];
	}
	if (json['expired'] != null) {
		data.expired = json['expired'];
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	return data;
}

Map<String, dynamic> userDetailBindingToJson(UserDetailBinding entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['expiresIn'] = entity.expiresIn;
	data['refreshTime'] = entity.refreshTime;
	data['bindingTime'] = entity.bindingTime;
	data['tokenJsonStr'] = entity.tokenJsonStr;
	data['expired'] = entity.expired;
	data['url'] = entity.url;
	data['userId'] = entity.userId;
	data['id'] = entity.id;
	data['type'] = entity.type;
	return data;
}