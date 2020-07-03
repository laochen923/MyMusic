import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class NewSongEntity with JsonConvert<NewSongEntity> {
	int code;
	int category;
	List<NewSongResult> result;
}

class NewSongResult with JsonConvert<NewSongResult> {
	int id;
	int type;
	String name;
	dynamic copywriter;
	String picUrl;
	bool canDislike;
	dynamic trackNumberUpdateTime;
	NewSongResultSong song;
	String alg;
}

class NewSongResultSong with JsonConvert<NewSongResultSong> {
	String name;
	int id;
	int position;
	List<dynamic> alias;
	int status;
	int fee;
	int copyrightId;
	String disc;
	int no;
	List<NewSongResultSongArtist> artists;
	NewSongResultSongAlbum album;
	bool starred;
	int popularity;
	int score;
	int starredNum;
	int duration;
	int playedNum;
	int dayPlays;
	int hearTime;
	String ringtone;
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
	int mvid;
	NewSongResultSongBMusic bMusic;
	dynamic mp3Url;
	int rtype;
	dynamic rurl;
	NewSongResultSongHMusic hMusic;
	NewSongResultSongMMusic mMusic;
	NewSongResultSongLMusic lMusic;
	bool exclusive;
	NewSongResultSongPrivilege privilege;
}

class NewSongResultSongArtist with JsonConvert<NewSongResultSongArtist> {
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

class NewSongResultSongAlbum with JsonConvert<NewSongResultSongAlbum> {
	String name;
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
	NewSongResultSongAlbumArtist artist;
	List<dynamic> songs;
	List<dynamic> alias;
	int status;
	int copyrightId;
	String commentThreadId;
	List<NewSongResultSongAlbumArtist> artists;
	String subType;
	dynamic transName;
	int mark;
	@JSONField(name: "picId_str")
	String picidStr;
}

class NewSongResultSongAlbumArtist with JsonConvert<NewSongResultSongAlbumArtist> {
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

class NewSongResultSongBMusic with JsonConvert<NewSongResultSongBMusic> {
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

class NewSongResultSongHMusic with JsonConvert<NewSongResultSongHMusic> {
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

class NewSongResultSongMMusic with JsonConvert<NewSongResultSongMMusic> {
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

class NewSongResultSongLMusic with JsonConvert<NewSongResultSongLMusic> {
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

class NewSongResultSongPrivilege with JsonConvert<NewSongResultSongPrivilege> {
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
