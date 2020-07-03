import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/provider/notice_provider.dart';
import 'package:mymusic/user/model/model_notice.dart';
import 'package:mymusic/utils/date_util.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivateLettersPage extends StatefulWidget {
  @override
  _PrivateLettersPageState createState() => _PrivateLettersPageState();
}

class _PrivateLettersPageState extends State<PrivateLettersPage> {
  @override
  void initState() {
    NoticeModel.getMsgPrivate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, Notice notice, Widget child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              print(notice.msgPrivateEntity.msgs[index]);
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 30.h),
                    child: ClipOval(
                        child: CachedNetworkImage(
                      imageUrl: notice.msgPrivateEntity == null
                          ? ""
                          : notice
                              .msgPrivateEntity.msgs[index].fromUser.avatarUrl,
                      width: 100.w,
                      height: 100.w,
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 120.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 350.w,
                          margin: EdgeInsets.only(left: 20.w, top: 30.h),
                          child: Text(notice
                              .msgPrivateEntity.msgs[index].fromUser.nickname),
                        ),
                        Container(
                          width: 400.w,
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text(
                            json.decode(notice
                                .msgPrivateEntity.msgs[index].lastMsg)['msg'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black45, fontSize: 24.sp),
                          ),
                        ),
                        Container(
                          height: 1.h,
                          margin: EdgeInsets.only(top: 20.h),
                          child: Divider(height: 1.h, color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h, right: 50.w),
                    alignment: Alignment.topRight,
                    child: Text(
                        DateUtils.formatDateMs(
                            notice.msgPrivateEntity.msgs[index].lastMsgTime),
                        style:
                            TextStyle(color: Colors.black45, fontSize: 24.sp)),
                  ),
                  Visibility(
                    visible: notice.msgPrivateEntity.msgs[index].newMsgCount !=
                            null &&
                        notice.msgPrivateEntity.msgs[index].newMsgCount != 0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 35.w,
                        height: 35.w,
                        margin: EdgeInsets.only(right: 50.w, top: 70.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Text(
                            "${notice.msgPrivateEntity.msgs[index].newMsgCount == null ? 0 : notice.msgPrivateEntity.msgs[index].newMsgCount}",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 28.sp, color: Colors.white)),
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: notice.msgPrivateEntity == null
                ? 0
                : notice.msgPrivateEntity.msgs.length);
      },
    );
  }
}
