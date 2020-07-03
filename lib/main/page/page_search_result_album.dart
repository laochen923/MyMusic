
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/utils/date_util.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> with AutomaticKeepAliveClientMixin{
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
        child:  Container(
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
                                imageUrl: search.albums != null
                                    ? search
                                    .albums[index].picUrl
                                    : "",
                                width: 120.w,
                                height: 120.h,
                                fit: BoxFit.fill,
                              ))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 500.w,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text(
                              "${search.albums[index].name}",
                              style: TextStyle(fontSize: 28.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Container(
                          width: 500.w,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text(
                              "${search.albums[index].artist.name}  ${DateUtils.formatDateMs(search.albums[index].publishTime,format: "yyyy-MM-dd")}",
                              style: TextStyle(fontSize: 24.sp,color: Colors.black45),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    )
                  ],
                );
              },
              itemCount: search.albums.length,
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics()),
        ),
      );});
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
