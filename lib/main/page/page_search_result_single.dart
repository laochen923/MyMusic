import 'package:flutter/material.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/r.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SinglePage extends StatefulWidget {
  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> with AutomaticKeepAliveClientMixin{
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
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30.h, left: 20.w),
                    child:  Row(
                      children: <Widget>[
                        Image.asset(
                          R.assetsImgIcPlayaudioBlack,
                          width: 30.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Text("播放全部",style: TextStyle(fontSize: 34.sp))
                        )
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 35.w,top: 30.h),
                    child:
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Image.asset(R.assetsImgIcMulSelect, width: 30.w),
                            Text(
                              " 多选",
                              style: TextStyle( fontSize: 30.sp),
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),
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
                                child: Text(
                                    "${search.songs[index].name}",
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 34.sp),
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                width: 500.w,
                                margin: EdgeInsets.only(top: 2.h),
                                child: Text(
                                    "${search.songs[index].artists[0].name}-${search.songs[index].album.name}",
                                    style: TextStyle(
                                        fontSize: 26.sp, color: Colors.black45),
                                    overflow: TextOverflow.ellipsis),
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 30.w, top: 30.h),
                              child: Image.asset(
                                R.assetsImgTActionbarVideoSelected,
                                width: 90.w,
                                color: Colors.black45,
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 30.h),
                            child: Icon(Icons.more_vert,
                                color: Colors.black45, size: 24),
                          )
                        ],
                      );
                    },
                    itemCount: search.songs.length,
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics()),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
