import 'package:mymusic/generated/json/base/json_convert_content.dart';

class MsgPrivateEntity with JsonConvert<MsgPrivateEntity> {
	List<MsgPrivateMsg> msgs;
	int code;
	bool more;
	int newMsgCount;
}


class MsgPrivateMsg with JsonConvert<MsgPrivateMsg> {
	MsgPrivateMsgsFromUser fromUser;
	MsgPrivateMsgsToUser toUser;
	bool noticeAccountFlag;
	dynamic noticeAccount;
	String lastMsg;
	int newMsgCount;
	int lastMsgTime;
}

class MsgPrivateMsgsFromUser with JsonConvert<MsgPrivateMsgsFromUser> {
	String description;
	int province;
	String avatarImgIdStr;
	int userId;
	String backgroundImgIdStr;
	String nickname;
	dynamic remarkName;
	int avatarImgId;
	bool mutual;
	int gender;
	String avatarUrl;
	int authStatus;
	dynamic expertTags;
	int userType;
	int vipType;
	dynamic experts;
	int birthday;
	int accountStatus;
	int city;
	String detailDescription;
	bool defaultAvatar;
	int djStatus;
	bool followed;
	String backgroundUrl;
	int backgroundImgId;
	String signature;
	int authority;
	bool blacklist;
	dynamic artistName;
}

class MsgPrivateMsgsToUser with JsonConvert<MsgPrivateMsgsToUser> {
	String description;
	int province;
	String avatarImgIdStr;
	int userId;
	String backgroundImgIdStr;
	String nickname;
	dynamic remarkName;
	int avatarImgId;
	bool mutual;
	int gender;
	String avatarUrl;
	int authStatus;
	dynamic expertTags;
	int userType;
	int vipType;
	dynamic experts;
	int birthday;
	int accountStatus;
	int city;
	String detailDescription;
	bool defaultAvatar;
	int djStatus;
	bool followed;
	String backgroundUrl;
	int backgroundImgId;
	String signature;
	int authority;
}
