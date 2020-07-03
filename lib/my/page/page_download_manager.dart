import 'package:flutter/material.dart';
import 'package:mymusic/widgets/play_widget.dart';
class DownloadManagerPage extends StatefulWidget {
  @override
  _DownloadManagerPageState createState() => _DownloadManagerPageState();
}

class _DownloadManagerPageState extends State<DownloadManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下载管理"),
      ),
        bottomNavigationBar: PlayWidget()
    );
  }
}
