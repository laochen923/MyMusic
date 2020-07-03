import 'package:mymusic/user/entity/msg_private_entity.dart';

msgPrivateEntityFromJson(MsgPrivateEntity data, Map<String, dynamic> json) {
	if (json['msgs'] != null) {
		data.msgs = new List<MsgPrivateMsg>();
		(json['msgs'] as List).forEach((v) {
			data.msgs.add(new MsgPrivateMsg().fromJson(v));
		});
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['more'] != null) {
		data.more = json['more'];
	}
	if (json['newMsgCount'] != null) {
		data.newMsgCount = json['newMsgCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> msgPrivateEntityToJson(MsgPrivateEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.msgs != null) {
		data['msgs'] =  entity.msgs.map((v) => v.toJson()).toList();
	}
	data['code'] = entity.code;
	data['more'] = entity.more;
	data['newMsgCount'] = entity.newMsgCount;
	return data;
}

msgPrivateMsgFromJson(MsgPrivateMsg data, Map<String, dynamic> json) {
	if (json['fromUser'] != null) {
		data.fromUser = new MsgPrivateMsgsFromUser().fromJson(json['fromUser']);
	}
	if (json['toUser'] != null) {
		data.toUser = new MsgPrivateMsgsToUser().fromJson(json['toUser']);
	}
	if (json['noticeAccountFlag'] != null) {
		data.noticeAccountFlag = json['noticeAccountFlag'];
	}
	if (json['noticeAccount'] != null) {
		data.noticeAccount = json['noticeAccount'];
	}
	if (json['lastMsg'] != null) {
		data.lastMsg = json['lastMsg']?.toString();
	}
	if (json['newMsgCount'] != null) {
		data.newMsgCount = json['newMsgCount']?.toInt();
	}
	if (json['lastMsgTime'] != null) {
		data.lastMsgTime = json['lastMsgTime']?.toInt();
	}
	return data;
}

Map<String, dynamic> msgPrivateMsgToJson(MsgPrivateMsg entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.fromUser != null) {
		data['fromUser'] = entity.fromUser.toJson();
	}
	if (entity.toUser != null) {
		data['toUser'] = entity.toUser.toJson();
	}
	data['noticeAccountFlag'] = entity.noticeAccountFlag;
	data['noticeAccount'] = entity.noticeAccount;
	data['lastMsg'] = entity.lastMsg;
	data['newMsgCount'] = entity.newMsgCount;
	data['lastMsgTime'] = entity.lastMsgTime;
	return data;
}

msgPrivateMsgsFromUserFromJson(MsgPrivateMsgsFromUser data, Map<String, dynamic> json) {
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toInt();
	}
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['remarkName'] != null) {
		data.remarkName = json['remarkName'];
	}
	if (json['avatarImgId'] != null) {
		data.avatarImgId = json['avatarImgId']?.toInt();
	}
	if (json['mutual'] != null) {
		data.mutual = json['mutual'];
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['experts'] != null) {
		data.experts = json['experts'];
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toInt();
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['detailDescription'] != null) {
		data.detailDescription = json['detailDescription']?.toString();
	}
	if (json['defaultAvatar'] != null) {
		data.defaultAvatar = json['defaultAvatar'];
	}
	if (json['djStatus'] != null) {
		data.djStatus = json['djStatus']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['backgroundUrl'] != null) {
		data.backgroundUrl = json['backgroundUrl']?.toString();
	}
	if (json['backgroundImgId'] != null) {
		data.backgroundImgId = json['backgroundImgId']?.toInt();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['authority'] != null) {
		data.authority = json['authority']?.toInt();
	}
	if (json['blacklist'] != null) {
		data.blacklist = json['blacklist'];
	}
	if (json['artistName'] != null) {
		data.artistName = json['artistName'];
	}
	return data;
}

Map<String, dynamic> msgPrivateMsgsFromUserToJson(MsgPrivateMsgsFromUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['description'] = entity.description;
	data['province'] = entity.province;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['userId'] = entity.userId;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['nickname'] = entity.nickname;
	data['remarkName'] = entity.remarkName;
	data['avatarImgId'] = entity.avatarImgId;
	data['mutual'] = entity.mutual;
	data['gender'] = entity.gender;
	data['avatarUrl'] = entity.avatarUrl;
	data['authStatus'] = entity.authStatus;
	data['expertTags'] = entity.expertTags;
	data['userType'] = entity.userType;
	data['vipType'] = entity.vipType;
	data['experts'] = entity.experts;
	data['birthday'] = entity.birthday;
	data['accountStatus'] = entity.accountStatus;
	data['city'] = entity.city;
	data['detailDescription'] = entity.detailDescription;
	data['defaultAvatar'] = entity.defaultAvatar;
	data['djStatus'] = entity.djStatus;
	data['followed'] = entity.followed;
	data['backgroundUrl'] = entity.backgroundUrl;
	data['backgroundImgId'] = entity.backgroundImgId;
	data['signature'] = entity.signature;
	data['authority'] = entity.authority;
	data['blacklist'] = entity.blacklist;
	data['artistName'] = entity.artistName;
	return data;
}

msgPrivateMsgsToUserFromJson(MsgPrivateMsgsToUser data, Map<String, dynamic> json) {
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toInt();
	}
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['remarkName'] != null) {
		data.remarkName = json['remarkName'];
	}
	if (json['avatarImgId'] != null) {
		data.avatarImgId = json['avatarImgId']?.toInt();
	}
	if (json['mutual'] != null) {
		data.mutual = json['mutual'];
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['experts'] != null) {
		data.experts = json['experts'];
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toInt();
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['detailDescription'] != null) {
		data.detailDescription = json['detailDescription']?.toString();
	}
	if (json['defaultAvatar'] != null) {
		data.defaultAvatar = json['defaultAvatar'];
	}
	if (json['djStatus'] != null) {
		data.djStatus = json['djStatus']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['backgroundUrl'] != null) {
		data.backgroundUrl = json['backgroundUrl']?.toString();
	}
	if (json['backgroundImgId'] != null) {
		data.backgroundImgId = json['backgroundImgId']?.toInt();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['authority'] != null) {
		data.authority = json['authority']?.toInt();
	}
	return data;
}

Map<String, dynamic> msgPrivateMsgsToUserToJson(MsgPrivateMsgsToUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['description'] = entity.description;
	data['province'] = entity.province;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['userId'] = entity.userId;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['nickname'] = entity.nickname;
	data['remarkName'] = entity.remarkName;
	data['avatarImgId'] = entity.avatarImgId;
	data['mutual'] = entity.mutual;
	data['gender'] = entity.gender;
	data['avatarUrl'] = entity.avatarUrl;
	data['authStatus'] = entity.authStatus;
	data['expertTags'] = entity.expertTags;
	data['userType'] = entity.userType;
	data['vipType'] = entity.vipType;
	data['experts'] = entity.experts;
	data['birthday'] = entity.birthday;
	data['accountStatus'] = entity.accountStatus;
	data['city'] = entity.city;
	data['detailDescription'] = entity.detailDescription;
	data['defaultAvatar'] = entity.defaultAvatar;
	data['djStatus'] = entity.djStatus;
	data['followed'] = entity.followed;
	data['backgroundUrl'] = entity.backgroundUrl;
	data['backgroundImgId'] = entity.backgroundImgId;
	data['signature'] = entity.signature;
	data['authority'] = entity.authority;
	return data;
}