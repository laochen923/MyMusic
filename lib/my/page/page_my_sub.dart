import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/my/entity/artist_sub_entity.dart';
import 'package:mymusic/my/model/model_sub.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/my/view/view_sub.dart';
import 'package:mymusic/widgets/play_widget.dart';

import '../../r.dart';
class MySubPage extends StatefulWidget {
  @override
  _MySubPageState createState() => _MySubPageState();
}

class _MySubPageState extends State<MySubPage> with SubView{
  List<ArtistSubData> artists;
  @override
  void initState() {
    SubModel.getArtistSublist(this);
    SubModel.getMvSublist();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Container(
                              margin: EdgeInsets.only(left: 20.w, top: 30.h),
                              child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: artists != null
                                        ? artists[index].picUrl
                                        : "",
                                    width: 120.w,
                                    height: 120.w,
                                    fit: BoxFit.fill,
                                  ))),
                        ),
                        Container(
                          child: Container(
                              margin: EdgeInsets.only(left: 20.w, top: 20.h),
                              child: Text(
                                "${artists == null ? "" : artists[index].name}",
                                style: TextStyle(fontSize: 26.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,)),
                        )
                      ],
                    );
                  },
                  itemCount: artists == null ? 0 : artists.length,
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics()),
            )
          ],
        ),
      ),
        bottomNavigationBar: PlayWidget()
    );
  }

  @override
  void updateArtistSub(ArtistSubEntity entity) {
    artists=entity.data;
    setState(() {

    });
  }
}
