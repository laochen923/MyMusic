import 'package:flutter/material.dart';
import 'package:mymusic/user/model/model_notice.dart';
class ToMePage extends StatefulWidget {
  @override
  _ToMePageState createState() => _ToMePageState();
}

class _ToMePageState extends State<ToMePage> {
  @override
  void initState() {
    NoticeModel.getMsgForwards(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("@我"),
    );
  }
}
