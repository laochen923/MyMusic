import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class BannerEntity with JsonConvert<BannerEntity> {
	List<BannerBanner> banners;
	int code;
}

class BannerBanner with JsonConvert<BannerBanner> {
	String pic;
	int targetId;
	dynamic adid;
	int targetType;
	String titleColor;
	String typeTitle;
	String url;
	dynamic adurlV2;
	bool exclusive;
	dynamic monitorImpress;
	dynamic monitorClick;
	dynamic monitorType;
	List<dynamic> monitorImpressList;
	List<dynamic> monitorClickList;
	dynamic monitorBlackList;
	dynamic extMonitor;
	dynamic extMonitorInfo;
	dynamic adSource;
	dynamic adLocation;
	String encodeId;
	dynamic program;
	dynamic event;
	dynamic video;
	dynamic dynamicVideoData;
	BannerBannersSong song;
	String bannerId;
	dynamic alg;
	String scm;
	String requestId;
	bool showAdTag;
	dynamic pid;
	dynamic showContext;
	dynamic adDispatchJson;
}

class BannerBannersSong with JsonConvert<BannerBannersSong> {
	String name;
	int id;
	int pst;
	int t;
	List<BannerBannersSongAr> ar;
	List<dynamic> alia;
	int pop;
	int st;
	String rt;
	int fee;
	int v;
	dynamic crbt;
	String cf;
	BannerBannersSongAl al;
	int dt;
	BannerBannersSongH h;
	BannerBannersSongM m;
	BannerBannersSongL l;
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
	BannerBannersSongPrivilege privilege;
}

class BannerBannersSongAr with JsonConvert<BannerBannersSongAr> {
	int id;
	String name;
	List<dynamic> tns;
	List<dynamic> alias;
}

class BannerBannersSongAl with JsonConvert<BannerBannersSongAl> {
	int id;
	String name;
	String picUrl;
	List<dynamic> tns;
	@JSONField(name: "pic_str")
	String picStr;
	int pic;
}

class BannerBannersSongH with JsonConvert<BannerBannersSongH> {
	int br;
	int fid;
	int size;
	int vd;
}

class BannerBannersSongM with JsonConvert<BannerBannersSongM> {
	int br;
	int fid;
	int size;
	int vd;
}

class BannerBannersSongL with JsonConvert<BannerBannersSongL> {
	int br;
	int fid;
	int size;
	int vd;
}

class BannerBannersSongPrivilege with JsonConvert<BannerBannersSongPrivilege> {
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
