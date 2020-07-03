import 'package:mymusic/discover/entity/comment_hot_wall_entity.dart';

commentHotWallEntityFromJson(CommentHotWallEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<CommentHotWallData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CommentHotWallData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> commentHotWallEntityToJson(CommentHotWallEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

commentHotWallDataFromJson(CommentHotWallData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['threadId'] != null) {
		data.threadId = json['threadId']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toInt();
	}
	if (json['simpleUserInfo'] != null) {
		data.simpleUserInfo = new CommentHotWallDataSimpleUserInfo().fromJson(json['simpleUserInfo']);
	}
	if (json['likedCount'] != null) {
		data.likedCount = json['likedCount']?.toInt();
	}
	if (json['replyCount'] != null) {
		data.replyCount = json['replyCount']?.toInt();
	}
	if (json['simpleResourceInfo'] != null) {
		data.simpleResourceInfo = new CommentHotWallDataSimpleResourceInfo().fromJson(json['simpleResourceInfo']);
	}
	if (json['liked'] != null) {
		data.liked = json['liked'];
	}
	return data;
}

Map<String, dynamic> commentHotWallDataToJson(CommentHotWallData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['threadId'] = entity.threadId;
	data['content'] = entity.content;
	data['time'] = entity.time;
	if (entity.simpleUserInfo != null) {
		data['simpleUserInfo'] = entity.simpleUserInfo.toJson();
	}
	data['likedCount'] = entity.likedCount;
	data['replyCount'] = entity.replyCount;
	if (entity.simpleResourceInfo != null) {
		data['simpleResourceInfo'] = entity.simpleResourceInfo.toJson();
	}
	data['liked'] = entity.liked;
	return data;
}

commentHotWallDataSimpleUserInfoFromJson(CommentHotWallDataSimpleUserInfo data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	return data;
}

Map<String, dynamic> commentHotWallDataSimpleUserInfoToJson(CommentHotWallDataSimpleUserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['nickname'] = entity.nickname;
	data['avatar'] = entity.avatar;
	data['followed'] = entity.followed;
	data['userType'] = entity.userType;
	return data;
}

commentHotWallDataSimpleResourceInfoFromJson(CommentHotWallDataSimpleResourceInfo data, Map<String, dynamic> json) {
	if (json['songId'] != null) {
		data.songId = json['songId']?.toInt();
	}
	if (json['threadId'] != null) {
		data.threadId = json['threadId']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['artists'] != null) {
		data.artists = new List<CommantHotWallDataSimpleResourceInfoArtists>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new CommantHotWallDataSimpleResourceInfoArtists().fromJson(v));
		});
	}
	if (json['songCoverUrl'] != null) {
		data.songCoverUrl = json['songCoverUrl']?.toString();
	}
	if (json['song'] != null) {
		data.song = new CommentHotWallDataSimpleResourceInfoSong().fromJson(json['song']);
	}
	if (json['privilege'] != null) {
		data.privilege = new CommentHotWallDataSimpleResourceInfoPrivilege().fromJson(json['privilege']);
	}
	return data;
}

Map<String, dynamic> commentHotWallDataSimpleResourceInfoToJson(CommentHotWallDataSimpleResourceInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['songId'] = entity.songId;
	data['threadId'] = entity.threadId;
	data['name'] = entity.name;
	if (entity.artists != null) {
		data['artists'] =  entity.artists.map((v) => v.toJson()).toList();
	}
	data['songCoverUrl'] = entity.songCoverUrl;
	if (entity.song != null) {
		data['song'] = entity.song.toJson();
	}
	if (entity.privilege != null) {
		data['privilege'] = entity.privilege.toJson();
	}
	return data;
}

commantHotWallDataSimpleResourceInfoArtistsFromJson(CommantHotWallDataSimpleResourceInfoArtists data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> commantHotWallDataSimpleResourceInfoArtistsToJson(CommantHotWallDataSimpleResourceInfoArtists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

commentHotWallDataSimpleResourceInfoSongFromJson(CommentHotWallDataSimpleResourceInfoSong data, Map<String, dynamic> json) {
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
		data.ar = new List<CommantHotWallDataSimpleResourceInfoSongAr>();
		(json['ar'] as List).forEach((v) {
			data.ar.add(new CommantHotWallDataSimpleResourceInfoSongAr().fromJson(v));
		});
	}
	if (json['alia'] != null) {
		data.alia = json['alia']?.map((v) => v?.toString())?.toList()?.cast<String>();
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
		data.al = new CommentHotWallDataSimpleResourceInfoSongAl().fromJson(json['al']);
	}
	if (json['dt'] != null) {
		data.dt = json['dt']?.toInt();
	}
	if (json['h'] != null) {
		data.h = new CommentHotWallDataSimpleResourceInfoSongH().fromJson(json['h']);
	}
	if (json['m'] != null) {
		data.m = new CommentHotWallDataSimpleResourceInfoSongM().fromJson(json['m']);
	}
	if (json['l'] != null) {
		data.l = new CommentHotWallDataSimpleResourceInfoSongL().fromJson(json['l']);
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
	return data;
}

Map<String, dynamic> commentHotWallDataSimpleResourceInfoSongToJson(CommentHotWallDataSimpleResourceInfoSong entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['pst'] = entity.pst;
	data['t'] = entity.t;
	if (entity.ar != null) {
		data['ar'] =  entity.ar.map((v) => v.toJson()).toList();
	}
	data['alia'] = entity.alia;
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
	return data;
}

commantHotWallDataSimpleResourceInfoSongArFromJson(CommantHotWallDataSimpleResourceInfoSongAr data, Map<String, dynamic> json) {
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

Map<String, dynamic> commantHotWallDataSimpleResourceInfoSongArToJson(CommantHotWallDataSimpleResourceInfoSongAr entity) {
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

commentHotWallDataSimpleResourceInfoSongAlFromJson(CommentHotWallDataSimpleResourceInfoSongAl data, Map<String, dynamic> json) {
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

Map<String, dynamic> commentHotWallDataSimpleResourceInfoSongAlToJson(CommentHotWallDataSimpleResourceInfoSongAl entity) {
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

commentHotWallDataSimpleResourceInfoSongHFromJson(CommentHotWallDataSimpleResourceInfoSongH data, Map<String, dynamic> json) {
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

Map<String, dynamic> commentHotWallDataSimpleResourceInfoSongHToJson(CommentHotWallDataSimpleResourceInfoSongH entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

commentHotWallDataSimpleResourceInfoSongMFromJson(CommentHotWallDataSimpleResourceInfoSongM data, Map<String, dynamic> json) {
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

Map<String, dynamic> commentHotWallDataSimpleResourceInfoSongMToJson(CommentHotWallDataSimpleResourceInfoSongM entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

commentHotWallDataSimpleResourceInfoSongLFromJson(CommentHotWallDataSimpleResourceInfoSongL data, Map<String, dynamic> json) {
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

Map<String, dynamic> commentHotWallDataSimpleResourceInfoSongLToJson(CommentHotWallDataSimpleResourceInfoSongL entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['br'] = entity.br;
	data['fid'] = entity.fid;
	data['size'] = entity.size;
	data['vd'] = entity.vd;
	return data;
}

commentHotWallDataSimpleResourceInfoPrivilegeFromJson(CommentHotWallDataSimpleResourceInfoPrivilege data, Map<String, dynamic> json) {
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

Map<String, dynamic> commentHotWallDataSimpleResourceInfoPrivilegeToJson(CommentHotWallDataSimpleResourceInfoPrivilege entity) {
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