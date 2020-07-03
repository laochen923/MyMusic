
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/discover/entity/banner_entity.dart';
import 'package:mymusic/discover/entity/comment_hot_wall_entity.dart';
import 'package:mymusic/discover/entity/dj_popular_entity.dart';
import 'package:mymusic/discover/entity/new_song_entity.dart';
import 'package:mymusic/discover/entity/personalized_entity.dart';
import 'package:mymusic/discover/entity/recommend_resource_entity.dart';
import 'package:mymusic/discover/entity/recommend_songs_entity.dart';
import 'package:mymusic/discover/model/model_discover.dart';
import 'package:mymusic/discover/view/view_discover.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/router/routers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin, DiscoverView {
  List<BannerBanner> banners = new List();
  List<ResourceRecommend> resourceRecommends = new List();
  List<SongsRecommend> songRecommends = new List();
  List<PersonalizedResult> personalized = new List();
  List<CommentHotWallData> commentHotWalls = new List();
  List<HotDjPopular> hotDjPopular = new List();
  List<NewSongResult> newSongs=new List();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    print("DiscoverPage initState");
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _refresh();
    super.initState();
  }

  var today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("DiscoverPage build");
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        child: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            Container(
              height: 300.h,
              decoration: BoxDecoration(color: AppColors.color_main),
            ),
            _buildBanner(),
            _buildDragonBallMenu(),
            _buildRecommendResource(),
            _buildRecommendSongs(),
            _buildPersonalized(),
            _buildCommentHotWall(),
            _buildDj(),
            _buildRecommendNewSongs()
          ],
        )),
        controller: _refreshController,
        onRefresh: _refresh);
  }

  //轮播图
  Widget _buildBanner() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.vertical(
              top: Radius.elliptical(4, 4), bottom: Radius.elliptical(4, 4)),
          color: Colors.transparent),
      margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
      height: 300.h,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: banners.length == 0
                  ? Image.asset(R.assetsImgIcBannerDefault)
                  : CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.fill, imageUrl:  banners[index].pic
                    ));
        },
        autoplay: true,
        itemCount: banners.length == 0 ? 1 : banners.length,
        itemHeight: 300.h,
        containerHeight: 300.h,
        pagination: new SwiperPagination(),
        onTap: (index) {
          if (banners[index].url == null) {
            return;
          }
          Routers.navigateTo(context, Routers.webViewPage, params: {
            "url": "${banners[index].url}",
            "barTitle": "${banners[index].typeTitle}"
          });
        },
      ),
    );
  }

  //构建中部操作项
  Widget _buildDragonBallMenu() {
    return Container(
      margin: EdgeInsets.only(top: 370.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 90.w,
                  width: 90.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.color_main),
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(R.assetsImgIcDragonballIcnDaily))),
                    child: Text(
                      "${today.day}",
                      style: TextStyle(
                          color: AppColors.color_main,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text("每日推荐",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26.sp)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 90.w,
                  width: 90.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.color_main),
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                R.assetsImgIcDragonballIcnPlaylist))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text("歌单",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26.sp)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 90.w,
                  width: 90.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.color_main),
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(R.assetsImgIcDragonballIcnRank))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text("排行榜",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26.sp)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 90.w,
                  width: 90.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.color_main),
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(R.assetsImgIcDragonballIcnRadio))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text("电台",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26.sp)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 90.w,
                  width: 90.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.color_main),
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(R.assetsImgIcDragonballIcnLook))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text("直播",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26.sp)),
              )
            ],
          )
        ],
      ),
    );
  }

  //推荐歌单
  Widget _buildRecommendResource() {
    return Container(
      margin: EdgeInsets.only(top: 560.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: Text("推荐歌单",
                    style: TextStyle(
                        fontSize: 38.sp, fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () {
                  //查看更多
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black45, width: 1.w),
                      borderRadius:
                          new BorderRadius.all(Radius.elliptical(50, 50))),
                  margin: EdgeInsets.only(right: 30.w),
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                  child: Text("查看更多"),
                ),
              )
            ],
          ),
          Container(
              height: 260.h,
              margin: EdgeInsets.only(top: 20.h),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: resourceRecommends.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 20.w,
                        right:
                            index == resourceRecommends.length - 1 ? 20.w : 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5.w, top: 5.h),
                          alignment: Alignment.topRight,
                          height: 160.h,
                          width: 160.h,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.vertical(
                                  top: Radius.elliptical(4, 4),
                                  bottom: Radius.elliptical(4, 4)),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      resourceRecommends[index].picUrl),
                                  fit: BoxFit.fill)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Image.asset(
                                R.assetsImgIcPlaycount,
                                width: 25.h,
                                height: 25.h,
                              ),
                              Text(
                                  " ${resourceRecommends[index].playcount ~/ 10000}万",
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white))
                            ],
                          ),
                        ),
                        Container(
                          width: 150.h,
                          child: Text(
                            resourceRecommends[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  //推荐歌曲
  Widget _buildRecommendSongs() {
    return Container(
      margin: EdgeInsets.only(top: 920.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: Text("风格推荐 享你所爱",
                    style: TextStyle(
                        fontSize: 38.sp, fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () {
                  //查看更多
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black45, width: 1.w),
                      borderRadius:
                          new BorderRadius.all(Radius.elliptical(50, 50))),
                  margin: EdgeInsets.only(right: 30.w),
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                  child: Text("播放全部"),
                ),
              )
            ],
          ),
          Container(
              height: 400.h,
              margin: EdgeInsets.only(top: 20.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 3,
                  // 左右间隔
                  crossAxisSpacing: 10.0,
                  // 上下间隔
                  mainAxisSpacing: 10.0,
                  //宽高比
                  childAspectRatio: 0.185,
                  //子组件宽高长度比例
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: songRecommends.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          height: 90.h,
                          width: 90.h,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.vertical(
                                  top: Radius.elliptical(4, 4),
                                  bottom: Radius.elliptical(4, 4)),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      songRecommends[index].album.picUrl),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 250.w,
                                    ),
                                    margin: EdgeInsets.only(left: 16.w),
                                    child: Text(
                                      songRecommends[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 26.sp),
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 150.w,
                                    ),
                                    child: Text(
                                      " - ${songRecommends[index].artists[0].name}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black45),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 400.w,
                                constraints: BoxConstraints(
                                  maxWidth: 400.w,
                                ),
                                margin: EdgeInsets.only(left: 16.w, top: 10.h),
                                child: Text("${songRecommends[index].reason}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black45)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30.w, top: 20.h),
                          alignment: Alignment.centerRight,
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: new Border.all(
                                  color: Colors.black12, width: 1.w)),
                          child: IconButton(
                              icon: new ImageIcon(
                                AssetImage(R.assetsImgIcArrowRedPlay),
                                color: AppColors.color_main,
                                size: 10,
                              ),
                              onPressed: () {
                                //播放
                              }),
                        )
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  //场景歌单
  Widget _buildPersonalized() {
    return Container(
      margin: EdgeInsets.only(top: 1420.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: Text("场景歌单 声色张扬",
                    style: TextStyle(
                        fontSize: 38.sp, fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () {
                  //查看更多
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black45, width: 1.w),
                      borderRadius:
                          new BorderRadius.all(Radius.elliptical(50, 50))),
                  margin: EdgeInsets.only(right: 30.w),
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                  child: Text("查看更多"),
                ),
              )
            ],
          ),
          Container(
              height: 260.h,
              margin: EdgeInsets.only(top: 20.h),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: personalized.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 20.w,
                        right: index == personalized.length - 1 ? 20.w : 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5.w, top: 5.h),
                          alignment: Alignment.topRight,
                          height: 160.h,
                          width: 160.h,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.vertical(
                                  top: Radius.elliptical(4, 4),
                                  bottom: Radius.elliptical(4, 4)),
                              image: DecorationImage(
                                  image:
                                  CachedNetworkImageProvider(personalized[index].picUrl),
                                  fit: BoxFit.fill)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Image.asset(
                                R.assetsImgIcPlaycount,
                                width: 25.h,
                                height: 25.h,
                              ),
                              Text(
                                  " ${personalized[index].playCount ~/ 10000}万",
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white))
                            ],
                          ),
                        ),
                        Container(
                          width: 150.h,
                          child: Text(
                            personalized[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  //云村精选
  Widget _buildCommentHotWall() {
    return Container(
      margin: EdgeInsets.only(top: 1780.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: Text("云村精选 发现同好",
                    style: TextStyle(
                        fontSize: 38.sp, fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () {
                  //查看更多
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black45, width: 1.w),
                      borderRadius:
                          new BorderRadius.all(Radius.elliptical(50, 50))),
                  margin: EdgeInsets.only(right: 30.w),
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                  child: Text("查看更多"),
                ),
              )
            ],
          ),
          Container(
              height: 340.h,
              margin: EdgeInsets.only(top: 20.h),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: commentHotWalls.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 20.w,
                        right: index == commentHotWalls.length - 1 ? 20.w : 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5.w, top: 5.h),
                          alignment: Alignment.topRight,
                          height: 220.h,
                          width: 160.h,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.vertical(
                                top: Radius.elliptical(4, 4),
                              ),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(commentHotWalls[index]
                                      .simpleResourceInfo
                                      .songCoverUrl),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 245, 245, 1),
                              borderRadius: new BorderRadius.vertical(
                                bottom: Radius.elliptical(4, 4),
                              )),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 160.w,
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
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                          fit: BoxFit.fill, imageUrl:   commentHotWalls[index]
                                        .simpleUserInfo
                                        .avatar,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("..."),
                                  Container(
                                    width: 100.w,
                                    margin: EdgeInsets.only(right: 5.w),
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
              ))
        ],
      ),
    );
  }

  //语音直播
  Widget _buildDj() {
    return Container(
      margin: EdgeInsets.only(top: 2240.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: Text("语音直播 悦心悦耳",
                    style: TextStyle(
                        fontSize: 38.sp, fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () {
                  //查看更多
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black45, width: 1.w),
                      borderRadius:
                      new BorderRadius.all(Radius.elliptical(50, 50))),
                  margin: EdgeInsets.only(right: 30.w),
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                  child: Text("查看更多"),
                ),
              )
            ],
          ),
          Container(
              height: 340.h,
              margin: EdgeInsets.only(top: 20.h),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: hotDjPopular.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 20.w,
                        right: index == hotDjPopular.length - 1 ? 20.w : 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5.w, top: 5.h),
                          alignment: Alignment.topRight,
                          height: 220.h,
                          width: 160.h,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.vertical(
                                top: Radius.elliptical(4, 4),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(hotDjPopular[index]
                                      .avatarUrl),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(5.h),
                                    child: ClipOval(
                                      child: SizedBox(
                                        width: 30.h,
                                        height: 30.h,
                                        child: Image.network(
                                          hotDjPopular[index]
                                              .avatarUrl,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    margin: EdgeInsets.only(right: 5.w),
                                    child: new Text(
                                      hotDjPopular[index]
                                          .nickName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
              ))
        ],
      ),
    );
  }

  //新歌
  Widget _buildRecommendNewSongs() {
    return Container(
      margin: EdgeInsets.only(top: 2620.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: Text("新歌",
                    style: TextStyle(
                        fontSize: 38.sp, fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () {
                  //查看更多
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black45, width: 1.w),
                      borderRadius:
                      new BorderRadius.all(Radius.elliptical(50, 50))),
                  margin: EdgeInsets.only(right: 30.w),
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                  child: Text("播放全部"),
                ),
              )
            ],
          ),
          Container(
              height: 400.h,
              margin: EdgeInsets.only(top: 20.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 3,
                  // 左右间隔
                  crossAxisSpacing: 10.0,
                  // 上下间隔
                  mainAxisSpacing: 10.0,
                  //宽高比
                  childAspectRatio: 0.185,
                  //子组件宽高长度比例
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: newSongs.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          height: 90.h,
                          width: 90.h,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.vertical(
                                  top: Radius.elliptical(4, 4),
                                  bottom: Radius.elliptical(4, 4)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      newSongs[index].picUrl),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 250.w,
                                    ),
                                    margin: EdgeInsets.only(left: 16.w),
                                    child: Text(
                                      newSongs[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 26.sp),
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 150.w,
                                    ),
                                    child: Text(
                                      " - ${newSongs[index].song.artists[0].name}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black45),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 400.w,
                                constraints: BoxConstraints(
                                  maxWidth: 400.w,
                                ),
                                margin: EdgeInsets.only(left: 16.w, top: 10.h),
                                child: Text("${newSongs[index].copywriter==null?"":newSongs[index].copywriter}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black45)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30.w, top: 20.h),
                          alignment: Alignment.centerRight,
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: new Border.all(
                                  color: Colors.black12, width: 1.w)),
                          child: IconButton(
                              icon: new ImageIcon(
                                AssetImage(R.assetsImgIcArrowRedPlay),
                                color: AppColors.color_main,
                                size: 10,
                              ),
                              onPressed: () {
                                //播放
                              }),
                        )
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void updateBanner(BannerEntity bannerEntity) {
    banners.addAll(bannerEntity.banners);
  }

  @override
  void updateRecommend(RecommendResourceEntity entity) {
    resourceRecommends.addAll(entity.recommend);
  }

  Future<void> _refresh() async {
    banners.clear();
    resourceRecommends.clear();
    songRecommends.clear();
    personalized.clear();
    commentHotWalls.clear();
    hotDjPopular.clear();
    newSongs.clear();
    DiscoverModel.getBanners(this);
    DiscoverModel.getRecommendResource(this);
    DiscoverModel.getRecommendSongs(this);
    DiscoverModel.getPersonalized(this);
    DiscoverModel.getCommentHotWall(this);
    DiscoverModel.getRecommendDj(this);
    DiscoverModel.getRecommendNewSongs(this);
    await Future.delayed(Duration(milliseconds: 2000));
    _refreshController.refreshCompleted();
    setState(() {});
  }

  @override
  void updateRecommendSongs(RecommendSongsEntity entity) {
    songRecommends.addAll(entity.recommend.sublist(0, 12));
  }

  @override
  void updatePersonalized(PersonalizedEntity entity) {
    personalized.addAll(entity.result);
  }

  @override
  void updateCommentHotWall(CommentHotWallEntity entity) {
    commentHotWalls.addAll(entity.data.sublist(0, 6));
  }

  @override
  void updateRecommendDj(DjPopularEntity entity) {
    hotDjPopular.addAll(entity.data.xList);
  }

  @override
  void updateNewSongs(NewSongEntity entity) {
    newSongs.addAll(entity.result);
  }



}

