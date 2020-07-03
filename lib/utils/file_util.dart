import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<void> saveData(String contents, String fileName) async {
    try{
      Directory tempDir = await getApplicationDocumentsDirectory();
      String _dir = tempDir.path + "/data/";
      final Directory directory = new Directory(_dir);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      File file = new File('$_dir${fileName}.txt');
      file.writeAsStringSync(contents);
    }catch(e){

    }

  }

  static Future<String> readData(String fileName) async {
    try {
      Directory tempDir = await getApplicationDocumentsDirectory();
      String _dir = tempDir.path + "/data/";
      final Directory directory = new Directory(_dir);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      File file = new File('$_dir${fileName}.txt');
      return file.readAsStringSync();
    }catch(e){}
  }

  static Future<String> scanningLocalMusic(String fileName) async {
    try {
      Future<List<
          Directory>> _externalStorageDirectories = getExternalStorageDirectories(
          type: StorageDirectory.music);
      _externalStorageDirectories.then((value) {
        for (Directory dir in value) {
          Stream<FileSystemEntity> stream = dir.list();
          print("stream${stream.first}");
        }
      });
    }catch(e){}
    return "";
  }
}
