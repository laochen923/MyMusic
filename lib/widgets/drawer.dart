import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/global.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/router/routers.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          //移除抽屉菜单顶部默认留白
          removeTop: true,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.assetsImgIcDrawerVipBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(R.assetsImgIcDrawerVipBg),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    height: 300.h,
                    margin: EdgeInsets.only(top: 50.h),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(R.assetsImgIcDrawerVipFo),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(
                                  80.w,
                                  90.h,
                                  0,
                                  0),
                              child: new Image.asset(
                                R.assetsImgIcKtVipText,
                                height: 32.h,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(R.assetsImgIcKtVipBg),
                                ),
                              ),
                              height: 25,
                              margin: EdgeInsets.fromLTRB(0, 90.h, 40.h, 0),
                              child: FlatButton(
                                onPressed: () {
                                  //会员中心
                                  navigateToOpenVipPage();
                                },
                                child: Text("会员中心",
                                    style: TextStyle(
                                        color: Color.fromRGBO(97, 97, 97, 1),
                                        fontSize: 24.sp)),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(   80.w,
                              0, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text("加入黑胶VIP，立享超12...",
                              style: TextStyle(
                                  color: Color.fromRGBO(193, 193, 193, 1),
                                  fontSize: 12)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      80.w,
                                      30.h,
                                      0,
                                      0),
                                  alignment: Alignment.topLeft,
                                  child: Text("首月仅5元",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(238, 218, 213, 1),
                                          fontSize: 12)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  margin: EdgeInsets.fromLTRB(
                                      80.w,
                                      0,
                                      0,
                                      0),
                                  alignment: Alignment.topLeft,
                                  child: Text("尊享现场音乐，体验最high...",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(193, 193, 193, 1),
                                          fontSize: 12)),
                                )
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  //开通会员
                                  navigateToOpenVipPage();
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0,
                                      30.h,
                                      60.w,
                                      0),
                                  alignment: Alignment.centerRight,
                                  child: new Image.asset(
                                    R.assetsImgIcArrowR,
                                    height:    26.h,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.vertical(
                          top: Radius.elliptical(8, 8)), // 也可控件一边圆角大小
                      color: Colors.white),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: ClipOval(
                                  child: Image.network(
                                    Global.userEntity!=null?Global.userEntity.profile.avatarUrl:"",
                                    width:80.w,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  Global.userEntity!=null?Global.userEntity.profile.nickname:"",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: 30.w),
                            decoration: BoxDecoration(
                                color: AppColors.color_main,
                                borderRadius: new BorderRadius.all(
                                    Radius.elliptical(50, 50))),
                            height: 50.h,
                            width: 100.w,
                            child: FlatButton(
                              onPressed: () {
                                //会员中心
                                navigateToOpenVipPage();
                              },
                              padding: EdgeInsets.all(0),
                              child: Text("签到",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 60.h),
                        height: 160.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Routers.navigateTo(context, Routers.myMessagePage);
                                },
                                child: Column(
                                  children: <Widget>[
                                    ImageIcon(
                                        AssetImage(R.assetsImgIcMyMessage),
                                        size:80.w,
                                        color: Color.fromRGBO(221, 0, 27, 1)),
                                    Text("我的消息",
                                        style: TextStyle(
                                            fontSize: 26.sp,
                                            color:
                                                Color.fromRGBO(95, 95, 95, 1)))
                                  ],
                                )),
                            InkWell(
                                onTap: () {
                                  //我的好友
                                  Navigator.pop(context);
                                  Routers.navigateTo(context, Routers.myFriendPage);
                                },
                                child: Column(
                                  children: <Widget>[
                                    ImageIcon(AssetImage(R.assetsImgIcMyFriend),
                                        size:80.w,
                                        color: Color.fromRGBO(221, 0, 27, 1)),
                                    Text("我的好友",
                                        style: TextStyle(
                                            fontSize: 26.sp,
                                            color:
                                                Color.fromRGBO(95, 95, 95, 1)))
                                  ],
                                )),
                            InkWell(
                                onTap: () {
                                  //个人主页
                                  Navigator.pop(context);
                                  Routers.navigateTo(context, Routers.personalInfoPage);
                                },
                                child: Column(
                                  children: <Widget>[
                                    ImageIcon(
                                        AssetImage(R.assetsImgIcPersonHome),
                                        size:80.w,
                                        color: Color.fromRGBO(221, 0, 27, 1)),
                                    Text("个人主页",
                                        style: TextStyle(
                                            fontSize: 26.sp,
                                            color:
                                                Color.fromRGBO(95, 95, 95, 1)))
                                  ],
                                )),
                            InkWell(
                                onTap: () {
                                  //个性装扮
                                },
                                child: Column(
                                  children: <Widget>[
                                    ImageIcon(AssetImage(R.assetsImgIcPerDress),
                                        size:80.w,
                                        color: Color.fromRGBO(221, 0, 27, 1)),
                                    Text("个性装扮",
                                        style: TextStyle(
                                            fontSize: 26.sp,
                                            color:
                                                Color.fromRGBO(95, 95, 95, 1)))
                                  ],
                                ))
                          ],
                        )),
                    Divider(
                        height: 1.h,
                        color: Color.fromRGBO(245, 245, 245, 1)),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 120.h,
                              margin: EdgeInsets.only(
                                  left: 40.w),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuCreate,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "创作者中心",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                              height: 2.h,
                              color: Color.fromRGBO(245, 245, 245, 1)),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 90.h,
                              margin: EdgeInsets.only(
                                  left: 40.w
                                 ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuLs,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "听歌识曲",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 90.h,
                              margin: EdgeInsets.only(
                                  left: 40.w
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuT,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "演出",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 90.h,
                              margin: EdgeInsets.only(
                                  left: 40.w
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuShop,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "商城",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 90.h,
                              margin: EdgeInsets.only(
                                  left: 40.w
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuNearby,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "附近的人",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 90.h,
                              margin: EdgeInsets.only(
                                  left: 40.w
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuGame,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "游戏推荐",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 90.h,
                              margin: EdgeInsets.only(
                                  left: 40.w
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuCl,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "口袋彩铃",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                              height: ScreenUtil().setWidth(2),
                              color: Color.fromRGBO(245, 245, 245, 1)),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 90.h,
                              margin: EdgeInsets.only(
                                  left: 40.w
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuDd,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "我的订单",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 90.h,
                                margin: EdgeInsets.only(
                                    left: 40.w,top: 10.h
                                ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    R.assetsImgIcMenuDs,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w),
                                    child: Text(
                                      "定时停止播放",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                              height: ScreenUtil().setWidth(2),
                              color: Color.fromRGBO(245, 245, 245, 1)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  print("夜间模式");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(10), bottom: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        R.assetsImgIcMenuNight,
                                        color: Color.fromRGBO(134, 134, 134, 1),
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w),
                                        child: Text(
                                          "夜间模式",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(color: Colors.black87),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(10), bottom: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        R.assetsImgIcMenuSetting,
                                        color: Color.fromRGBO(134, 134, 134, 1),
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w),
                                        child: Text(
                                          "设置",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(color: Colors.black87),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  //关闭App
                                  await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                                },
                                child: Container(
                                  height: 100.h,
                                  margin: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(10), bottom: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        R.assetsImgIcMenuLogout,
                                        color: Color.fromRGBO(134, 134, 134, 1),
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w),
                                        child: Text(
                                          "退出",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(color: Colors.black87),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )

                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                )),
              ],
            ),
          )),
    );
  }

  /**
   * 跳转到VIP开通界面
   */
  void navigateToOpenVipPage() {}
}
