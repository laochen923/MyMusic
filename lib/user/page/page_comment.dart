import 'package:flutter/material.dart';
import 'package:mymusic/user/model/model_notice.dart';
class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  @override
  void initState() {
    NoticeModel.getMsgComments(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("评论"),
    );
  }
}
