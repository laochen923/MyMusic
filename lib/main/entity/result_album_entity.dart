import 'package:mymusic/generated/json/base/json_convert_content.dart';
import 'package:mymusic/generated/json/base/json_filed.dart';

class ResultAlbumEntity with JsonConvert<ResultAlbumEntity> {
	ResultAlbumResult result;
	int code;
}

class ResultAlbumResult with JsonConvert<ResultAlbumResult> {
	List<ResultAlbumResultAlbum> albums;
	int albumCount;
}

class ResultAlbumResultAlbum with JsonConvert<ResultAlbumResultAlbum> {
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
	String company;
	String briefDesc;
	ResultAlbumResultAlbumsArtist artist;
	dynamic songs;
	List<dynamic> alias;
	int status;
	int copyrightId;
	String commentThreadId;
	List<ResultAlbumResultAlbumsArtist> artists;
	bool paid;
	bool onSale;
	@JSONField(name: "picId_str")
	String picidStr;
	String alg;
	int mark;
	String containedSong;
}

class ResultAlbumResultAlbumsArtist with JsonConvert<ResultAlbumResultAlbumsArtist> {
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
	int topicPerson;
	@JSONField(name: "picId_str")
	String picidStr;
	@JSONField(name: "img1v1Id_str")
	String img1v1idStr;
	List<dynamic> alia;
}
