
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/utils/number_format.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongListPage extends StatefulWidget {
  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, Search search, Widget child) {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.w),
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Container(
                          margin: EdgeInsets.only(left: 20.w, top: 20.h),
                          child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.elliptical(4, 4),
                                  bottom: Radius.elliptical(4, 4)),
                              child: CachedNetworkImage(
                                imageUrl: search.resultInclusive != null
                                    ? search
                                    .playlists[index].coverImgUrl
                                    : "",
                                width: 120.w,
                                height: 130.h,
                                fit: BoxFit.fill,
                              ))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 500.w,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text(
                              "${search.playlists[index].name}",
                              style: TextStyle(fontSize: 28.sp),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Container(
                          width: 500.w,
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text(
                              "${search.playlists[index].trackCount}首 by${search.playlists[index].creator.nickname},播放${DataUtils.formatNumber(search.playlists[index].playCount, false, 1)}次",
                              style: TextStyle(
                                  fontSize: 24.sp, color: Colors.black45),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    )
                  ],
                );
              },
              itemCount: search.playlists.length,
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics()),
        ),
      );});
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
