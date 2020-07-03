import 'package:mymusic/user/entity/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['loginType'] != null) {
		data.loginType = json['loginType']?.toInt();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['account'] != null) {
		data.account = new UserAccount().fromJson(json['account']);
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['profile'] != null) {
		data.profile = new UserProfile().fromJson(json['profile']);
	}
	if (json['bindings'] != null) {
		data.bindings = new List<UserBinding>();
		(json['bindings'] as List).forEach((v) {
			data.bindings.add(new UserBinding().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['loginType'] = entity.loginType;
	data['code'] = entity.code;
	if (entity.account != null) {
		data['account'] = entity.account.toJson();
	}
	data['token'] = entity.token;
	if (entity.profile != null) {
		data['profile'] = entity.profile.toJson();
	}
	if (entity.bindings != null) {
		data['bindings'] =  entity.bindings.map((v) => v.toJson()).toList();
	}
	return data;
}

userAccountFromJson(UserAccount data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['userName'] != null) {
		data.userName = json['userName']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['whitelistAuthority'] != null) {
		data.whitelistAuthority = json['whitelistAuthority']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['salt'] != null) {
		data.salt = json['salt']?.toString();
	}
	if (json['tokenVersion'] != null) {
		data.tokenVersion = json['tokenVersion']?.toInt();
	}
	if (json['ban'] != null) {
		data.ban = json['ban']?.toInt();
	}
	if (json['baoyueVersion'] != null) {
		data.baoyueVersion = json['baoyueVersion']?.toInt();
	}
	if (json['donateVersion'] != null) {
		data.donateVersion = json['donateVersion']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['viptypeVersion'] != null) {
		data.viptypeVersion = json['viptypeVersion']?.toInt();
	}
	if (json['anonimousUser'] != null) {
		data.anonimousUser = json['anonimousUser'];
	}
	return data;
}

Map<String, dynamic> userAccountToJson(UserAccount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userName'] = entity.userName;
	data['type'] = entity.type;
	data['status'] = entity.status;
	data['whitelistAuthority'] = entity.whitelistAuthority;
	data['createTime'] = entity.createTime;
	data['salt'] = entity.salt;
	data['tokenVersion'] = entity.tokenVersion;
	data['ban'] = entity.ban;
	data['baoyueVersion'] = entity.baoyueVersion;
	data['donateVersion'] = entity.donateVersion;
	data['vipType'] = entity.vipType;
	data['viptypeVersion'] = entity.viptypeVersion;
	data['anonimousUser'] = entity.anonimousUser;
	return data;
}

userProfileFromJson(UserProfile data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['defaultAvatar'] != null) {
		data.defaultAvatar = json['defaultAvatar'];
	}
	if (json['province'] != null) {
		data.province = json['province']?.toInt();
	}
	if (json['avatarImgId'] != null) {
		data.avatarImgId = json['avatarImgId']?.toInt();
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['experts'] != null) {
		data.experts = new UserProfileExperts().fromJson(json['experts']);
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['mutual'] != null) {
		data.mutual = json['mutual'];
	}
	if (json['remarkName'] != null) {
		data.remarkName = json['remarkName'];
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['backgroundImgId'] != null) {
		data.backgroundImgId = json['backgroundImgId']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['djStatus'] != null) {
		data.djStatus = json['djStatus']?.toInt();
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toInt();
	}
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['detailDescription'] != null) {
		data.detailDescription = json['detailDescription']?.toString();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['backgroundUrl'] != null) {
		data.backgroundUrl = json['backgroundUrl']?.toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['authority'] != null) {
		data.authority = json['authority']?.toInt();
	}
	if (json['avatarImgId_str'] != null) {
		data.avatarimgidStr = json['avatarImgId_str']?.toString();
	}
	if (json['followeds'] != null) {
		data.followeds = json['followeds']?.toInt();
	}
	if (json['follows'] != null) {
		data.follows = json['follows']?.toInt();
	}
	if (json['eventCount'] != null) {
		data.eventCount = json['eventCount']?.toInt();
	}
	if (json['playlistCount'] != null) {
		data.playlistCount = json['playlistCount']?.toInt();
	}
	if (json['playlistBeSubscribedCount'] != null) {
		data.playlistBeSubscribedCount = json['playlistBeSubscribedCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> userProfileToJson(UserProfile entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['defaultAvatar'] = entity.defaultAvatar;
	data['province'] = entity.province;
	data['avatarImgId'] = entity.avatarImgId;
	data['birthday'] = entity.birthday;
	data['nickname'] = entity.nickname;
	if (entity.experts != null) {
		data['experts'] = entity.experts.toJson();
	}
	data['expertTags'] = entity.expertTags;
	data['authStatus'] = entity.authStatus;
	data['mutual'] = entity.mutual;
	data['remarkName'] = entity.remarkName;
	data['userType'] = entity.userType;
	data['backgroundImgId'] = entity.backgroundImgId;
	data['vipType'] = entity.vipType;
	data['gender'] = entity.gender;
	data['djStatus'] = entity.djStatus;
	data['accountStatus'] = entity.accountStatus;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['avatarUrl'] = entity.avatarUrl;
	data['city'] = entity.city;
	data['description'] = entity.description;
	data['detailDescription'] = entity.detailDescription;
	data['followed'] = entity.followed;
	data['backgroundUrl'] = entity.backgroundUrl;
	data['signature'] = entity.signature;
	data['authority'] = entity.authority;
	data['avatarImgId_str'] = entity.avatarimgidStr;
	data['followeds'] = entity.followeds;
	data['follows'] = entity.follows;
	data['eventCount'] = entity.eventCount;
	data['playlistCount'] = entity.playlistCount;
	data['playlistBeSubscribedCount'] = entity.playlistBeSubscribedCount;
	return data;
}

userProfileExpertsFromJson(UserProfileExperts data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> userProfileExpertsToJson(UserProfileExperts entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

userBindingFromJson(UserBinding data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['tokenJsonStr'] != null) {
		data.tokenJsonStr = json['tokenJsonStr']?.toString();
	}
	if (json['bindingTime'] != null) {
		data.bindingTime = json['bindingTime']?.toInt();
	}
	if (json['expiresIn'] != null) {
		data.expiresIn = json['expiresIn']?.toInt();
	}
	if (json['refreshTime'] != null) {
		data.refreshTime = json['refreshTime']?.toInt();
	}
	if (json['expired'] != null) {
		data.expired = json['expired'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	return data;
}

Map<String, dynamic> userBindingToJson(UserBinding entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['url'] = entity.url;
	data['tokenJsonStr'] = entity.tokenJsonStr;
	data['bindingTime'] = entity.bindingTime;
	data['expiresIn'] = entity.expiresIn;
	data['refreshTime'] = entity.refreshTime;
	data['expired'] = entity.expired;
	data['id'] = entity.id;
	data['type'] = entity.type;
	return data;
}