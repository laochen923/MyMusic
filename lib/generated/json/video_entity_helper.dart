import 'package:mymusic/video/entity/video_entity.dart';

videoEntityFromJson(VideoEntity data, Map<String, dynamic> json) {
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['hasmore'] != null) {
		data.hasmore = json['hasmore'];
	}
	if (json['datas'] != null) {
		data.datas = new List<VideoData>();
		(json['datas'] as List).forEach((v) {
			data.datas.add(new VideoData().fromJson(v));
		});
	}
	if (json['rcmdLimit'] != null) {
		data.rcmdLimit = json['rcmdLimit']?.toInt();
	}
	return data;
}

Map<String, dynamic> videoEntityToJson(VideoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	data['hasmore'] = entity.hasmore;
	if (entity.datas != null) {
		data['datas'] =  entity.datas.map((v) => v.toJson()).toList();
	}
	data['rcmdLimit'] = entity.rcmdLimit;
	return data;
}

videoDataFromJson(VideoData data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['displayed'] != null) {
		data.displayed = json['displayed'];
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	if (json['extAlg'] != null) {
		data.extAlg = json['extAlg'];
	}
	if (json['data'] != null) {
		data.data = new VideoDatasData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> videoDataToJson(VideoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['displayed'] = entity.displayed;
	data['alg'] = entity.alg;
	data['extAlg'] = entity.extAlg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

videoDatasDataFromJson(VideoDatasData data, Map<String, dynamic> json) {
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	if (json['scm'] != null) {
		data.scm = json['scm']?.toString();
	}
	if (json['threadId'] != null) {
		data.threadId = json['threadId']?.toString();
	}
	if (json['coverUrl'] != null) {
		data.coverUrl = json['coverUrl']?.toString();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toInt();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['commentCount'] != null) {
		data.commentCount = json['commentCount']?.toInt();
	}
	if (json['shareCount'] != null) {
		data.shareCount = json['shareCount']?.toInt();
	}
	if (json['resolutions'] != null) {
		data.resolutions = new List<VideoDatasDataResolution>();
		(json['resolutions'] as List).forEach((v) {
			data.resolutions.add(new VideoDatasDataResolution().fromJson(v));
		});
	}
	if (json['creator'] != null) {
		data.creator = new VideoDatasDataCreator().fromJson(json['creator']);
	}
	if (json['urlInfo'] != null) {
		data.urlInfo = new VideoDatasDataUrlInfo().fromJson(json['urlInfo']);
	}
	if (json['videoGroup'] != null) {
		data.videoGroup = new List<VideoDatasDataVideoGroup>();
		(json['videoGroup'] as List).forEach((v) {
			data.videoGroup.add(new VideoDatasDataVideoGroup().fromJson(v));
		});
	}
	if (json['previewUrl'] != null) {
		data.previewUrl = json['previewUrl'];
	}
	if (json['previewDurationms'] != null) {
		data.previewDurationms = json['previewDurationms']?.toInt();
	}
	if (json['hasRelatedGameAd'] != null) {
		data.hasRelatedGameAd = json['hasRelatedGameAd'];
	}
	if (json['markTypes'] != null) {
		data.markTypes = json['markTypes'];
	}
	if (json['relateSong'] != null) {
		data.relateSong = new List<VideoDatasDataRelateSong>();
		(json['relateSong'] as List).forEach((v) {
			data.relateSong.add(new VideoDatasDataRelateSong().fromJson(v));
		});
	}
	if (json['relatedInfo'] != null) {
		data.relatedInfo = json['relatedInfo'];
	}
	if (json['videoUserLiveInfo'] != null) {
		data.videoUserLiveInfo = json['videoUserLiveInfo'];
	}
	if (json['vid'] != null) {
		data.vid = json['vid']?.toString();
	}
	if (json['durationms'] != null) {
		data.durationms = json['durationms']?.toInt();
	}
	if (json['playTime'] != null) {
		data.playTime = json['playTime']?.toInt();
	}
	if (json['praisedCount'] != null) {
		data.praisedCount = json['praisedCount']?.toInt();
	}
	if (json['praised'] != null) {
		data.praised = json['praised'];
	}
	if (json['subscribed'] != null) {
		data.subscribed = json['subscribed'];
	}
	return data;
}

Map<String, dynamic> videoDatasDataToJson(VideoDatasData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['alg'] = entity.alg;
	data['scm'] = entity.scm;
	data['threadId'] = entity.threadId;
	data['coverUrl'] = entity.coverUrl;
	data['height'] = entity.height;
	data['width'] = entity.width;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['commentCount'] = entity.commentCount;
	data['shareCount'] = entity.shareCount;
	if (entity.resolutions != null) {
		data['resolutions'] =  entity.resolutions.map((v) => v.toJson()).toList();
	}
	if (entity.creator != null) {
		data['creator'] = entity.creator.toJson();
	}
	if (entity.urlInfo != null) {
		data['urlInfo'] = entity.urlInfo.toJson();
	}
	if (entity.videoGroup != null) {
		data['videoGroup'] =  entity.videoGroup.map((v) => v.toJson()).toList();
	}
	data['previewUrl'] = entity.previewUrl;
	data['previewDurationms'] = entity.previewDurationms;
	data['hasRelatedGameAd'] = entity.hasRelatedGameAd;
	data['markTypes'] = entity.markTypes;
	if (entity.relateSong != null) {
		data['relateSong'] =  entity.relateSong.map((v) => v.toJson()).toList();
	}
	data['relatedInfo'] = entity.relatedInfo;
	data['videoUserLiveInfo'] = entity.videoUserLiveInfo;
	data['vid'] = entity.vid;
	data['durationms'] = entity.durationms;
	data['playTime'] = entity.playTime;
	data['praisedCount'] = entity.praisedCount;
	data['praised'] = entity.praised;
	data['subscribed'] = entity.subscribed;
	return data;
}

videoDatasDataResolutionFromJson(VideoDatasDataResolution data, Map<String, dynamic> json) {
	if (json['resolution'] != null) {
		data.resolution = json['resolution']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	return data;
}

Map<String, dynamic> videoDatasDataResolutionToJson(VideoDatasDataResolution entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resolution'] = entity.resolution;
	data['size'] = entity.size;
	return data;
}

videoDatasDataCreatorFromJson(VideoDatasDataCreator data, Map<String, dynamic> json) {
	if (json['defaultAvatar'] != null) {
		data.defaultAvatar = json['defaultAvatar'];
	}
	if (json['province'] != null) {
		data.province = json['province']?.toInt();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toInt();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['detailDescription'] != null) {
		data.detailDescription = json['detailDescription']?.toString();
	}
	if (json['avatarImgId'] != null) {
		data.avatarImgId = json['avatarImgId']?.toInt();
	}
	if (json['backgroundImgId'] != null) {
		data.backgroundImgId = json['backgroundImgId']?.toInt();
	}
	if (json['backgroundUrl'] != null) {
		data.backgroundUrl = json['backgroundUrl']?.toString();
	}
	if (json['authority'] != null) {
		data.authority = json['authority']?.toInt();
	}
	if (json['mutual'] != null) {
		data.mutual = json['mutual'];
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['experts'] != null) {
		data.experts = new VideoDatasDataCreatorExperts().fromJson(json['experts']);
	}
	if (json['djStatus'] != null) {
		data.djStatus = json['djStatus']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['remarkName'] != null) {
		data.remarkName = json['remarkName'];
	}
	if (json['avatarImgIdStr'] != null) {
		data.avatarImgIdStr = json['avatarImgIdStr']?.toString();
	}
	if (json['backgroundImgIdStr'] != null) {
		data.backgroundImgIdStr = json['backgroundImgIdStr']?.toString();
	}
	if (json['avatarImgId_str'] != null) {
		data.avatarimgidStr = json['avatarImgId_str']?.toString();
	}
	return data;
}

Map<String, dynamic> videoDatasDataCreatorToJson(VideoDatasDataCreator entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['defaultAvatar'] = entity.defaultAvatar;
	data['province'] = entity.province;
	data['authStatus'] = entity.authStatus;
	data['followed'] = entity.followed;
	data['avatarUrl'] = entity.avatarUrl;
	data['accountStatus'] = entity.accountStatus;
	data['gender'] = entity.gender;
	data['city'] = entity.city;
	data['birthday'] = entity.birthday;
	data['userId'] = entity.userId;
	data['userType'] = entity.userType;
	data['nickname'] = entity.nickname;
	data['signature'] = entity.signature;
	data['description'] = entity.description;
	data['detailDescription'] = entity.detailDescription;
	data['avatarImgId'] = entity.avatarImgId;
	data['backgroundImgId'] = entity.backgroundImgId;
	data['backgroundUrl'] = entity.backgroundUrl;
	data['authority'] = entity.authority;
	data['mutual'] = entity.mutual;
	data['expertTags'] = entity.expertTags;
	if (entity.experts != null) {
		data['experts'] = entity.experts.toJson();
	}
	data['djStatus'] = entity.djStatus;
	data['vipType'] = entity.vipType;
	data['remarkName'] = entity.remarkName;
	data['avatarImgIdStr'] = entity.avatarImgIdStr;
	data['backgroundImgIdStr'] = entity.backgroundImgIdStr;
	data['avatarImgId_str'] = entity.avatarimgidStr;
	return data;
}

videoDatasDataCreatorExpertsFromJson(VideoDatasDataCreatorExperts data, Map<String, dynamic> json) {
	if (json['1'] != null) {
		data.x1 = json['1']?.toString();
	}
	if (json['2'] != null) {
		data.x2 = json['2']?.toString();
	}
	return data;
}

Map<String, dynamic> videoDatasDataCreatorExpertsToJson(VideoDatasDataCreatorExperts entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	data['2'] = entity.x2;
	return data;
}

videoDatasDataUrlInfoFromJson(VideoDatasDataUrlInfo data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['validityTime'] != null) {
		data.validityTime = json['validityTime']?.toInt();
	}
	if (json['needPay'] != null) {
		data.needPay = json['needPay'];
	}
	if (json['payInfo'] != null) {
		data.payInfo = json['payInfo'];
	}
	if (json['r'] != null) {
		data.r = json['r']?.toInt();
	}
	return data;
}

Map<String, dynamic> videoDatasDataUrlInfoToJson(VideoDatasDataUrlInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['url'] = entity.url;
	data['size'] = entity.size;
	data['validityTime'] = entity.validityTime;
	data['needPay'] = entity.needPay;
	data['payInfo'] = entity.payInfo;
	data['r'] = entity.r;
	return data;
}

videoDatasDataVideoGroupFromJson(VideoDatasDataVideoGroup data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	return data;
}

Map<String, dynamic> videoDatasDataVideoGroupToJson(VideoDatasDataVideoGroup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['alg'] = entity.alg;
	return data;
}

videoDatasDataRelateSongFromJson(VideoDatasDataRelateSong data, Map<String, dynamic> json) {
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
		data.ar = new List<VideoDatasDataRelateSongAr>();
		(json['ar'] as List).forEach((v) {
			data.ar.add(new VideoDatasDataRelateSongAr().fromJson(v));
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
		data.al = new VideoDatasDataRelateSongAl().fromJson(json['al']);
	}
	if (json['dt'] != null) {
		data.dt = json['dt']?.toInt();
	}
	if (json['h'] != null) {
		data.h = new VideoDatasDataRelateSongH().fromJson(json['h']);
	}
	if (json['m'] != null) {
		data.m = new VideoDatasDataRelateSongM().fromJson(json['m']);
	}
	if (json['l'] != null) {
		data.l = new VideoDatasDataRelateSongL().fromJson(json['l']);
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
	if (json['mst'] != null) {
		data.mst = json['mst']?.toInt();
	}
	if (json['cp'] != null) {
		data.cp = json['cp']?.toInt();
	}
	if (json['mv'] != null) {
		data.mv = json['mv']?.toInt();
	}
	if (json['rtype'] != null) {
		data.rtype = json['rtype']?.toInt();
	}
	if (json['rurl'] != null) {
		data.rurl = json['rurl'];
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toInt();
	}
	if (json['privilege'] != null) {
		data.privilege = new VideoDatasDataRelateSongPrivilege().fromJson(json['privilege']);
	}
	return data;
}

Map<String, dynamic> videoDatasDataRelateSongToJson(VideoDatasDataRelateSong entity) {
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
	data['mst'] = entity.mst;
	data['cp'] = entity.cp;
	data['mv'] = entity.mv;
	data['rtype'] = entity.rtype;
	data['rurl'] = entity.rurl;
	data['publishTime'] = entity.publishTime;
	if (entity.privilege != null) {
		data['privilege'] = entity.privilege.toJson();
	}
	return data;
}

videoDatasDataRelateSongArFromJson(VideoDatasDataRelateSongAr data, Map<String, dynamic> json) {
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

Map<String, dynamic> videoDatasDataRelateSongArToJson(VideoDatasDataRelateSongAr entity) {
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

videoDatasDataRelateSongAlFromJson(VideoDatasDataRelateSongAl data, Map<String, dynamic> json) {
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

Map<String, dynamic> videoDatasDataRelateSongAlToJson(VideoDatasDataRelateSongAl entity) {
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

videoDatasDataRelateSongHFromJson(VideoDatasDataRelateSongH data, Map<String, dynamic> json) {
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

Map<String, dynamic> videoDatasDataRelateSongHToJson(VideoDatasDataRelateSongH entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

videoDatasDataRelateSongMFromJson(VideoDatasDataRelateSongM data, Map<String, dynamic> json) {
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

Map<String, dynamic> videoDatasDataRelateSongMToJson(VideoDatasDataRelateSongM entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

videoDatasDataRelateSongLFromJson(VideoDatasDataRelateSongL data, Map<String, dynamic> json) {
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

Map<String, dynamic> videoDatasDataRelateSongLToJson(VideoDatasDataRelateSongL entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

videoDatasDataRelateSongPrivilegeFromJson(VideoDatasDataRelateSongPrivilege data, Map<String, dynamic> json) {
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

Map<String, dynamic> videoDatasDataRelateSongPrivilegeToJson(VideoDatasDataRelateSongPrivilege entity) {
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