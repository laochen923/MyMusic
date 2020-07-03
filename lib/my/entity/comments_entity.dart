import 'package:mymusic/generated/json/base/json_convert_content.dart';

class CommentsEntity with JsonConvert<CommentsEntity> {
	bool isMusician;
	int cnum;
	int userId;
	List<dynamic> topComments;
	bool moreHot;
	List<dynamic> hotComments;
	dynamic commentBanner;
	int code;
	List<Comments> comments;
	int total;
	bool more;
}

class Comments with JsonConvert<Comments> {
	CommentsCommentsUser user;
	List<dynamic> beReplied;
	dynamic pendantData;
	dynamic showFloorComment;
	int status;
	int commentId;
	String content;
	int time;
	int likedCount;
	dynamic expressionUrl;
	int commentLocationType;
	int parentCommentId;
	CommentsCommentsDecoration decoration;
	dynamic repliedMark;
	bool liked;
}

class CommentsCommentsUser with JsonConvert<CommentsCommentsUser> {
	dynamic locationInfo;
	dynamic liveInfo;
	int anonym;
	int vipType;
	dynamic expertTags;
	String avatarUrl;
	int authStatus;
	dynamic experts;
	dynamic vipRights;
	dynamic remarkName;
	int userId;
	int userType;
	String nickname;
}

class CommentsCommentsDecoration with JsonConvert<CommentsCommentsDecoration> {

}
