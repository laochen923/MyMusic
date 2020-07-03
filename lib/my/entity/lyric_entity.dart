import 'package:mymusic/generated/json/base/json_convert_content.dart';

class LyricEntity with JsonConvert<LyricEntity> {
	bool sgc;
	bool sfy;
	bool qfy;
	LyricLrc lrc;
	LyricKlyric klyric;
	LyricTlyric tlyric;
	int code;
}

class LyricLrc with JsonConvert<LyricLrc> {
	int version;
	String lyric;
}

class LyricKlyric with JsonConvert<LyricKlyric> {
	int version;
	String lyric;
}

class LyricTlyric with JsonConvert<LyricTlyric> {
	int version;
	dynamic lyric;
}
