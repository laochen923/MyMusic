import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class PersonalizedDjEntity with JsonConvert<PersonalizedDjEntity> {
	int code;
	int category;
	List<PersonalizedDjResult> result;
}

class PersonalizedDjResult with JsonConvert<PersonalizedDjResult> {
	int id;
	int type;
	String name;
	String copywriter;
	String picUrl;
	bool canDislike;
	dynamic trackNumberUpdateTime;
	PersonalizedDjResultProgram program;
	String alg;
}

class PersonalizedDjResultProgram with JsonConvert<PersonalizedDjResultProgram> {
	PersonalizedDjResultProgramMainSong mainSong;
	dynamic songs;
	PersonalizedDjResultProgramDj dj;
	String blurCoverUrl;
	PersonalizedDjResultProgramRadio radio;
	int subscribedCount;
	bool reward;
	int mainTrackId;
	int serialNum;
	int listenerCount;
	String name;
	int id;
	int createTime;
	String description;
	int userId;
	String coverUrl;
	String commentThreadId;
	List<dynamic> channels;
	dynamic titbits;
	dynamic titbitImages;
	int pubStatus;
	int trackCount;
	int bdAuditStatus;
	int programFeeType;
	bool buyed;
	dynamic programDesc;
	List<dynamic> h5Links;
	int coverId;
	int adjustedPlayCount;
	bool canReward;
	int auditStatus;
	bool publish;
	int duration;
	int shareCount;
	bool subscribed;
	int likedCount;
	int commentCount;
	bool isPublish;
}

class PersonalizedDjResultProgramMainSong with JsonConvert<PersonalizedDjResultProgramMainSong> {
	String name;
	int id;
	int position;
	List<dynamic> alias;
	int status;
	int fee;
	int copyrightId;
	String disc;
	int no;
	List<PersonalizedDjResultProgramMainSongArtist> artists;
	PersonalizedDjResultProgramMainSongAlbum album;
	bool starred;
	int popularity;
	int score;
	int starredNum;
	int duration;
	int playedNum;
	int dayPlays;
	int hearTime;
	dynamic ringtone;
	dynamic crbt;
	dynamic audition;
	String copyFrom;
	String commentThreadId;
	dynamic rtUrl;
	int ftype;
	List<dynamic> rtUrls;
	int copyright;
	dynamic transName;
	dynamic sign;
	int mark;
	dynamic noCopyrightRcmd;
	int mvid;
	PersonalizedDjResultProgramMainSongBMusic bMusic;
	dynamic mp3Url;
	int rtype;
	dynamic rurl;
	PersonalizedDjResultProgramMainSongHMusic hMusic;
	dynamic mMusic;
	PersonalizedDjResultProgramMainSongLMusic lMusic;
}

class PersonalizedDjResultProgramMainSongArtist with JsonConvert<PersonalizedDjResultProgramMainSongArtist> {
	String name;
	int id;
	int picId;
	int img1v1Id;
	String briefDesc;
	String picUrl;
	String img1v1Url;
	int albumSize;
	List<dynamic> alias;
	String trans;
	int musicSize;
	int topicPerson;
}

class PersonalizedDjResultProgramMainSongAlbum with JsonConvert<PersonalizedDjResultProgramMainSongAlbum> {
	dynamic name;
	int id;
	dynamic type;
	int size;
	int picId;
	dynamic blurPicUrl;
	int companyId;
	int pic;
	String picUrl;
	int publishTime;
	String description;
	String tags;
	dynamic company;
	String briefDesc;
	PersonalizedDjResultProgramMainSongAlbumArtist artist;
	List<dynamic> songs;
	List<dynamic> alias;
	int status;
	int copyrightId;
	String commentThreadId;
	List<PersonalizedDjResultProgramMainSongAlbumArtist> artists;
	dynamic subType;
	dynamic transName;
	int mark;
}

class PersonalizedDjResultProgramMainSongAlbumArtist with JsonConvert<PersonalizedDjResultProgramMainSongAlbumArtist> {
	String name;
	int id;
	int picId;
	int img1v1Id;
	String briefDesc;
	String picUrl;
	String img1v1Url;
	int albumSize;
	List<dynamic> alias;
	String trans;
	int musicSize;
	int topicPerson;
}

class PersonalizedDjResultProgramMainSongBMusic with JsonConvert<PersonalizedDjResultProgramMainSongBMusic> {
	dynamic name;
	int id;
	int size;
	String extension;
	int sr;
	int dfsId;
	int bitrate;
	int playTime;
	int volumeDelta;
}

class PersonalizedDjResultProgramMainSongHMusic with JsonConvert<PersonalizedDjResultProgramMainSongHMusic> {
	dynamic name;
	int id;
	int size;
	String extension;
	int sr;
	int dfsId;
	int bitrate;
	int playTime;
	int volumeDelta;
}

class PersonalizedDjResultProgramMainSongLMusic with JsonConvert<PersonalizedDjResultProgramMainSongLMusic> {
	dynamic name;
	int id;
	int size;
	String extension;
	int sr;
	int dfsId;
	int bitrate;
	int playTime;
	int volumeDelta;
}

class PersonalizedDjResultProgramDj with JsonConvert<PersonalizedDjResultProgramDj> {
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
	PersonalizedDjResultProgramDjExperts experts;
	int djStatus;
	int vipType;
	dynamic remarkName;
	String backgroundImgIdStr;
	String avatarImgIdStr;
	@JSONField(name: "avatarImgId_str")
	String avatarimgidStr;
	String brand;
}

class PersonalizedDjResultProgramDjExperts with JsonConvert<PersonalizedDjResultProgramDjExperts> {
	@JSONField(name: "1")
	String x1;
}

class PersonalizedDjResultProgramRadio with JsonConvert<PersonalizedDjResultProgramRadio> {
	int id;
	dynamic dj;
	String name;
	String picUrl;
	String desc;
	int subCount;
	int programCount;
	int createTime;
	int categoryId;
	String category;
	int radioFeeType;
	int feeScope;
	bool buyed;
	dynamic videos;
	bool finished;
	bool underShelf;
	int purchaseCount;
	int price;
	int originalPrice;
	dynamic discountPrice;
	int lastProgramCreateTime;
	dynamic lastProgramName;
	int lastProgramId;
	int picId;
	String rcmdText;
	bool hightQuality;
	bool whiteList;
	bool composeVideo;
	bool subed;
}
