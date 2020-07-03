import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymusic/my/entity/personal_fm_entity.dart';
import 'package:mymusic/my/entity/personalized_dj_entity.dart';
import 'package:mymusic/my/entity/song_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/my/model/model_radio.dart';
import 'package:mymusic/my/view/view_radio.dart';
import 'package:mymusic/widgets/play_widget.dart';

import '../../r.dart';

class PersonalFmPage extends StatefulWidget {
  @override
  _PersonalFmPageState createState() => _PersonalFmPageState();
}

class _PersonalFmPageState extends State<PersonalFmPage> with RadioView{
  List<PersonalFmData> result;
  @override
  void initState() {
    RadioModel.getPersonalFm(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("私人FM"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20.w,top: 30.h),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //横轴元素个数
                    crossAxisCount: 3,
                    // 左右间隔
                    crossAxisSpacing: 10.0,
                    // 上下间隔
                    mainAxisSpacing: 10.0,
                    //宽高比
                    childAspectRatio: 0.75,
                    //子组件宽高长度比例
                  ),
                  itemBuilder: (context, index) {
                    return Column(
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
                                    imageUrl: result != null
                                        ? result[index].album.picUrl
                                        : "",
                                    width: 160.w,
                                    height: 160.w,
                                    fit: BoxFit.fill,
                                  ))),
                        ),
                        Container(
                          child: Container(
                              margin: EdgeInsets.only(left: 20.w, top: 20.h),
                              child: Text(
                                "${result == null ? "" : result[index].album.name}",
                                style: TextStyle(fontSize: 26.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,)),
                        )
                      ],
                    );
                  },
                  itemCount: result == null ? 0 : result.length,
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics()),
            )
          ],
        ),
      ),
        bottomNavigationBar: PlayWidget()
    );
  }

  @override
  void updateMyRadio() {
  }

  @override

  void updatePersonalizedDj(PersonalizedDjEntity entity) {
  }

  @override
  void updatePersonalFm(PersonalFmEntity entity) {
    result=entity.data;
    setState(() {

    });
  }
}
