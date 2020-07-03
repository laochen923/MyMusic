import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class CommentHotWallEntity with JsonConvert<CommentHotWallEntity> {
	int code;
	String message;
	List<CommentHotWallData> data;
}

class CommentHotWallData with JsonConvert<CommentHotWallData> {
	int id;
	String threadId;
	String content;
	int time;
	CommentHotWallDataSimpleUserInfo simpleUserInfo;
	int likedCount;
	int replyCount;
	CommentHotWallDataSimpleResourceInfo simpleResourceInfo;
	bool liked;
}

class CommentHotWallDataSimpleUserInfo with JsonConvert<CommentHotWallDataSimpleUserInfo> {
	int userId;
	String nickname;
	String avatar;
	bool followed;
	int userType;
}

class CommentHotWallDataSimpleResourceInfo with JsonConvert<CommentHotWallDataSimpleResourceInfo> {
	int songId;
	String threadId;
	String name;
	List<CommantHotWallDataSimpleResourceInfoArtists> artists;
	String songCoverUrl;
	CommentHotWallDataSimpleResourceInfoSong song;
	CommentHotWallDataSimpleResourceInfoPrivilege privilege;
}

class CommantHotWallDataSimpleResourceInfoArtists with JsonConvert<CommantHotWallDataSimpleResourceInfoArtists> {
	int id;
	String name;
}

class CommentHotWallDataSimpleResourceInfoSong with JsonConvert<CommentHotWallDataSimpleResourceInfoSong> {
	String name;
	int id;
	int pst;
	int t;
	List<CommantHotWallDataSimpleResourceInfoSongAr> ar;
	List<String> alia;
	int pop;
	int st;
	String rt;
	int fee;
	int v;
	dynamic crbt;
	String cf;
	CommentHotWallDataSimpleResourceInfoSongAl al;
	int dt;
	CommentHotWallDataSimpleResourceInfoSongH h;
	CommentHotWallDataSimpleResourceInfoSongM m;
	CommentHotWallDataSimpleResourceInfoSongL l;
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
	int mst;
	int cp;
	int mv;
	int rtype;
	dynamic rurl;
	int publishTime;
}

class CommantHotWallDataSimpleResourceInfoSongAr with JsonConvert<CommantHotWallDataSimpleResourceInfoSongAr> {
	int id;
	String name;
	List<dynamic> tns;
	List<dynamic> alias;
}

class CommentHotWallDataSimpleResourceInfoSongAl with JsonConvert<CommentHotWallDataSimpleResourceInfoSongAl> {
	int id;
	String name;
	String picUrl;
	List<dynamic> tns;
	@JSONField(name: "pic_str")
	String picStr;
	int pic;
}

class CommentHotWallDataSimpleResourceInfoSongH with JsonConvert<CommentHotWallDataSimpleResourceInfoSongH> {
	int br;
	int fid;
	int size;
	int vd;
}

class CommentHotWallDataSimpleResourceInfoSongM with JsonConvert<CommentHotWallDataSimpleResourceInfoSongM> {
	int br;
	int fid;
	int size;
	int vd;
}

class CommentHotWallDataSimpleResourceInfoSongL with JsonConvert<CommentHotWallDataSimpleResourceInfoSongL> {
	int br;
	int fid;
	int size;
	int vd;
}

class CommentHotWallDataSimpleResourceInfoPrivilege with JsonConvert<CommentHotWallDataSimpleResourceInfoPrivilege> {
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
