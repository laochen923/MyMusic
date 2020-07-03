import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class UserEntity with JsonConvert<UserEntity> {
	int loginType;
	int code;
	UserAccount account;
	String token;
	UserProfile profile;
	List<UserBinding> bindings;
}

class UserAccount with JsonConvert<UserAccount> {
	int id;
	String userName;
	int type;
	int status;
	int whitelistAuthority;
	int createTime;
	String salt;
	int tokenVersion;
	int ban;
	int baoyueVersion;
	int donateVersion;
	int vipType;
	int viptypeVersion;
	bool anonimousUser;
}

class UserProfile with JsonConvert<UserProfile> {
	int userId;
	bool defaultAvatar;
	int province;
	int avatarImgId;
	int birthday;
	String nickname;
	UserProfileExperts experts;
	dynamic expertTags;
	int authStatus;
	bool mutual;
	dynamic remarkName;
	int userType;
	int backgroundImgId;
	int vipType;
	int gender;
	int djStatus;
	int accountStatus;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	String avatarUrl;
	int city;
	String description;
	String detailDescription;
	bool followed;
	String backgroundUrl;
	String signature;
	int authority;
	@JSONField(name: "avatarImgId_str")
	String avatarimgidStr;
	int followeds;
	int follows;
	int eventCount;
	int playlistCount;
	int playlistBeSubscribedCount;
}

class UserProfileExperts with JsonConvert<UserProfileExperts> {

}

class UserBinding with JsonConvert<UserBinding> {
	int userId;
	String url;
	String tokenJsonStr;
	int bindingTime;
	int expiresIn;
	int refreshTime;
	bool expired;
	int id;
	int type;
}
