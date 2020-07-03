import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyFriendPage extends StatefulWidget {
  @override
  _MyFriendPageState createState() => _MyFriendPageState();
}

class _MyFriendPageState extends State<MyFriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的好友"),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }
}
