import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class UserPlayListEntity with JsonConvert<UserPlayListEntity> {
	bool more;
	List<UserPlayListPlaylist> playlist;
	int code;
}

class UserPlayListPlaylist with JsonConvert<UserPlayListPlaylist> {
	List<dynamic> subscribers;
	bool subscribed;
	UserPlayListPlaylistCreator creator;
	dynamic artists;
	dynamic tracks;
	dynamic updateFrequency;
	int backgroundCoverId;
	dynamic backgroundCoverUrl;
	int titleImage;
	dynamic titleImageUrl;
	dynamic englishTitle;
	bool opRecommend;
	dynamic recommendInfo;
	bool ordered;
	String description;
	int adType;
	int trackNumberUpdateTime;
	int subscribedCount;
	int cloudTrackCount;
	int createTime;
	bool highQuality;
	int userId;
	int status;
	List<dynamic> tags;
	int totalDuration;
	int trackCount;
	int privacy;
	int trackUpdateTime;
	int playCount;
	int specialType;
	int updateTime;
	String commentThreadId;
	String coverImgUrl;
	int coverImgId;
	bool newImported;
	bool anonimous;
	String name;
	int id;
	@JSONField(name: "coverImgId_str")
	String coverimgidStr;
}

class UserPlayListPlaylistCreator with JsonConvert<UserPlayListPlaylistCreator> {
	bool defaultAvatar;
	int province;
	int authStatus;
	bool followed;
	String avatarUrl;
	int accountStatus;
	int gender;
	int city;
	int birthday;
	int userId;
	int userType;
	String nickname;
	String signature;
	String description;
	String detailDescription;
	int avatarImgId;
	int backgroundImgId;
	String backgroundUrl;
	int authority;
	bool mutual;
	dynamic expertTags;
	dynamic experts;
	int djStatus;
	int vipType;
	dynamic remarkName;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	@JSONField(name: "avatarImgId_str")
	String avatarimgidStr;
}
