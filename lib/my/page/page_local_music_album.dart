import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymusic/my/entity/song_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../r.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List<LocalSong> songs;

  @override
  void initState() {
    scanningLocalMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30.h),
                              width: 500.w,
                              height: 80.h,
                              child: Text(
                                  "${songs != null ? songs[index].album : ""}",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 34.sp),
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                  itemCount: songs != null ? songs.length : 0,
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics()),
            ),
          ],
        ),
      ),
    );
  }

  scanningLocalMusic() async {
    // Native channel
    const platform = const MethodChannel("com.jack.mymusic");
    var result;
    try {
      result =
      await platform.invokeMethod("scanningLocalMusic", {"type": "song"});
      var dataMap = json.decode(result);
      songs = new LocalSongEntity().fromJson(dataMap).songs;
      setState(() {

      });
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
}
