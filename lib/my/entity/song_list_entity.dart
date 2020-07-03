import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class SongListEntity with JsonConvert<SongListEntity> {
	int code;
	dynamic relatedVideos;
	SongListPlaylist playlist;
	dynamic urls;
	List<SongListPrivilege> privileges;
}

class SongListPlaylist with JsonConvert<SongListPlaylist> {
	List<dynamic> subscribers;
	bool subscribed;
	SongListPlaylistCreator creator;
	List<SongListPlaylistTrack> tracks;
	List<SongListPlaylistTrackId> trackIds;
	dynamic updateFrequency;
	int backgroundCoverId;
	dynamic backgroundCoverUrl;
	int titleImage;
	dynamic titleImageUrl;
	dynamic englishTitle;
	bool opRecommend;
	bool ordered;
	dynamic description;
	int userId;
	int specialType;
	int updateTime;
	String commentThreadId;
	int privacy;
	int trackUpdateTime;
	int trackCount;
	String coverImgUrl;
	int playCount;
	int trackNumberUpdateTime;
	int status;
	List<dynamic> tags;
	int createTime;
	bool highQuality;
	int adType;
	int coverImgId;
	bool newImported;
	int subscribedCount;
	int cloudTrackCount;
	String name;
	int id;
	int shareCount;
	@JSONField(name: "coverImgId_str")
	String coverimgidStr;
	int commentCount;
}

class SongListPlaylistCreator with JsonConvert<SongListPlaylistCreator> {
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

class SongListPlaylistTrack with JsonConvert<SongListPlaylistTrack> {
	String name;
	int id;
	int pst;
	int t;
	List<SongListPlaylistTracksAr> ar;
	List<dynamic> alia;
	int pop;
	int st;
	dynamic rt;
	int fee;
	int v;
	dynamic crbt;
	String cf;
	SongListPlaylistTracksAl al;
	int dt;
	SongListPlaylistTracksH h;
	SongListPlaylistTracksM m;
	SongListPlaylistTracksL l;
	dynamic a;
	String cd;
	int no;
	dynamic rtUrl;
	int ftype;
	List<dynamic> rtUrls;
	int djId;
	int copyright;
	@JSONField(name: "s_id")
	int sId;
	int mark;
	int rtype;
	dynamic rurl;
	int mst;
	int cp;
	int mv;
	int publishTime;
	bool isSelected;
}

class SongListPlaylistTracksAr with JsonConvert<SongListPlaylistTracksAr> {
	int id;
	String name;
	List<dynamic> tns;
	List<dynamic> alias;
}

class SongListPlaylistTracksAl with JsonConvert<SongListPlaylistTracksAl> {
	int id;
	String name;
	String picUrl;
	List<dynamic> tns;
	@JSONField(name: "pic_str")
	String picStr;
	int pic;
}

class SongListPlaylistTracksH with JsonConvert<SongListPlaylistTracksH> {
	int br;
	int fid;
	int size;
	int vd;
}

class SongListPlaylistTracksM with JsonConvert<SongListPlaylistTracksM> {
	int br;
	int fid;
	int size;
	int vd;
}

class SongListPlaylistTracksL with JsonConvert<SongListPlaylistTracksL> {
	int br;
	int fid;
	int size;
	int vd;
}

class SongListPlaylistTrackId with JsonConvert<SongListPlaylistTrackId> {
	int id;
	int v;
	dynamic alg;
}

class SongListPrivilege with JsonConvert<SongListPrivilege> {
	int id;
	int fee;
	int payed;
	int st;
	int pl;
	int dl;
	int sp;
	int cp;
	int subp;
	bool cs;
	int maxbr;
	int fl;
	bool toast;
	int flag;
	bool preSell;
}
