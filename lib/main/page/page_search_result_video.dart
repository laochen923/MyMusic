import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/utils/date_util.dart';
import 'package:mymusic/utils/number_format.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../r.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with AutomaticKeepAliveClientMixin{
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
                      child: Stack(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 20.w, top: 20.h),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.elliptical(4, 4),
                                      bottom: Radius.elliptical(4, 4)),
                                  child: CachedNetworkImage(
                                    imageUrl: search.resultInclusive != null
                                        ? search
                                        .videos[index].coverUrl
                                        : "",
                                    width: 130.w,
                                    height: 130.h,
                                    fit: BoxFit.fill,
                                  ))),
                          Container(
                            width: 160.w,
                            alignment: Alignment.topRight,
                            child:  Align(
                              alignment: Alignment.topRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(top: 20.h),
                                      child:   Image.asset(R.assetsImgIcPlaycount,width: 20.w,)
                                  ),
                                  Container(
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(top: 20.h,right: 10.w),
                                      child:  Text("${DataUtils.formatNumber(search
                                          .videos[index].playTime, false, 0)}",style: TextStyle(color: Colors.white,fontSize: 24.sp),)
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
                              "${search.videos[index].title}",
                              style: TextStyle(fontSize: 28.sp),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Container(
                          width: 500.w,
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text(
                              "${DateUtils.formatDateMs(search.videos[index].durationms,format: "mm:ss")} by ${search.videos[index].creator[0].userName}",
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
              itemCount: search.videos.length,
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics()),
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
