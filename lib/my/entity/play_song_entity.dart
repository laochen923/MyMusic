import 'package:mymusic/generated/json/base/json_convert_content.dart';

class PlaySongEntity with JsonConvert<PlaySongEntity> {
	int id;
	String url;
	String pic;
	String name;
	String listId;
	int seek;
	bool isPlay;
	int index;
	bool isLocal;
}
