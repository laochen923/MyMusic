import 'package:mymusic/generated/json/base/json_convert_content.dart';

class RecommendSongsEntity with JsonConvert<RecommendSongsEntity> {
	int code;
	List<SongsRecommend> recommend;
}

class SongsRecommend with JsonConvert<SongsRecommend> {
	String name;
	int id;
	int position;
	List<dynamic> alias;
	int status;
	int fee;
	int copyrightId;
	String disc;
	int no;
	List<SongsRecommendArtists> artists;
	SongsRecommendAlbum album;
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
	SongsRecommendHMusic hMusic;
	SongsRecommendMMusic mMusic;
	SongsRecommendLMusic lMusic;
	SongsRecommendBMusic bMusic;
	int mvid;
	dynamic mp3Url;
	int rtype;
	dynamic rurl;
	String reason;
	SongsRecommendPrivilege privilege;
	String alg;
}

class SongsRecommendArtists with JsonConvert<SongsRecommendArtists> {
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

class SongsRecommendAlbum with JsonConvert<SongsRecommendAlbum> {
	String algnalgame;
	int id;
	String type;
	int size;
	int picId;
	String blurPicUrl;
	int companyId;
	int pic;
	String picUrl;
	int publishTime;
	String description;
	String tags;
	String company;
	String briefDesc;
	SongsRecommendAlbumArtist artist;
	List<dynamic> songs;
	List<dynamic> alias;
	int status;
	int copyrightId;
	String commentThreadId;
	List<SongsRecommendAlbumArtists> artists;
	String subType;
	dynamic transName;
	int mark;
}

class SongsRecommendAlbumArtist with JsonConvert<SongsRecommendAlbumArtist> {
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

class SongsRecommendAlbumArtists with JsonConvert<SongsRecommendAlbumArtists> {
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

class SongsRecommendHMusic with JsonConvert<SongsRecommendHMusic> {
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

class SongsRecommendMMusic with JsonConvert<SongsRecommendMMusic> {
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

class SongsRecommendLMusic with JsonConvert<SongsRecommendLMusic> {
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

class SongsRecommendBMusic with JsonConvert<SongsRecommendBMusic> {
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

class SongsRecommendPrivilege with JsonConvert<SongsRecommendPrivilege> {
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
