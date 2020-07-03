import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mymusic/discover/entity/comment_hot_wall_entity.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/utils/date_util.dart';
import 'package:mymusic/yuncun/model/model_yuncun.dart';
import 'package:mymusic/yuncun/view/view_yuncun.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * @date on 2020/4/21 13:56
 * @author jack
 * @filename page_square.dart
 * @description 广场主界面
 */
class SquarePage extends StatefulWidget {
  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage>
    with AutomaticKeepAliveClientMixin, YunCunView {
  RefreshController _refreshController = new RefreshController();
  List<CommentHotWallData> commentHotWalls = new List();
  int limit;
  int offset;

  @override
  void initState() {
    limit = 10;
    offset = 0;
    _refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        child: SingleChildScrollView(
            child: Stack(
                children: <Widget>[_buildHotWall(), _buildStaggeredGrid()])),
        controller: _refreshController,
        onRefresh: _refresh);
  }

  //云村热评墙
  Widget _buildHotWall() {
    return InkWell(
      onTap: () {
        //
      },
      child: Container(
        height: 200.h,
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.vertical(
                top: Radius.elliptical(8, 8), bottom: Radius.elliptical(8, 8)),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(145, 144, 149, 1),
                Color.fromRGBO(143, 126, 98, 1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 20.w, top: 40.h),
                      child: Text("云村热评墙",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold))),
                  Container(
                      margin: EdgeInsets.only(left: 20.w, top: 45.h),
                      child: Image.asset(
                        R.assetsImgIcArrowR,
                        color: Colors.white,
                        height: 35.h,
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.h, left: 20.w),
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Row(children: <Widget>[
                    Container(
                      child: ClipOval(
                        child: SizedBox(
                          width: 30.h,
                          height: 30.h,
                          child: commentHotWalls.length == 0
                              ? Image.asset(R.assetsImgIcBannerDefault)
                              : CachedNetworkImage(
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.fill,
                                  imageUrl: commentHotWalls[index]
                                      .simpleUserInfo
                                      .avatar,
                                ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      width: 500.w,
                      child: Text(
                        "${commentHotWalls.length == 0 ? "" : commentHotWalls[index].content}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]);
                },
                autoplay: true,
                scrollDirection: Axis.vertical,
                itemCount:
                    commentHotWalls.length == 0 ? 1 : commentHotWalls.length,
                onTap: (index) {},
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 580.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${DateUtils.getMonthShorthand(DateTime.now().month)}.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold)),
                  Text("${DateTime.now().day}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //构建评论瀑布流
  Widget _buildStaggeredGrid() {
    return Container(
      margin: EdgeInsets.only(top: 300.h, left: 20.w, right: 20.w),
      child: new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: commentHotWalls.length,
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.elliptical(4, 4)),
                      child: CachedNetworkImage(
                          imageUrl: commentHotWalls[index]
                              .simpleResourceInfo
                              .songCoverUrl,
                          fit: BoxFit.fill),
                    ),
                  ),

                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: new BorderRadius.vertical(
                        bottom: Radius.elliptical(4, 4),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 300.w,
                        margin: EdgeInsets.only(left: 10.w),
                        child: Text(
                          commentHotWalls[index].content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 22.sp),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(5.h),
                            child: ClipOval(
                              child: SizedBox(
                                width: 30.h,
                                height: 30.h,
                                child: CachedNetworkImage(
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.fill,
                                  imageUrl: commentHotWalls[index]
                                      .simpleUserInfo
                                      .avatar,
                                ),
                              ),
                            ),
                          ),
                          Text("..."),
                          Container(
                            alignment: Alignment.centerRight,
                            width: 260.w,
                            child: Text(
                              "${commentHotWalls[index].likedCount}赞",
                              style: TextStyle(fontSize: 20.sp),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index %2== 0 ? 2.7 : 3.0),
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.h,
      ),
    );
  }

  //刷新页面数据
  Future<void> _refresh() async {
    commentHotWalls.clear();
    YunCunModel.getCommentHotWall(this);
    YunCunModel.getHotTopic(limit, offset, this);
    await Future.delayed(Duration(milliseconds: 2000));
    _refreshController.refreshCompleted();
    setState(() {});
  }

  @override
  void updateCommentHotWall(CommentHotWallEntity entity) {
    commentHotWalls.addAll(entity.data);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
