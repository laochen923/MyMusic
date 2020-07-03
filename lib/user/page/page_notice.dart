import 'package:flutter/material.dart';
import 'package:mymusic/user/model/model_notice.dart';
class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  void initState() {
    NoticeModel.getMsgNotices(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("通知"),
    );
  }
}
