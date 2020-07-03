import 'package:flutter/material.dart';
import 'package:mymusic/my/entity/artist_sub_entity.dart';
import 'package:mymusic/my/model/model_song.dart';
import 'package:mymusic/my/view/view_newsong.dart';
import 'package:mymusic/widgets/play_widget.dart';
class FollowNewSongsPage extends StatefulWidget {
  @override
  _FollowNewSongsPageState createState() => _FollowNewSongsPageState();
}

class _FollowNewSongsPageState extends State<FollowNewSongsPage> with NewSongView{
  @override
  void initState() {
    //SongModel.getTopSong(this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关注新歌"),
      ),
        bottomNavigationBar: PlayWidget()
    );
  }

  @override
  void updateArtistSub(ArtistSubEntity entity) {
  }
}
