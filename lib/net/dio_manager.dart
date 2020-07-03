import 'dart:convert';


import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/common/app_setting.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/net/result_code.dart';
import 'package:mymusic/utils/loguitl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
/*
 * 网络请求管理类
 */
class DioManager {
  //写一个单例
  //在 Dart 里，带下划线开头的变量是私有变量
  static DioManager _instance;

  static DioManager getInstance() {
    if (_instance == null) {
      _instance = DioManager();
    }
    return _instance;
  }

  static void init() {
    if (_instance == null) {
      _instance = DioManager();
    }
  }

  Dio dio = new Dio();
  Response exceptionResponse;

  DioManager() {
    dio.options.headers = {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json',
      'Authorization': "**",
      'User-Aagent': "4.1.0;android;6.0.1;default;A001",
      "HZUID": "2",
    };
    dio.options.baseUrl = Constants.BASE_URL;
    dio.options.connectTimeout = Constants.CONNECT_TIMEOUT;
    dio.options.receiveTimeout = Constants.RECEIVE_TIMEOUT;
    getCookiePath().then((val) {
      dio.interceptors
          .add(CookieManager(PersistCookieJar(dir: val, ignoreExpires: true)));
    });
    dio.interceptors
        .add(LogInterceptor(responseBody: GlobalConfig.isDebug)); //是否开启请求日志
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // 在请求被发送之前做一些事情
      return options; //continue
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (Response response) async {
      // 在返回响应数据之前做一些预处理
      try{
        if (response.data["code"] != 200) {
          exceptionResponse = response;
        }
      }catch(e){

      }

      print(response);
      return response; // continue
    }, onError: (DioError e) async {
      // 当请求失败时做一些预处理
      return e; //continue
    }));
  }

  Future<String> getCookiePath() async {
    if(!kIsWeb) {
      Directory tempDir = await getApplicationDocumentsDirectory();
      return tempDir.path + "/cookies/";
    }else{
      return "";
    }
  }

  //get请求
  get(String url, Map<String, dynamic> params, Function successCallBack,
      Function errorCallBack) async {
    _requstHttp(url, successCallBack, 'get', params, errorCallBack);
  }

  //post请求
  post(String url, params, Function successCallBack,
      Function errorCallBack) async {
    _requstHttp(url, successCallBack, "post", params, errorCallBack);
  }

  _requstHttp(String url, Function successCallBack,
      [String method,
      Map<String, dynamic> params,
      Function errorCallBack]) async {
    Response response;
    try {
      if (method == 'get') {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null && params.isNotEmpty) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error) {
      // 请求错误处理
      error.response = exceptionResponse;
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      } else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      } else if (error.type == DioErrorType.RESPONSE) {
        errorResponse.statusCode = ResultCode.RESPONSE;
      } else if (error.type == DioErrorType.CANCEL) {
        errorResponse.statusCode = ResultCode.CANCEL;
      } else {
        errorResponse.statusCode = ResultCode.DEFAULT;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        LogUtil.d('Request Exception: ' + error.toString());
        LogUtil.d('ExceptionUrl: ' + url);
        LogUtil.d('Headers: ' + dio.options.headers.toString());
      }
      if (error.response != null) {
        String dataStr = json.encode(error.response.data);
        _error(errorCallBack, dataStr);
      } else {
        _error(errorCallBack, error.message);
      }
      return '';
    }
    // debug模式打印相关数据
    if (GlobalConfig.isDebug) {
      LogUtil.d('RequestUrl: ' + url);
      LogUtil.d('Headers: ' + dio.options.headers.toString());
      if (params != null) {
        LogUtil.d('RequestParams: ' + params.toString());
      }
      if (response != null) {
        LogUtil.d('ResponseParams: ' + response.toString());
        LogUtil.saveLog(response.toString(), url.replaceAll("/", "_"));
      }
    }
    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap == null || dataMap['state'] == 0) {
      _error(errorCallBack, dataStr);
    } else if (successCallBack != null) {
      successCallBack(dataMap);
    }
  }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }

  downloadFile(String url,String name, BuildContext context) async {
    //设置连接超时时间
    dio.options.connectTimeout = 10000;
    //设置数据接收超时时间
    dio.options.receiveTimeout = 10000;
    Response response = await dio.download(url, _findLocalPath(context,name),onReceiveProgress:(int count,int total){
      print("$count $total");
    });
    if (response.statusCode == 200) {
      print('下载请求成功');
    }
  }

  Future<String> _findLocalPath(BuildContext context,String name) async {
    // 因为Apple没有外置存储，所以第一步我们需要先对所在平台进行判断
    // 如果是android，使用getExternalStorageDirectory
    // 如果是iOS，使用getApplicationSupportDirectory
    if(!kIsWeb) {
      final directory = Theme
          .of(context)
          .platform == TargetPlatform.android
          ? await getExternalStorageDirectory()
          : await getApplicationSupportDirectory();
      var _localPath = directory.path + '/Download';
      final savedDir = Directory(_localPath);
      //判断下载路径是否存在
      bool hasExisted = await savedDir.exists();
      //不存在就新建路径
      if (!hasExisted) {
        savedDir.create();
      }
      return savedDir.path;
    }
  }
}
