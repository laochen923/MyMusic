import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/my/entity/comments_entity.dart';
import 'package:mymusic/my/entity/share_item_entity.dart';
import 'package:mymusic/my/model/model_song.dart';
import 'package:mymusic/my/view/view_comment.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/utils/date_util.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> with CommentView {
  TextEditingController _commentController = new TextEditingController();
  CommentsEntity _commentsEntity;
  List<ShareItem> _bottomItems=new List();
  String copyLink;
  var musicPlay;
  @override
  void initState() {
    SongModel.getComments(
        this,
        Provider.of<MusicPlay>(context, listen: false)
            .songListEntity
            .playlist
            .id,
        0,
        null);
     musicPlay= Provider.of<MusicPlay>(context,listen: false).songListEntity;
    _bottomItems.add(new ShareItem(R.assetsImgIcShareFriend,"微信朋友圈","shareFriend"));
    _bottomItems.add(new ShareItem(R.assetsImgIcShareWx,"微信好友","shareWx"));
    _bottomItems.add(new ShareItem(R.assetsImgIcShareQqzone,"QQ空间","shareQqZone"));
    _bottomItems.add(new ShareItem(R.assetsImgIcShareQq,"QQ好友","shareQq"));
    _bottomItems.add(new ShareItem(R.assetsImgIcShareWb,"微博","shareWb"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评论"),
        actions: <Widget>[
          InkWell(
            onTap: () {
              shareMessage();
            },
            child: Container(
              padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 30.h),
              child: Icon(Icons.share),
            ),
          )
        ],
      ),
      body: Stack(
       children: <Widget>[
         SingleChildScrollView(
             child: Container(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Container(
                           margin: EdgeInsets.only(left: 20.w, top: 20.h),
                           width: 140.w,
                           height: 140.w,
                           child: ClipRRect(
                             borderRadius: BorderRadius.vertical(
                                 top: Radius.elliptical(4, 4),
                                 bottom: Radius.elliptical(4, 4)),
                             child: CachedNetworkImage(
                               imageUrl:
                               Provider.of<MusicPlay>(context, listen: false)
                                   .songListEntity
                                   .playlist
                                   .coverImgUrl,
                             ),
                           )),
                       Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Container(
                             margin: EdgeInsets.only(left: 20.w),
                             child: Text(
                                 Provider.of<MusicPlay>(context, listen: false)
                                     .songListEntity
                                     .playlist
                                     .name),
                           ),
                           Container(
                             margin: EdgeInsets.only(left: 20.w),
                             child: Text(
                                 "by ${Provider.of<MusicPlay>(context, listen: false).songListEntity.playlist.creator.nickname}"),
                           )
                         ],
                       ),
                       InkWell(
                         onTap: () {
                           Navigator.pop(context);
                         },
                         child: Container(
                           margin: EdgeInsets.only(left: 320.w),
                           child: Image.asset(R.assetsImgIcArrowR, height: 40.h),
                         ),
                       )
                     ],
                   ),
                   Container(
                     margin: EdgeInsets.only(top: 20.h),
                     height: 15.h,
                     color: Colors.black12,
                   ),
                   Row(
                     children: <Widget>[
                       Container(
                         margin: EdgeInsets.only(left: 20.w, top: 30.h),
                         child: Text("最新评论",
                             style: TextStyle(fontWeight: FontWeight.bold)),
                       ),
                       Container(
                         margin: EdgeInsets.only(top: 30.h),
                         child: Text(
                           "${_commentsEntity != null ? _commentsEntity.total : 0}",
                           style: TextStyle(color: Colors.black38, fontSize: 30.sp),
                           textAlign: TextAlign.end,
                         ),
                       )
                     ],
                   ),
                   buildComment()
                 ],
               ),
             )
         ),
          Align(
            alignment: Alignment.bottomCenter,
            child:  Stack(
              children: <Widget>[
                Container(

                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: new Border(
                          top:
                          BorderSide(color: Colors.black12, width: 1))
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 550.w,
                        height: 100.h,

                        child: TextField(
                            controller: _commentController,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black, fontSize: 32.sp),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20.w),
                              focusColor: Colors.black,
                              hintText: "随乐而起，有感而发",
                              hintStyle: TextStyle(color: Colors.black45),
                              border: InputBorder.none,
                            )),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(top: 15.h),
                        height: 60.w,
                        child: Image.asset(
                          R.assetsImgIcTie,
                          width: 50.w,
                          height: 50.w,
                          color: Colors.black45,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          SongModel.comment(
                              this,
                              1,
                              2,
                              Provider.of<MusicPlay>(context, listen: false)
                                  .songListEntity
                                  .playlist
                                  .id,
                              _commentController.text,
                              null);
                        },
                        child: Container(
                          height: 60.w,
                          width: 60.w,
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 10.h, left: 30.w),
                          child: Text("发送"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
       ]
      ),
    );
  }



  @override
  void updateComments(CommentsEntity entity) {
    _commentsEntity = entity;
    setState(() {});
  }

  Widget buildComment() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30.w, top: 30.h),
                  child: ClipOval(
                      child: CachedNetworkImage(
                    imageUrl: _commentsEntity != null
                        ? _commentsEntity.comments[index].user.avatarUrl
                        : "",
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.fill,
                  )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Text(
                          "${_commentsEntity.comments[index].user.nickname}",
                          style: TextStyle(fontSize: 28.sp)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "${DateUtils.formatDateMs(_commentsEntity.comments[index].time)}",
                        style:
                            TextStyle(color: Colors.black45, fontSize: 23.sp),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 320.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      _commentsEntity.comments[index].likedCount == 0
                          ? Text("")
                          : Container(
                              child: Text(
                                  "${_commentsEntity.comments[index].likedCount}",
                                  style: TextStyle(color: Colors.red)),
                            ),
                      InkWell(
                        onTap: () {
                          int t = 0;
                          if (_commentsEntity.comments[index].liked) {
                            t = 0;
                            _commentsEntity.comments[index].liked = false;
                            _commentsEntity.comments[index].likedCount--;
                          } else {
                            t = 1;
                            _commentsEntity.comments[index].liked = true;
                            _commentsEntity.comments[index].likedCount++;
                          }
                          SongModel.commentLike(
                              this,
                              Provider.of<MusicPlay>(context, listen: false)
                                  .songListEntity
                                  .playlist
                                  .id,
                              _commentsEntity.comments[index].commentId,
                              t,
                              2);
                          setState(() {});
                        },
                        child: Container(
                          width: 40.w,
                          child: Image.asset(R.assetsImgIcThumbs,
                              width: 40.w,
                              color: _commentsEntity.comments[index].liked
                                  ? Colors.red
                                  : Colors.black45),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 110.w, top: 30.h),
              child: Text(
                "${_commentsEntity.comments[index].content}",
                style: TextStyle(fontSize: 30.sp),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 110.w, top: 30.h),
              child: Divider(
                height: 1.h,
                color: Colors.black38,
              ),
            )
          ],
        );
      },
      itemCount: _commentsEntity != null ? _commentsEntity.comments.length : 0,
    );
  }

  @override
  void commentsSuccess() {
    SongModel.getComments(
        this,
        Provider.of<MusicPlay>(context, listen: false)
            .songListEntity
            .playlist
            .id,
        0,
        null);
  }

  var bottomSheetKey = new GlobalKey();
  //分享
  void shareMessage() {
    final RenderBox box = context.findRenderObject();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return SizedBox(
            height: 300.h,
            child: StatefulBuilder(
              key: bottomSheetKey,
              builder: (context, state) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(8, 8)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 30.w, top: 30.h),
                            child: Text("分享")),
                        Expanded(
                          child:  ListView.builder(
                            itemCount: _bottomItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return  InkWell(
                                onTap: (){
                                  print(_bottomItems[index].key);
                                  Navigator.pop(context);
                                  switch(_bottomItems[index].key){
                                    case "shareFriend":
                                      Share.share("text",
                                          subject: "subject",
                                          sharePositionOrigin:
                                          box.localToGlobal(Offset.zero) &
                                          box.size);
                                      break;
                                    case "shareWx":

                                      break;
                                    case "shareQqZone":

                                      break;
                                    case "shareQq":

                                      break;
                                    case "shareWb":

                                      break;
                                  }
                                },
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(left: 50.w,top: 30.h),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: new BorderRadius.all(
                                                  Radius.elliptical(50, 50))),
                                          child: Image.asset(_bottomItems[index].icon,
                                              width: 100.w)
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 50.w),
                                        child: Text("${_bottomItems[index].name}",style: TextStyle(fontSize: 26.sp),),
                                      )
                                    ]),
                              );
                            },
                          ),
                        ),
                      ],
                    ));
              },
            ),
          );
        });
  }
}
