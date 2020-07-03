import 'package:mymusic/my/entity/comments_entity.dart';

commentsEntityFromJson(CommentsEntity data, Map<String, dynamic> json) {
	if (json['isMusician'] != null) {
		data.isMusician = json['isMusician'];
	}
	if (json['cnum'] != null) {
		data.cnum = json['cnum']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['topComments'] != null) {
		data.topComments = new List<dynamic>();
		data.topComments.addAll(json['topComments']);
	}
	if (json['moreHot'] != null) {
		data.moreHot = json['moreHot'];
	}
	if (json['hotComments'] != null) {
		data.hotComments = new List<dynamic>();
		data.hotComments.addAll(json['hotComments']);
	}
	if (json['commentBanner'] != null) {
		data.commentBanner = json['commentBanner'];
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['comments'] != null) {
		data.comments = new List<Comments>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new Comments().fromJson(v));
		});
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['more'] != null) {
		data.more = json['more'];
	}
	return data;
}

Map<String, dynamic> commentsEntityToJson(CommentsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['isMusician'] = entity.isMusician;
	data['cnum'] = entity.cnum;
	data['userId'] = entity.userId;
	if (entity.topComments != null) {
		data['topComments'] =  [];
	}
	data['moreHot'] = entity.moreHot;
	if (entity.hotComments != null) {
		data['hotComments'] =  [];
	}
	data['commentBanner'] = entity.commentBanner;
	data['code'] = entity.code;
	if (entity.comments != null) {
		data['comments'] =  entity.comments.map((v) => v.toJson()).toList();
	}
	data['total'] = entity.total;
	data['more'] = entity.more;
	return data;
}

commentsFromJson(Comments data, Map<String, dynamic> json) {
	if (json['user'] != null) {
		data.user = new CommentsCommentsUser().fromJson(json['user']);
	}
	if (json['beReplied'] != null) {
		data.beReplied = new List<dynamic>();
		data.beReplied.addAll(json['beReplied']);
	}
	if (json['pendantData'] != null) {
		data.pendantData = json['pendantData'];
	}
	if (json['showFloorComment'] != null) {
		data.showFloorComment = json['showFloorComment'];
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['commentId'] != null) {
		data.commentId = json['commentId']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toInt();
	}
	if (json['likedCount'] != null) {
		data.likedCount = json['likedCount']?.toInt();
	}
	if (json['expressionUrl'] != null) {
		data.expressionUrl = json['expressionUrl'];
	}
	if (json['commentLocationType'] != null) {
		data.commentLocationType = json['commentLocationType']?.toInt();
	}
	if (json['parentCommentId'] != null) {
		data.parentCommentId = json['parentCommentId']?.toInt();
	}
	if (json['decoration'] != null) {
		data.decoration = new CommentsCommentsDecoration().fromJson(json['decoration']);
	}
	if (json['repliedMark'] != null) {
		data.repliedMark = json['repliedMark'];
	}
	if (json['liked'] != null) {
		data.liked = json['liked'];
	}
	return data;
}

Map<String, dynamic> commentsToJson(Comments entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.user != null) {
		data['user'] = entity.user.toJson();
	}
	if (entity.beReplied != null) {
		data['beReplied'] =  [];
	}
	data['pendantData'] = entity.pendantData;
	data['showFloorComment'] = entity.showFloorComment;
	data['status'] = entity.status;
	data['commentId'] = entity.commentId;
	data['content'] = entity.content;
	data['time'] = entity.time;
	data['likedCount'] = entity.likedCount;
	data['expressionUrl'] = entity.expressionUrl;
	data['commentLocationType'] = entity.commentLocationType;
	data['parentCommentId'] = entity.parentCommentId;
	if (entity.decoration != null) {
		data['decoration'] = entity.decoration.toJson();
	}
	data['repliedMark'] = entity.repliedMark;
	data['liked'] = entity.liked;
	return data;
}

commentsCommentsUserFromJson(CommentsCommentsUser data, Map<String, dynamic> json) {
	if (json['locationInfo'] != null) {
		data.locationInfo = json['locationInfo'];
	}
	if (json['liveInfo'] != null) {
		data.liveInfo = json['liveInfo'];
	}
	if (json['anonym'] != null) {
		data.anonym = json['anonym']?.toInt();
	}
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['expertTags'] != null) {
		data.expertTags = json['expertTags'];
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	if (json['authStatus'] != null) {
		data.authStatus = json['authStatus']?.toInt();
	}
	if (json['experts'] != null) {
		data.experts = json['experts'];
	}
	if (json['vipRights'] != null) {
		data.vipRights = json['vipRights'];
	}
	if (json['remarkName'] != null) {
		data.remarkName = json['remarkName'];
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
	return data;
}

Map<String, dynamic> commentsCommentsUserToJson(CommentsCommentsUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['locationInfo'] = entity.locationInfo;
	data['liveInfo'] = entity.liveInfo;
	data['anonym'] = entity.anonym;
	data['vipType'] = entity.vipType;
	data['expertTags'] = entity.expertTags;
	data['avatarUrl'] = entity.avatarUrl;
	data['authStatus'] = entity.authStatus;
	data['experts'] = entity.experts;
	data['vipRights'] = entity.vipRights;
	data['remarkName'] = entity.remarkName;
	data['userId'] = entity.userId;
	data['userType'] = entity.userType;
	data['nickname'] = entity.nickname;
	return data;
}

commentsCommentsDecorationFromJson(CommentsCommentsDecoration data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> commentsCommentsDecorationToJson(CommentsCommentsDecoration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}