import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/video/entity/video_entity.dart';
import 'package:mymusic/video/entity/video_group_entity.dart';
import 'package:mymusic/video/model/model_video.dart';
import 'package:mymusic/video/view/view_video.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoGroupPage extends StatefulWidget {
  VideoGroupPage({Key key, @required this.id}) : super(key: key);
  final int id;

  @override
  _VideoGroupPageState createState() => _VideoGroupPageState();
}

class _VideoGroupPageState extends State<VideoGroupPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin, VideoView {
  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);
  List<VideoData> videos = new List();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: videos.length == 0
          ? Text("")
          : SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: new NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _buildVideoItem(index);
                  },
                  itemCount: videos.length,
                ),
              ),
            ),
      controller: _refreshController,
      onRefresh: _refresh,
      onLoading: _loadMore,
    );
  }

  @override
  void updateTabs(VideoGroupEntity entity) {}

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Future<void> _refresh() async {
    videos.clear();
    VideoModel.getVideoGroup(widget.id, this);
    await Future.delayed(Duration(milliseconds: 2000));
    _refreshController.refreshCompleted();
    setState(() {});
  }

  Widget _buildVideoItem(index) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
            width: ScreenUtil.screenWidth,
            height: 400.h,
            child: VideoWidget(
                play: false,
                url: videos[index].data.urlInfo.url,
                placeholder: videos[index].data.coverUrl),
          ),
          Container(
            margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
            child: Text(videos[index].data.title,
                maxLines: 2, overflow: TextOverflow.ellipsis),
          ),
          Container(
            margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 30.h),
            child: Divider(height: 1.h, color: Colors.black12),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25.w, top: 30.h, bottom: 20.h),
                child: CircleAvatar(
                  radius: 40.h,
                  backgroundImage: CachedNetworkImageProvider(
                      videos[index].data.creator.avatarUrl),
                ),
              ),
              Container(
                width: 300.w,
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "${videos[index].data.creator.nickname}",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Stack(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30.w, bottom: 28.h),
                        child: Text(" ${videos[index].data.praisedCount}",
                            style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 18.sp))),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      alignment: Alignment.center,
                      child: Image.asset(R.assetsImgIcThumbs, height: 40.h),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40.w),
                child: Stack(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30.w, bottom: 28.h),
                        child: Text(" ${videos[index].data.commentCount}",
                            style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 18.sp))),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      alignment: Alignment.center,
                      child:
                          Image.asset(R.assetsImgIcCommentBlack, height: 40.h),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 40.w),
                  child: Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Colors.black45,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 20.h,
            color: Color.fromRGBO(243, 243, 243, 1),
          ),
        ],
      ),
    );
  }

  @override
  void updateVideos(VideoEntity entity) {
    videos.addAll(entity.datas);
  }

  Future<void> _loadMore() async {
    VideoModel.getVideoGroup(widget.id, this);
    await Future.delayed(Duration(milliseconds: 2000));
    _refreshController.loadComplete();
    setState(() {});
  }
}

class VideoWidget extends StatefulWidget {
  final bool play;
  final String url;
  final String placeholder;

  const VideoWidget(
      {Key key,
      @required this.url,
      @required this.play,
      @required this.placeholder})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController = new VideoPlayerController.network(widget.url);

    _initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
      //       Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: widget.play,
        looping: false,
        showControlsOnInitialize: false);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        videoPlayerController.value.isPlaying
            ? videoPlayerController.pause()
            : videoPlayerController.play();
      },
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return new Container(
              width: ScreenUtil.screenWidth,
              height: 400.h,
              child: Chewie(
                key: new PageStorageKey(widget.url),
                controller: chewieController,
              ),
            );
          } else {
            return new Container(
            child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
