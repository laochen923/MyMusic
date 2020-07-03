
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingerPage extends StatefulWidget {
  @override
  _SingerPageState createState() => _SingerPageState();
}

class _SingerPageState extends State<SingerPage> with AutomaticKeepAliveClientMixin{
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
                          child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: search.artists != null
                                    ? search.artists[index].img1v1Url
                                    : "",
                                width: 120.w,
                                height: 120.h,
                                fit: BoxFit.fill,
                              ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 500.w,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text(
                              "${search.artists[index].name}",
                              style: TextStyle(fontSize: 28.sp),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    )
                  ],
                );
              },
              itemCount: search.artists.length,
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics()),
        ),
      );});
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
