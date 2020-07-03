import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/my/entity/personal_fm_entity.dart';
import 'package:mymusic/my/entity/personalized_dj_entity.dart';
import 'package:mymusic/my/model/model_radio.dart';
import 'package:mymusic/my/view/view_radio.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/utils/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/widgets/play_widget.dart';

class MyRadioPage extends StatefulWidget {
  @override
  _MyRadioPageState createState() => _MyRadioPageState();
}

class _MyRadioPageState extends State<MyRadioPage> with RadioView {
  List<PersonalizedDjResult> djs;

  @override
  void initState() {
    SharedPreferenceUtil.getInt("uid").then((value) {
      if (value > 0) {
        RadioModel.getUserRadio(value);
      }
    });
    RadioModel.getDjProgram(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的电台"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.h, left: 20.w),
              child: Row(
                children: <Widget>[
                  Container(
                    child:Image.asset(R.assetsImgIcLoveMusic,width: 70.w,),
                  )
                  , Text("为你推荐",
                      style:
                      TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
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
                                    imageUrl: djs != null
                                        ? djs[index].picUrl
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
                                "${djs == null ? "" : djs[index].copywriter}",
                                style: TextStyle(fontSize: 26.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,)),
                        )
                      ],
                    );
                  },
                  itemCount: djs == null ? 0 : djs.length,
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
    // TODO: implement updateMyRadio
  }

  @override
  void updatePersonalizedDj(PersonalizedDjEntity entity) {
    djs = entity.result;
    setState(() {

    });
  }

  @override
  void updatePersonalFm(PersonalFmEntity entity) {
    // TODO: implement updatePersonalFm
  }
}
