import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class ResultSongListEntity with JsonConvert<ResultSongListEntity> {
	ResultSongListResult result;
	int code;
}

class ResultSongListResult with JsonConvert<ResultSongListResult> {
	List<ResultSongListResultPlaylist> playlists;
	int playlistCount;
}

class ResultSongListResultPlaylist with JsonConvert<ResultSongListResultPlaylist> {
	int id;
	String name;
	String coverImgUrl;
	ResultSongListResultPlaylistsCreator creator;
	bool subscribed;
	int trackCount;
	int userId;
	int playCount;
	int bookCount;
	dynamic officialTags;
	String description;
	bool highQuality;
	ResultSongListResultPlaylistsTrack track;
	String alg;
}

class ResultSongListResultPlaylistsCreator with JsonConvert<ResultSongListResultPlaylistsCreator> {
	String nickname;
	int userId;
	int userType;
	int authStatus;
	dynamic expertTags;
	dynamic experts;
}

class ResultSongListResultPlaylistsTrack with JsonConvert<ResultSongListResultPlaylistsTrack> {
	String name;
	int id;
	int position;
	List<dynamic> alias;
	int status;
	int fee;
	int copyrightId;
	String disc;
	int no;
	List<ResultSongListResultPlaylistsTrackArtist> artists;
	ResultSongListResultPlaylistsTrackAlbum album;
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
	int mvid;
	int rtype;
	dynamic rurl;
	ResultSongListResultPlaylistsTrackHMusic hMusic;
	ResultSongListResultPlaylistsTrackMMusic mMusic;
	ResultSongListResultPlaylistsTrackLMusic lMusic;
	ResultSongListResultPlaylistsTrackBMusic bMusic;
	dynamic mp3Url;
}

class ResultSongListResultPlaylistsTrackArtist with JsonConvert<ResultSongListResultPlaylistsTrackArtist> {
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
}

class ResultSongListResultPlaylistsTrackAlbum with JsonConvert<ResultSongListResultPlaylistsTrackAlbum> {
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
	dynamic company;
	String briefDesc;
	ResultSongListResultPlaylistsTrackAlbumArtist artist;
	List<dynamic> songs;
	List<dynamic> alias;
	int status;
	int copyrightId;
	String commentThreadId;
	List<ResultSongListResultPlaylistsTrackAlbumArtist> artists;
	@JSONField(name: "picId_str")
	String picidStr;
}

class ResultSongListResultPlaylistsTrackAlbumArtist with JsonConvert<ResultSongListResultPlaylistsTrackAlbumArtist> {
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
}

class ResultSongListResultPlaylistsTrackHMusic with JsonConvert<ResultSongListResultPlaylistsTrackHMusic> {
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

class ResultSongListResultPlaylistsTrackMMusic with JsonConvert<ResultSongListResultPlaylistsTrackMMusic> {
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

class ResultSongListResultPlaylistsTrackLMusic with JsonConvert<ResultSongListResultPlaylistsTrackLMusic> {
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

class ResultSongListResultPlaylistsTrackBMusic with JsonConvert<ResultSongListResultPlaylistsTrackBMusic> {
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
