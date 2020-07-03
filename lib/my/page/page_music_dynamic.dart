

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mymusic/my/model/model_song.dart';
import 'package:mymusic/my/view/view_share.dart';
import 'package:mymusic/provider/music_provider.dart';
import 'package:mymusic/r.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class MusicDynamicPage extends StatefulWidget {
  @override
  _MusicDynamicPageState createState() => _MusicDynamicPageState();
}

class _MusicDynamicPageState extends State<MusicDynamicPage> with ShareView{
  TextEditingController _shareController = new TextEditingController();

  List<File> images=new List();
  @override
  void initState() {
    if(!kIsWeb){
      images.add(new File("add"));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分享到云音乐"),
        actions: <Widget>[
         InkWell(
           onTap: (){
              SongModel.shareToCloudMusic(this,Provider.of<MusicPlay>(context,listen: false).songListEntity.playlist.id,"playlist",_shareController.text);
           },
           child:Container(
             margin: EdgeInsets.only(right: 20.w),
             alignment: Alignment.center,
             child: Text("分享",style: TextStyle(fontSize: 34.sp)),
           ),
         )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10.h),
            color: Color.fromRGBO(245, 245, 245, 1),
            child: Column(
              children: <Widget>[
                TextField(
                    maxLines: 6,
                    controller: _shareController,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 32.sp),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20.w),
                      focusColor: Colors.black,
                      hintText: "一起聊聊吧~",
                      hintStyle: TextStyle(color: Colors.black45),
                      border: InputBorder.none,
                    )),
                Container(
                 margin: EdgeInsets.only(left: 20.w,right: 20.w),
                 child:  GridView.builder( shrinkWrap: true, scrollDirection: Axis.vertical,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   //横轴元素个数
                   crossAxisCount: 4,
                   // 左右间隔
                   crossAxisSpacing: 10.0,
                   // 上下间隔
                   mainAxisSpacing: 10.0,
                   //宽高比
                   childAspectRatio: 1,
                   //子组件宽高长度比例
                 ),itemCount: images.length,itemBuilder: (context,index){
                   return InkWell(
                     onTap: (){
                       if(index==images.length-1){
                         print("getImage");
                         getImage();
                       }else{
                         //图片放大
                         print("object");
                       }
                     },
                     child: Stack(
                       children: <Widget>[Container(
                         width: 140.w,
                         height: 140.w,
                         child:ClipRRect(borderRadius: BorderRadius.circular(4.0),child: index==images.length-1?Image.asset(R.assetsImgIcAddImg,fit: BoxFit.fill,color: Colors.black12,):Image.asset(images[index].path,fit: BoxFit.fill)) ,
                       ),
                      InkWell(
                        onTap: (){
                          print("remove");
                          images.removeAt(index);
                          setState(() {

                          });
                        },
                        child: Container(
                          width: 30.w,
                          height: 30.w,
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(left: 110.w),
                          child:  index==images.length-1?Text(""):Image.asset(R.assetsImgIcDelImg,width: 30.w,),
                        ),
                      )
                       ],
                     ),
                   );
                 }),
               ),
                Container(child:Divider(height: 1.h,color: Colors.black12,)),
                Container(
                  child:  Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 20.w, top: 20.h),
                          width: 120.w,
                          height: 120.w,
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
                                      .name)
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w,top: 10.h),
                            child: Text(
                                "创建者：${Provider.of<MusicPlay>(context, listen: false).songListEntity.playlist.creator.nickname}",style: TextStyle(fontSize: 24.sp,color: Colors.black45)),
                          )
                        ],
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    images.insert(0,image);
    setState(() {

    });
  }

  @override
  void shareSuccess() {
    Fluttertoast.showToast(msg: "分享成功");
    Navigator.pop(context);
  }
}
