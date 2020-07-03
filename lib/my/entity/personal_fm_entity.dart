import 'package:mymusic/generated/json/base/json_convert_content.dart';

class PersonalFmEntity with JsonConvert<PersonalFmEntity> {
	bool popAdjust;
	List<PersonalFmData> data;
	int code;
}

class PersonalFmData with JsonConvert<PersonalFmData> {
	String name;
	int id;
	int position;
	List<dynamic> alias;
	int status;
	int fee;
	int copyrightId;
	String disc;
	int no;
	List<PersonalFmDataArtist> artists;
	PersonalFmDataAlbum album;
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
	dynamic noCopyrightRcmd;
	PersonalFmDataHMusic hMusic;
	PersonalFmDataMMusic mMusic;
	PersonalFmDataLMusic lMusic;
	PersonalFmDataBMusic bMusic;
	int mvid;
	int rtype;
	dynamic rurl;
	dynamic mp3Url;
	PersonalFmDataPrivilege privilege;
	String alg;
}

class PersonalFmDataArtist with JsonConvert<PersonalFmDataArtist> {
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

class PersonalFmDataAlbum with JsonConvert<PersonalFmDataAlbum> {
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
	PersonalFmDataAlbumArtist artist;
	List<dynamic> songs;
	List<dynamic> alias;
	int status;
	int copyrightId;
	String commentThreadId;
	List<PersonalFmDataAlbumArtist> artists;
	String subType;
	dynamic transName;
	int mark;
}

class PersonalFmDataAlbumArtist with JsonConvert<PersonalFmDataAlbumArtist> {
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

class PersonalFmDataHMusic with JsonConvert<PersonalFmDataHMusic> {
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

class PersonalFmDataMMusic with JsonConvert<PersonalFmDataMMusic> {
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

class PersonalFmDataLMusic with JsonConvert<PersonalFmDataLMusic> {
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

class PersonalFmDataBMusic with JsonConvert<PersonalFmDataBMusic> {
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

class PersonalFmDataPrivilege with JsonConvert<PersonalFmDataPrivilege> {
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
