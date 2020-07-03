import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/utils/date_util.dart';
import 'package:mymusic/utils/number_format.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InclusivePage extends StatefulWidget {
  @override
  _InclusivePageState createState() => _InclusivePageState();
}

class _InclusivePageState extends State<InclusivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, Search search, Widget child) {
      if (search.resultInclusive == null) {
        return Center(child: Text("搜索中..."),);
      } else {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 30.w),
                child: Text(
                  "你可能感兴趣",
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: search.resultInclusive != null
                            ? search
                                .resultInclusive.album.albums[0].artist.picUrl
                            : "",
                        width: 100.w,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "歌手: ${search.resultInclusive != null ? search.resultInclusive.album.albums[0].artist.name : ""}",
                          style: TextStyle(fontSize: 32.sp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: Text(
                            "歌曲: ${search.resultInclusive != null ? search.resultInclusive.album.albums[0].artist.musicSize : ""}专辑:${search.resultInclusive != null ? search.resultInclusive.album.albums[0].artist.albumSize : ""}",
                            style: TextStyle(
                                fontSize: 26.sp, color: Colors.black45)),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.elliptical(4, 4),
                              bottom: Radius.elliptical(4, 4)),
                          child: CachedNetworkImage(
                            imageUrl: search.resultInclusive != null
                                ? search.resultInclusive.album.albums[0].picUrl
                                : "",
                            width: 100.w,
                          ))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "专辑: ${search.resultInclusive != null ? search.resultInclusive.album.albums[0].name : ""}",
                          style: TextStyle(fontSize: 32.sp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${search.resultInclusive != null ? search.resultInclusive.album.albums[0].artist.name : ""}",
                          style:
                              TextStyle(fontSize: 26.sp, color: Colors.black45),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30.h, left: 20.w),
                    child: Text("单曲",
                        style: TextStyle(
                            fontSize: 36.sp, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border:
                            new Border.all(color: Colors.black45, width: 1.w),
                        borderRadius:
                            new BorderRadius.all(Radius.elliptical(50, 50))),
                    margin: EdgeInsets.only(right: 30.w, top: 30.h),
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          R.assetsImgIcPlayaudioBlack,
                          width: 25.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Text("播放全部"),
                        )
                      ],
                    ),
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
                                    "${search.resultInclusive.song.songs[index].name}",
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 34.sp),
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                width: 500.w,
                                margin: EdgeInsets.only(top: 2.h),
                                child: Text(
                                    "${search.resultInclusive.song.songs[index].ar[0].name}-${search.resultInclusive.song.songs[index].al.name}",
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
                    itemCount: search.resultInclusive.song.songs.length,
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics()),
              ),
              search.resultInclusive.song.more
                  ? Container(
                      margin: EdgeInsets.only(top: 30.h, left: 20.w),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${search.resultInclusive.song.moreText}",
                              style: TextStyle(
                                  fontSize: 24.sp, color: Colors.black45)),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            child: Image.asset(
                              R.assetsImgIcArrowR,
                              height: 25.h,
                              width: 30.w,
                            ),
                          )
                        ],
                      ),
                    )
                  : Text(""),
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 20.w),
                child: Text("歌单",
                    style: TextStyle(
                        fontSize: 36.sp, fontWeight: FontWeight.bold)),
              ),
              Container(
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
                                          ? search.resultInclusive.playList
                                              .playLists[index].coverImgUrl
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
                                    "${search.resultInclusive.playList.playLists[index].name}",
                                    style: TextStyle(fontSize: 28.sp),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                width: 500.w,
                                margin: EdgeInsets.only(left: 20.w),
                                child: Text(
                                    "${search.resultInclusive.playList.playLists[index].trackCount}首 by${search.resultInclusive.playList.playLists[index].creator.nickname},播放${DataUtils.formatNumber(search.resultInclusive.playList.playLists[index].playCount, false, 1)}次",
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
                    itemCount: search.resultInclusive.playList.playLists.length,
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics()),
              ),
              search.resultInclusive.playList.more
                  ? Container(
                      margin: EdgeInsets.only(top: 30.h, left: 20.w),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${search.resultInclusive.playList.moreText}",
                              style: TextStyle(
                                  fontSize: 24.sp, color: Colors.black45)),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            child: Image.asset(
                              R.assetsImgIcArrowR,
                              height: 25.h,
                              width: 30.w,
                            ),
                          )
                        ],
                      ),
                    )
                  : Text(""),
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 20.w),
                child: Text("视频",
                    style: TextStyle(
                        fontSize: 36.sp, fontWeight: FontWeight.bold)),
              ),
              Container(
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
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 20.h),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.elliptical(4, 4),
                                            bottom: Radius.elliptical(4, 4)),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              search.resultInclusive != null
                                                  ? search.resultInclusive.video
                                                      .videos[index].coverUrl
                                                  : "",
                                          width: 130.w,
                                          height: 130.h,
                                          fit: BoxFit.fill,
                                        ))),
                                Container(
                                  width: 160.w,
                                  alignment: Alignment.topRight,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(top: 20.h),
                                            child: Image.asset(
                                              R.assetsImgIcPlaycount,
                                              width: 20.w,
                                            )),
                                        Container(
                                            alignment: Alignment.topRight,
                                            margin: EdgeInsets.only(
                                                top: 20.h, right: 10.w),
                                            child: Text(
                                              "${DataUtils.formatNumber(search.resultInclusive.video.videos[index].playTime, false, 0)}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24.sp),
                                            ))
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
                                    "${search.resultInclusive.video.videos[index].title}",
                                    style: TextStyle(fontSize: 28.sp),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                width: 500.w,
                                margin: EdgeInsets.only(left: 20.w),
                                child: Text(
                                    "${DateUtils.formatDateMs(search.resultInclusive.video.videos[index].durationms, format: "mm:ss")} by ${search.resultInclusive.video.videos[index].creator[0].userName}",
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
                    itemCount: search.resultInclusive.video.videos.length,
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics()),
              ),
              search.resultInclusive.video.more
                  ? Container(
                      margin: EdgeInsets.only(top: 30.h, left: 20.w),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${search.resultInclusive.video.moreText}",
                              style: TextStyle(
                                  fontSize: 24.sp, color: Colors.black45)),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            child: Image.asset(
                              R.assetsImgIcArrowR,
                              height: 25.h,
                              width: 30.w,
                            ),
                          )
                        ],
                      ),
                    )
                  : Text(""),
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 20.w),
                child: Text("歌手",
                    style: TextStyle(
                        fontSize: 36.sp, fontWeight: FontWeight.bold)),
              ),
              Container(
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
                                  imageUrl: search.resultInclusive != null
                                      ? search.resultInclusive.artist
                                          .artists[index].picUrl
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
                                    "${search.resultInclusive.artist.artists[index].name}",
                                    style: TextStyle(fontSize: 28.sp),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ],
                          )
                        ],
                      );
                    },
                    itemCount: search.resultInclusive.artist.artists.length,
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics()),
              ),
              search.resultInclusive.artist.more
                  ? Container(
                      margin: EdgeInsets.only(top: 30.h, left: 20.w),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${search.resultInclusive.artist.moreText}",
                              style: TextStyle(
                                  fontSize: 24.sp, color: Colors.black45)),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            child: Image.asset(
                              R.assetsImgIcArrowR,
                              height: 25.h,
                              width: 30.w,
                            ),
                          )
                        ],
                      ),
                    )
                  : Text(""),
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 20.w),
                child: Text("专辑",
                    style: TextStyle(
                        fontSize: 36.sp, fontWeight: FontWeight.bold)),
              ),
              Container(
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
                                          ? search.resultInclusive.album
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
                                    "${search.resultInclusive.album.albums[index].name}",
                                    style: TextStyle(fontSize: 28.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                width: 500.w,
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 20.w),
                                child: Text(
                                    "${search.resultInclusive.album.albums[index].artist.name}  ${DateUtils.formatDateMs(search.resultInclusive.album.albums[index].publishTime, format: "yyyy-MM-dd")}",
                                    style: TextStyle(
                                        fontSize: 24.sp, color: Colors.black45),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ],
                          )
                        ],
                      );
                    },
                    itemCount: search.resultInclusive.album.albums.length,
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics()),
              ),
              search.resultInclusive.album.more
                  ? Container(
                      margin:
                          EdgeInsets.only(top: 30.h, left: 20.w, bottom: 40.h),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${search.resultInclusive.album.moreText}",
                              style: TextStyle(
                                  fontSize: 24.sp, color: Colors.black45)),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            child: Image.asset(
                              R.assetsImgIcArrowR,
                              height: 25.h,
                              width: 30.w,
                            ),
                          )
                        ],
                      ),
                    )
                  : Text(""),
            ],
          ),
        );
      }
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
