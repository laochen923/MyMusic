import 'package:mymusic/generated/json/base/json_convert_content.dart';

class ResultSingleEntity with JsonConvert<ResultSingleEntity> {
	ResultSingleResult result;
	int code;
}

class ResultSingleResult with JsonConvert<ResultSingleResult> {
	List<ResultSingleResultSong> songs;
	int songCount;
}

class ResultSingleResultSong with JsonConvert<ResultSingleResultSong> {
	int id;
	String name;
	List<ResultSingleResultSongsArtist> artists;
	ResultSingleResultSongsAlbum album;
	int duration;
	int copyrightId;
	int status;
	List<String> alias;
	int rtype;
	int ftype;
	int mvid;
	int fee;
	dynamic rUrl;
	int mark;
	Al al;
	List<Ar> ar;
}
class Al with JsonConvert<Al>{
	int id;
	String name;
	String picUrl;
}

class Ar with JsonConvert<Ar>{
	int id;
	String name;
}

class ResultSingleResultSongsArtist with JsonConvert<ResultSingleResultSongsArtist> {
	int id;
	String name;
	dynamic picUrl;
	List<dynamic> alias;
	int albumSize;
	int picId;
	String img1v1Url;
	int img1v1;
	dynamic trans;
}

class ResultSingleResultSongsAlbum with JsonConvert<ResultSingleResultSongsAlbum> {
	int id;
	String name;
	ResultSingleResultSongsAlbumArtist artist;
	int publishTime;
	int size;
	int copyrightId;
	int status;
	int picId;
	int mark;
}

class ResultSingleResultSongsAlbumArtist with JsonConvert<ResultSingleResultSongsAlbumArtist> {
	int id;
	String name;
	dynamic picUrl;
	List<dynamic> alias;
	int albumSize;
	int picId;
	String img1v1Url;
	int img1v1;
	dynamic trans;
}
