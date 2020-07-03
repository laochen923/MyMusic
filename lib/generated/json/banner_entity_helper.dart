import 'package:mymusic/discover/entity/banner_entity.dart';

bannerEntityFromJson(BannerEntity data, Map<String, dynamic> json) {
	if (json['banners'] != null) {
		data.banners = new List<BannerBanner>();
		(json['banners'] as List).forEach((v) {
			data.banners.add(new BannerBanner().fromJson(v));
		});
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> bannerEntityToJson(BannerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.banners != null) {
		data['banners'] =  entity.banners.map((v) => v.toJson()).toList();
	}
	data['code'] = entity.code;
	return data;
}

bannerBannerFromJson(BannerBanner data, Map<String, dynamic> json) {
	if (json['pic'] != null) {
		data.pic = json['pic']?.toString();
	}
	if (json['targetId'] != null) {
		data.targetId = json['targetId']?.toInt();
	}
	if (json['adid'] != null) {
		data.adid = json['adid'];
	}
	if (json['targetType'] != null) {
		data.targetType = json['targetType']?.toInt();
	}
	if (json['titleColor'] != null) {
		data.titleColor = json['titleColor']?.toString();
	}
	if (json['typeTitle'] != null) {
		data.typeTitle = json['typeTitle']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['adurlV2'] != null) {
		data.adurlV2 = json['adurlV2'];
	}
	if (json['exclusive'] != null) {
		data.exclusive = json['exclusive'];
	}
	if (json['monitorImpress'] != null) {
		data.monitorImpress = json['monitorImpress'];
	}
	if (json['monitorClick'] != null) {
		data.monitorClick = json['monitorClick'];
	}
	if (json['monitorType'] != null) {
		data.monitorType = json['monitorType'];
	}
	if (json['monitorImpressList'] != null) {
		data.monitorImpressList = new List<dynamic>();
		data.monitorImpressList.addAll(json['monitorImpressList']);
	}
	if (json['monitorClickList'] != null) {
		data.monitorClickList = new List<dynamic>();
		data.monitorClickList.addAll(json['monitorClickList']);
	}
	if (json['monitorBlackList'] != null) {
		data.monitorBlackList = json['monitorBlackList'];
	}
	if (json['extMonitor'] != null) {
		data.extMonitor = json['extMonitor'];
	}
	if (json['extMonitorInfo'] != null) {
		data.extMonitorInfo = json['extMonitorInfo'];
	}
	if (json['adSource'] != null) {
		data.adSource = json['adSource'];
	}
	if (json['adLocation'] != null) {
		data.adLocation = json['adLocation'];
	}
	if (json['encodeId'] != null) {
		data.encodeId = json['encodeId']?.toString();
	}
	if (json['program'] != null) {
		data.program = json['program'];
	}
	if (json['event'] != null) {
		data.event = json['event'];
	}
	if (json['video'] != null) {
		data.video = json['video'];
	}
	if (json['dynamicVideoData'] != null) {
		data.dynamicVideoData = json['dynamicVideoData'];
	}
	if (json['song'] != null) {
		data.song = new BannerBannersSong().fromJson(json['song']);
	}
	if (json['bannerId'] != null) {
		data.bannerId = json['bannerId']?.toString();
	}
	if (json['alg'] != null) {
		data.alg = json['alg'];
	}
	if (json['scm'] != null) {
		data.scm = json['scm']?.toString();
	}
	if (json['requestId'] != null) {
		data.requestId = json['requestId']?.toString();
	}
	if (json['showAdTag'] != null) {
		data.showAdTag = json['showAdTag'];
	}
	if (json['pid'] != null) {
		data.pid = json['pid'];
	}
	if (json['showContext'] != null) {
		data.showContext = json['showContext'];
	}
	if (json['adDispatchJson'] != null) {
		data.adDispatchJson = json['adDispatchJson'];
	}
	return data;
}

Map<String, dynamic> bannerBannerToJson(BannerBanner entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pic'] = entity.pic;
	data['targetId'] = entity.targetId;
	data['adid'] = entity.adid;
	data['targetType'] = entity.targetType;
	data['titleColor'] = entity.titleColor;
	data['typeTitle'] = entity.typeTitle;
	data['url'] = entity.url;
	data['adurlV2'] = entity.adurlV2;
	data['exclusive'] = entity.exclusive;
	data['monitorImpress'] = entity.monitorImpress;
	data['monitorClick'] = entity.monitorClick;
	data['monitorType'] = entity.monitorType;
	if (entity.monitorImpressList != null) {
		data['monitorImpressList'] =  [];
	}
	if (entity.monitorClickList != null) {
		data['monitorClickList'] =  [];
	}
	data['monitorBlackList'] = entity.monitorBlackList;
	data['extMonitor'] = entity.extMonitor;
	data['extMonitorInfo'] = entity.extMonitorInfo;
	data['adSource'] = entity.adSource;
	data['adLocation'] = entity.adLocation;
	data['encodeId'] = entity.encodeId;
	data['program'] = entity.program;
	data['event'] = entity.event;
	data['video'] = entity.video;
	data['dynamicVideoData'] = entity.dynamicVideoData;
	if (entity.song != null) {
		data['song'] = entity.song.toJson();
	}
	data['bannerId'] = entity.bannerId;
	data['alg'] = entity.alg;
	data['scm'] = entity.scm;
	data['requestId'] = entity.requestId;
	data['showAdTag'] = entity.showAdTag;
	data['pid'] = entity.pid;
	data['showContext'] = entity.showContext;
	data['adDispatchJson'] = entity.adDispatchJson;
	return data;
}

bannerBannersSongFromJson(BannerBannersSong data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['pst'] != null) {
		data.pst = json['pst']?.toInt();
	}
	if (json['t'] != null) {
		data.t = json['t']?.toInt();
	}
	if (json['ar'] != null) {
		data.ar = new List<BannerBannersSongAr>();
		(json['ar'] as List).forEach((v) {
			data.ar.add(new BannerBannersSongAr().fromJson(v));
		});
	}
	if (json['alia'] != null) {
		data.alia = new List<dynamic>();
		data.alia.addAll(json['alia']);
	}
	if (json['pop'] != null) {
		data.pop = json['pop']?.toInt();
	}
	if (json['st'] != null) {
		data.st = json['st']?.toInt();
	}
	if (json['rt'] != null) {
		data.rt = json['rt']?.toString();
	}
	if (json['fee'] != null) {
		data.fee = json['fee']?.toInt();
	}
	if (json['v'] != null) {
		data.v = json['v']?.toInt();
	}
	if (json['crbt'] != null) {
		data.crbt = json['crbt'];
	}
	if (json['cf'] != null) {
		data.cf = json['cf']?.toString();
	}
	if (json['al'] != null) {
		data.al = new BannerBannersSongAl().fromJson(json['al']);
	}
	if (json['dt'] != null) {
		data.dt = json['dt']?.toInt();
	}
	if (json['h'] != null) {
		data.h = new BannerBannersSongH().fromJson(json['h']);
	}
	if (json['m'] != null) {
		data.m = new BannerBannersSongM().fromJson(json['m']);
	}
	if (json['l'] != null) {
		data.l = new BannerBannersSongL().fromJson(json['l']);
	}
	if (json['a'] != null) {
		data.a = json['a'];
	}
	if (json['cd'] != null) {
		data.cd = json['cd']?.toString();
	}
	if (json['no'] != null) {
		data.no = json['no']?.toInt();
	}
	if (json['rtUrl'] != null) {
		data.rtUrl = json['rtUrl'];
	}
	if (json['ftype'] != null) {
		data.ftype = json['ftype']?.toInt();
	}
	if (json['rtUrls'] != null) {
		data.rtUrls = new List<dynamic>();
		data.rtUrls.addAll(json['rtUrls']);
	}
	if (json['djId'] != null) {
		data.djId = json['djId']?.toInt();
	}
	if (json['copyright'] != null) {
		data.copyright = json['copyright']?.toInt();
	}
	if (json['s_id'] != null) {
		data.sId = json['s_id']?.toInt();
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	if (json['rtype'] != null) {
		data.rtype = json['rtype']?.toInt();
	}
	if (json['rurl'] != null) {
		data.rurl = json['rurl'];
	}
	if (json['mst'] != null) {
		data.mst = json['mst']?.toInt();
	}
	if (json['cp'] != null) {
		data.cp = json['cp']?.toInt();
	}
	if (json['mv'] != null) {
		data.mv = json['mv']?.toInt();
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toInt();
	}
	if (json['privilege'] != null) {
		data.privilege = new BannerBannersSongPrivilege().fromJson(json['privilege']);
	}
	return data;
}

Map<String, dynamic> bannerBannersSongToJson(BannerBannersSong entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['pst'] = entity.pst;
	data['t'] = entity.t;
	if (entity.ar != null) {
		data['ar'] =  entity.ar.map((v) => v.toJson()).toList();
	}
	if (entity.alia != null) {
		data['alia'] =  [];
	}
	data['pop'] = entity.pop;
	data['st'] = entity.st;
	data['rt'] = entity.rt;
	data['fee'] = entity.fee;
	data['v'] = entity.v;
	data['crbt'] = entity.crbt;
	data['cf'] = entity.cf;
	if (entity.al != null) {
		data['al'] = entity.al.toJson();
	}
	data['dt'] = entity.dt;
	if (entity.h != null) {
		data['h'] = entity.h.toJson();
	}
	if (entity.m != null) {
		data['m'] = entity.m.toJson();
	}
	if (entity.l != null) {
		data['l'] = entity.l.toJson();
	}
	data['a'] = entity.a;
	data['cd'] = entity.cd;
	data['no'] = entity.no;
	data['rtUrl'] = entity.rtUrl;
	data['ftype'] = entity.ftype;
	if (entity.rtUrls != null) {
		data['rtUrls'] =  [];
	}
	data['djId'] = entity.djId;
	data['copyright'] = entity.copyright;
	data['s_id'] = entity.sId;
	data['mark'] = entity.mark;
	data['rtype'] = entity.rtype;
	data['rurl'] = entity.rurl;
	data['mst'] = entity.mst;
	data['cp'] = entity.cp;
	data['mv'] = entity.mv;
	data['publishTime'] = entity.publishTime;
	if (entity.privilege != null) {
		data['privilege'] = entity.privilege.toJson();
	}
	return data;
}

bannerBannersSongArFromJson(BannerBannersSongAr data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['tns'] != null) {
		data.tns = new List<dynamic>();
		data.tns.addAll(json['tns']);
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	return data;
}

Map<String, dynamic> bannerBannersSongArToJson(BannerBannersSongAr entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	if (entity.tns != null) {
		data['tns'] =  [];
	}
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	return data;
}

bannerBannersSongAlFromJson(BannerBannersSongAl data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['tns'] != null) {
		data.tns = new List<dynamic>();
		data.tns.addAll(json['tns']);
	}
	if (json['pic_str'] != null) {
		data.picStr = json['pic_str']?.toString();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toInt();
	}
	return data;
}

Map<String, dynamic> bannerBannersSongAlToJson(BannerBannersSongAl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['picUrl'] = entity.picUrl;
	if (entity.tns != null) {
		data['tns'] =  [];
	}
	data['pic_str'] = entity.picStr;
	data['pic'] = entity.pic;
	return data;
}

bannerBannersSongHFromJson(BannerBannersSongH data, Map<String, dynamic> json) {
	if (json['br'] != null) {
		data.br = json['br']?.toInt();
	}
	if (json['fid'] != null) {
		data.fid = json['fid']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['vd'] != null) {
		data.vd = json['vd']?.toInt();
	}
	return data;
}

Map<String, dynamic> bannerBannersSongHToJson(BannerBannersSongH entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

bannerBannersSongMFromJson(BannerBannersSongM data, Map<String, dynamic> json) {
	if (json['br'] != null) {
		data.br = json['br']?.toInt();
	}
	if (json['fid'] != null) {
		data.fid = json['fid']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['vd'] != null) {
		data.vd = json['vd']?.toInt();
	}
	return data;
}

Map<String, dynamic> bannerBannersSongMToJson(BannerBannersSongM entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

bannerBannersSongLFromJson(BannerBannersSongL data, Map<String, dynamic> json) {
	if (json['br'] != null) {
		data.br = json['br']?.toInt();
	}
	if (json['fid'] != null) {
		data.fid = json['fid']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['vd'] != null) {
		data.vd = json['vd']?.toInt();
	}
	return data;
}

Map<String, dynamic> bannerBannersSongLToJson(BannerBannersSongL entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

bannerBannersSongPrivilegeFromJson(BannerBannersSongPrivilege data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['fee'] != null) {
		data.fee = json['fee']?.toInt();
	}
	if (json['payed'] != null) {
		data.payed = json['payed']?.toInt();
	}
	if (json['st'] != null) {
		data.st = json['st']?.toInt();
	}
	if (json['pl'] != null) {
		data.pl = json['pl']?.toInt();
	}
	if (json['dl'] != null) {
		data.dl = json['dl']?.toInt();
	}
	if (json['sp'] != null) {
		data.sp = json['sp']?.toInt();
	}
	if (json['cp'] != null) {
		data.cp = json['cp']?.toInt();
	}
	if (json['subp'] != null) {
		data.subp = json['subp']?.toInt();
	}
	if (json['cs'] != null) {
		data.cs = json['cs'];
	}
	if (json['maxbr'] != null) {
		data.maxbr = json['maxbr']?.toInt();
	}
	if (json['fl'] != null) {
		data.fl = json['fl']?.toInt();
	}
	if (json['toast'] != null) {
		data.toast = json['toast'];
	}
	if (json['flag'] != null) {
		data.flag = json['flag']?.toInt();
	}
	if (json['preSell'] != null) {
		data.preSell = json['preSell'];
	}
	return data;
}

Map<String, dynamic> bannerBannersSongPrivilegeToJson(BannerBannersSongPrivilege entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['fee'] = entity.fee;
	data['payed'] = entity.payed;
	data['st'] = entity.st;
	data['pl'] = entity.pl;
	data['dl'] = entity.dl;
	data['sp'] = entity.sp;
	data['cp'] = entity.cp;
	data['subp'] = entity.subp;
	data['cs'] = entity.cs;
	data['maxbr'] = entity.maxbr;
	data['fl'] = entity.fl;
	data['toast'] = entity.toast;
	data['flag'] = entity.flag;
	data['preSell'] = entity.preSell;
	return data;
}