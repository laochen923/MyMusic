import 'package:mymusic/generated/json/base/json_convert_content.dart';

class RecommendResourceEntity with JsonConvert<RecommendResourceEntity> {
	int code;
	bool featureFirst;
	bool haveRcmdSongs;
	List<ResourceRecommend> recommend;
}

class ResourceRecommend with JsonConvert<ResourceRecommend> {
	int id;
	int type;
	String name;
	String copywriter;
	String picUrl;
	int playcount;
	int createTime;
	RecommendResourceRecommendCreator creator;
	int trackCount;
	int userId;
	String alg;
	int avatarImgId;
	int backgroundImgId;
	dynamic expertTags;
	int djStatus;
	bool followed;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	int accountStatus;
	int vipType;
	int province;
	String avatarUrl;
	int authStatus;
	int userType;
	String nickname;
	int gender;
	int birthday;
	int city;
	String description;
	String signature;
	int authority;
}

class RecommendResourceRecommendCreator with JsonConvert<RecommendResourceRecommendCreator> {
	bool mutual;
	dynamic remarkName;
	String detailDescription;
	bool defaultAvatar;
	String backgroundUrl;
	int avatarImgId;
	int backgroundImgId;
	dynamic expertTags;
	int djStatus;
	bool followed;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	int accountStatus;
	int userId;
	int vipType;
	int province;
	String avatarUrl;
	int authStatus;
	int userType;
	String nickname;
	int gender;
	int birthday;
	int city;
	String description;
	String signature;
	int authority;
}
