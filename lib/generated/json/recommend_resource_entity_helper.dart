import 'package:mymusic/discover/entity/recommend_resource_entity.dart';

recommendResourceEntityFromJson(RecommendResourceEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['featureFirst'] != null) {
		data.featureFirst = json['featureFirst'];
	}
	if (json['haveRcmdSongs'] != null) {
		data.haveRcmdSongs = json['haveRcmdSongs'];
	}
	if (json['recommend'] != null) {
		data.recommend = new List<ResourceRecommend>();
		(json['recommend'] as List).forEach((v) {
			data.recommend.add(new ResourceRecommend().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> recommendResourceEntityToJson(RecommendResourceEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['featureFirst'] = entity.featureFirst;
	data['haveRcmdSongs'] = entity.haveRcmdSongs;
	if (entity.recommend != null) {
		data['recommend'] =  entity.recommend.map((v) => v.toJson()).toList();
	}
	return data;
}

resourceRecommendFromJson(ResourceRecommend data, Map<String, dynamic> json) {
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
	if (json['playcount'] != null) {
		data.playcount = json['playcount']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['creator'] != null) {
		data.creator = new RecommendResourceRecommendCreator().fromJson(json['creator']);
	}
	if (json['trackCount'] != null) {
		data.trackCount = json['trackCount']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	if (json['avatarImgId'] != null) {
		data.avatarImgId = json['avatarImgId']?.toInt();
	}
	if (json['backgroundImgId'] != null) {
		data.backgroundImgId = json['backgroundImgId']?.toInt();
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['djStatus'] != null) {
		data.djStatus = json['djStatus']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toInt();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['authority'] != null) {
		data.authority = json['authority']?.toInt();
	}
	return data;
}

Map<String, dynamic> resourceRecommendToJson(ResourceRecommend entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['name'] = entity.name;
	data['copywriter'] = entity.copywriter;
	data['picUrl'] = entity.picUrl;
	data['playcount'] = entity.playcount;
	data['createTime'] = entity.createTime;
	if (entity.creator != null) {
		data['creator'] = entity.creator.toJson();
	}
	data['trackCount'] = entity.trackCount;
	data['userId'] = entity.userId;
	data['alg'] = entity.alg;
	data['avatarImgId'] = entity.avatarImgId;
	data['backgroundImgId'] = entity.backgroundImgId;
	data['expertTags'] = entity.expertTags;
	data['djStatus'] = entity.djStatus;
	data['followed'] = entity.followed;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['accountStatus'] = entity.accountStatus;
	data['vipType'] = entity.vipType;
	data['province'] = entity.province;
	data['avatarUrl'] = entity.avatarUrl;
	data['authStatus'] = entity.authStatus;
	data['userType'] = entity.userType;
	data['nickname'] = entity.nickname;
	data['gender'] = entity.gender;
	data['birthday'] = entity.birthday;
	data['city'] = entity.city;
	data['description'] = entity.description;
	data['signature'] = entity.signature;
	data['authority'] = entity.authority;
	return data;
}

recommendResourceRecommendCreatorFromJson(RecommendResourceRecommendCreator data, Map<String, dynamic> json) {
	if (json['mutual'] != null) {
		data.mutual = json['mutual'];
	}
	if (json['remarkName'] != null) {
		data.remarkName = json['remarkName'];
	}
	if (json['detailDescription'] != null) {
		data.detailDescription = json['detailDescription']?.toString();
	}
	if (json['defaultAvatar'] != null) {
		data.defaultAvatar = json['defaultAvatar'];
	}
	if (json['backgroundUrl'] != null) {
		data.backgroundUrl = json['backgroundUrl']?.toString();
	}
	if (json['avatarImgId'] != null) {
		data.avatarImgId = json['avatarImgId']?.toInt();
	}
	if (json['backgroundImgId'] != null) {
		data.backgroundImgId = json['backgroundImgId']?.toInt();
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['djStatus'] != null) {
		data.djStatus = json['djStatus']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toInt();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['authority'] != null) {
		data.authority = json['authority']?.toInt();
	}
	return data;
}

Map<String, dynamic> recommendResourceRecommendCreatorToJson(RecommendResourceRecommendCreator entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mutual'] = entity.mutual;
	data['remarkName'] = entity.remarkName;
	data['detailDescription'] = entity.detailDescription;
	data['defaultAvatar'] = entity.defaultAvatar;
	data['backgroundUrl'] = entity.backgroundUrl;
	data['avatarImgId'] = entity.avatarImgId;
	data['backgroundImgId'] = entity.backgroundImgId;
	data['expertTags'] = entity.expertTags;
	data['djStatus'] = entity.djStatus;
	data['followed'] = entity.followed;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['accountStatus'] = entity.accountStatus;
	data['userId'] = entity.userId;
	data['vipType'] = entity.vipType;
	data['province'] = entity.province;
	data['avatarUrl'] = entity.avatarUrl;
	data['authStatus'] = entity.authStatus;
	data['userType'] = entity.userType;
	data['nickname'] = entity.nickname;
	data['gender'] = entity.gender;
	data['birthday'] = entity.birthday;
	data['city'] = entity.city;
	data['description'] = entity.description;
	data['signature'] = entity.signature;
	data['authority'] = entity.authority;
	return data;
}