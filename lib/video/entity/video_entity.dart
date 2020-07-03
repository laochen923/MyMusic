import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class VideoEntity with JsonConvert<VideoEntity> {
	String msg;
	int code;
	bool hasmore;
	List<VideoData> datas;
	int rcmdLimit;
}

class VideoData with JsonConvert<VideoData> {
	int type;
	bool displayed;
	String alg;
	dynamic extAlg;
	VideoDatasData data;
}

class VideoDatasData with JsonConvert<VideoDatasData> {
	String alg;
	String scm;
	String threadId;
	String coverUrl;
	int height;
	int width;
	String title;
	String description;
	int commentCount;
	int shareCount;
	List<VideoDatasDataResolution> resolutions;
	VideoDatasDataCreator creator;
	VideoDatasDataUrlInfo urlInfo;
	List<VideoDatasDataVideoGroup> videoGroup;
	dynamic previewUrl;
	int previewDurationms;
	bool hasRelatedGameAd;
	dynamic markTypes;
	List<VideoDatasDataRelateSong> relateSong;
	dynamic relatedInfo;
	dynamic videoUserLiveInfo;
	String vid;
	int durationms;
	int playTime;
	int praisedCount;
	bool praised;
	bool subscribed;
}

class VideoDatasDataResolution with JsonConvert<VideoDatasDataResolution> {
	int resolution;
	int size;
}

class VideoDatasDataCreator with JsonConvert<VideoDatasDataCreator> {
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
	VideoDatasDataCreatorExperts experts;
	int djStatus;
	int vipType;
	dynamic remarkName;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	@JSONField(name: "avatarImgId_str")
	String avatarimgidStr;
}

class VideoDatasDataCreatorExperts with JsonConvert<VideoDatasDataCreatorExperts> {
	@JSONField(name: "1")
	String x1;
	@JSONField(name: "2")
	String x2;
}

class VideoDatasDataUrlInfo with JsonConvert<VideoDatasDataUrlInfo> {
	String id;
	String url;
	int size;
	int validityTime;
	bool needPay;
	dynamic payInfo;
	int r;
}

class VideoDatasDataVideoGroup with JsonConvert<VideoDatasDataVideoGroup> {
	int id;
	String name;
	String alg;
}

class VideoDatasDataRelateSong with JsonConvert<VideoDatasDataRelateSong> {
	String name;
	int id;
	int pst;
	int t;
	List<VideoDatasDataRelateSongAr> ar;
	List<dynamic> alia;
	int pop;
	int st;
	String rt;
	int fee;
	int v;
	dynamic crbt;
	String cf;
	VideoDatasDataRelateSongAl al;
	int dt;
	VideoDatasDataRelateSongH h;
	VideoDatasDataRelateSongM m;
	VideoDatasDataRelateSongL l;
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
	VideoDatasDataRelateSongPrivilege privilege;
}

class VideoDatasDataRelateSongAr with JsonConvert<VideoDatasDataRelateSongAr> {
	int id;
	String name;
	List<dynamic> tns;
	List<dynamic> alias;
}

class VideoDatasDataRelateSongAl with JsonConvert<VideoDatasDataRelateSongAl> {
	int id;
	String name;
	String picUrl;
	List<dynamic> tns;
	@JSONField(name: "pic_str")
	String picStr;
	int pic;
}

class VideoDatasDataRelateSongH with JsonConvert<VideoDatasDataRelateSongH> {
	int br;
	int fid;
	int size;
	int vd;
}

class VideoDatasDataRelateSongM with JsonConvert<VideoDatasDataRelateSongM> {
	int br;
	int fid;
	int size;
	int vd;
}

class VideoDatasDataRelateSongL with JsonConvert<VideoDatasDataRelateSongL> {
	int br;
	int fid;
	int size;
	int vd;
}

class VideoDatasDataRelateSongPrivilege with JsonConvert<VideoDatasDataRelateSongPrivilege> {
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
