
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
class LogUtil {
  static var _separator = "=";
  static var _split =
      "$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator";
  static var _isDebug = true;
  static int _limitLength = 800;
  static String _startLine = "";
  static String _endLine = "";

  static void init({String title, @required bool isDebug,int limitLength}) {
    _isDebug = isDebug;
    _limitLength = limitLength??=_limitLength;
    var endLineStr = StringBuffer();
    var cnCharReg = RegExp("[\u4e00-\u9fa5]");
    for (int i = 0; i < _startLine.length; i++) {
      if (cnCharReg.stringMatch(_startLine[i]) != null) {
        endLineStr.write(_separator);
      }
      endLineStr.write(_separator);
    }
    _endLine = endLineStr.toString();
  }

  //仅Debug模式可见
  static void d(dynamic obj) {
    if (_isDebug) {
      _log(obj.toString());
    }
  }

  static void v(dynamic obj) {
    _log(obj.toString());
  }

  static void _log(String msg) {
    print("$_startLine");
    _logEmpyLine();
    if(msg.length<_limitLength){
      print(msg);
    }else{
      segmentationLog(msg);
    }
    _logEmpyLine();
    print("$_endLine");
  }

  static void segmentationLog(String msg) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index!=0) {
        print(outStr);
        outStr.clear();
        var lastIndex = index+1;
        if(msg.length-lastIndex<_limitLength){
          var remainderStr = msg.substring(lastIndex,msg.length);
          print(remainderStr);
          break;
        }
      }
    }
  }

  static void _logEmpyLine(){
    print("");
  }

  static Future<void> saveLog(String contents,String fileName) async {
    if(!kIsWeb) {
      Directory tempDir = await getApplicationDocumentsDirectory();
      String _dir = tempDir.path + "/log/";
      final Directory directory = new Directory(_dir);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      File file = new File('$_dir${fileName}_log.log');
      file.writeAsStringSync(contents);
    }
  }
}