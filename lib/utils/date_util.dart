/*
 * @date on 2020/4/21 15:39
 * @author jack
 * @filename date_util.dart
 * @description 日期工具类
 */

import 'package:video_player/video_player.dart';

class DataFormats {
  static String full = "yyyy-MM-dd HH:mm:ss";
  static String y_mo_d_h_m = "yyyy-MM-dd HH:mm";
  static String y_mo_d = "yyyy-MM-dd";
  static String y_mo = "yyyy-MM";
  static String mo_d = "MM-dd";
  static String mo_d_h_m = "MM-dd HH:mm";
  static String h_m_s = "HH:mm:ss";
  static String h_m = "HH:mm";

  static String zh_full = "yyyy年MM月dd日 HH时mm分ss秒";
  static String zh_y_mo_d_h_m = "yyyy年MM月dd日 HH时mm分";
  static String zh_y_mo_d = "yyyy年MM月dd日";
  static String zh_y_mo = "yyyy年MM月";
  static String zh_mo_d = "MM月dd日";
  static String zh_mo_d_h_m = "MM月dd日 HH时mm分";
  static String zh_h_m_s = "HH时mm分ss秒";
  static String zh_h_m = "HH时mm分";
}

Map<int, int> MONTH_DAY = {
  1: 31,
  2: 28,
  3: 31,
  4: 30,
  5: 31,
  6: 30,
  7: 31,
  8: 31,
  9: 30,
  10: 31,
  11: 30,
  12: 31,
};

class DateUtils {
  /// month->days.
  static String full = "yyyy-MM-dd HH:mm:ss";

  static String getMonthShorthand(int month) {
    String shorthand;
    switch (month) {
      case 1:
        shorthand = "Jan";
        break;
      case 2:
        shorthand = "Feb";
        break;
      case 3:
        shorthand = "Mar";
        break;
      case 4:
        shorthand = "Apr";
        break;
      case 5:
        shorthand = "May";
        break;
      case 6:
        shorthand = "Jun";
        break;
      case 7:
        shorthand = "Jul";
        break;
      case 8:
        shorthand = "Aug";
        break;
      case 9:
        shorthand = "Sep";
        break;
      case 10:
        shorthand = "Oct";
        break;
      case 11:
        shorthand = "Nov";
        break;
      case 12:
        shorthand = "Dec";
        break;
    }

    return shorthand;
  }

  static String millisecondsToSeconds(int milliseconds) {
    String result = "";
    int hours = milliseconds ~/ (1000 * 60 * 60);
    int minutes = (milliseconds - hours * (1000 * 60 * 60)) ~/ (1000 * 60);
    if (minutes < 10) {
      result = hours.toString() + ":0" + minutes.toString();
    } else {
      result = hours.toString() + ":" + minutes.toString();
    }
    return result;
  }

  static bool getTimeStr(
      String startTime, String endTime, String currentTime, int index) {
    if (startTime == null || startTime.isEmpty) {
      startTime = "00:00.000";
    }
    List<String> result =
        startTime.split(new RegExp(r"\."))[0].split(new RegExp(r"\:"));
    var d2;
    if (endTime != null) {
      List<String> result2 =
          endTime.split(new RegExp(r"\."))[0].split(new RegExp(r"\:"));
      d2 = new DateTime(
          0, 0, 0, 0, int.parse(result2[0]), int.parse(result2[1]));
    }
    List<String> result3 = currentTime.split(new RegExp(r"\:"));
    var d1 =
        new DateTime(0, 0, 0, 0, int.parse(result[0]), int.parse(result[1]));

    var d3 =
        new DateTime(0, 0, 0, 0, int.parse(result3[0]), int.parse(result3[1]));
    return endTime != null
        ? (d3.isAfter(d1) && d3.isBefore(d2))
        : d3.isAtSameMomentAs(d1) || d3.isAfter(d1);
  }

  /// format date by milliseconds.
  /// milliseconds 日期毫秒
  static String formatDateMs(int milliseconds,
      {bool isUtc = false, String format}) {
    return formatDate(getDateTimeByMs(milliseconds, isUtc: isUtc),
        format: format);
  }


  /// format date by date str.
  /// dateStr 日期字符串
  static String formatDateStr(String dateStr, {bool isUtc, String format}) {
    return formatDate(getDateTime(dateStr, isUtc: isUtc), format: format);
  }

  /// get DateTime By DateStr.
  static DateTime getDateTime(String dateStr, {bool isUtc}) {
    DateTime dateTime = DateTime.tryParse(dateStr);
    if (isUtc != null) {
      if (isUtc) {
        dateTime = dateTime.toUtc();
      } else {
        dateTime = dateTime.toLocal();
      }
    }
    return dateTime;
  }

  /// format date by DateTime.
  /// format 转换格式(已提供常用格式 DataFormats，可以自定义格式："yyyy/MM/dd HH:mm:ss")
  /// 格式要求
  /// year -> yyyy/yy   month -> MM/M    day -> dd/d
  /// hour -> HH/H      minute -> mm/m   second -> ss/s
  static String formatDate(DateTime dateTime, {bool isUtc, String format}) {
    if (dateTime == null) return "";
    format = format ?? DataFormats.full;
    if (format.contains("yy")) {
      String year = dateTime.year.toString();
      if (format.contains("yyyy")) {
        format = format.replaceAll("yyyy", year);
      } else {
        format = format.replaceAll(
            "yy", year.substring(year.length - 2, year.length));
      }
    }

    format = _comFormat(dateTime.month, format, 'M', 'MM');
    format = _comFormat(dateTime.day, format, 'd', 'dd');
    format = _comFormat(dateTime.hour, format, 'H', 'HH');
    format = _comFormat(dateTime.minute, format, 'm', 'mm');
    format = _comFormat(dateTime.second, format, 's', 'ss');
    format = _comFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  /// get DateTime By Milliseconds.
  static DateTime getDateTimeByMs(int milliseconds, {bool isUtc = false}) {
    return milliseconds == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
  }

  /// get DateMilliseconds By DateStr.
  static int getDateMsByTimeStr(String dateStr) {
    DateTime dateTime = DateTime.tryParse(dateStr);
    return dateTime == null ? null : dateTime.millisecondsSinceEpoch;
  }

  /// get Now Date Milliseconds.
  static int getNowDateMs() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// get Now Date Str.(yyyy-MM-dd HH:mm:ss)
//  static String getNowDateStr() {
//    return getDateStrByDateTime(DateTime.now());
//  }

  /// com format.
  static String _comFormat(
      int value, String format, String single, String full) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format =
            format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }

  /// get WeekDay By Milliseconds.
  static String getWeekDayByMs(int milliseconds,
      {bool isUtc = false, String languageCode, bool short = false}) {
    DateTime dateTime = getDateTimeByMs(milliseconds, isUtc: isUtc);
    return getWeekDay(dateTime, languageCode: languageCode, short: short);
  }

  /// get WeekDay.
  /// dateTime
  /// isUtc
  /// languageCode zh or en
  /// short
  static String getWeekDay(DateTime dateTime,
      {String languageCode, bool short = false}) {
    if (dateTime == null) return null;
    String weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = languageCode == 'zh' ? '星期一' : "Monday";
        break;
      case 2:
        weekday = languageCode == 'zh' ? '星期二' : "Tuesday";
        break;
      case 3:
        weekday = languageCode == 'zh' ? '星期三' : "Wednesday";
        break;
      case 4:
        weekday = languageCode == 'zh' ? '星期四' : "Thursday";
        break;
      case 5:
        weekday = languageCode == 'zh' ? '星期五' : "Friday";
        break;
      case 6:
        weekday = languageCode == 'zh' ? '星期六' : "Saturday";
        break;
      case 7:
        weekday = languageCode == 'zh' ? '星期日' : "Sunday";
        break;
      default:
        break;
    }
    return languageCode == 'zh'
        ? weekday
        : weekday?.substring(0, short ? 3 : weekday?.length);
  }

  /// Return whether it is leap year.
  static bool isLeapYearByDateTime(DateTime dateTime) {
    return isLeapYearByYear(dateTime.year);
  }

  /// Return whether it is leap year.
  static bool isLeapYearByYear(int year) {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
  }

  /// is yesterday by millis.
  /// 是否是昨天.
  static bool isYesterdayByMillis(int millis, int locMillis) {
    return isYesterday(DateTime.fromMillisecondsSinceEpoch(millis),
        DateTime.fromMillisecondsSinceEpoch(locMillis));
  }

  /// is yesterday by dateTime.
  /// 是否是昨天.
  static bool isYesterday(DateTime dateTime, DateTime locDateTime) {
    if (yearIsEqual(dateTime, locDateTime)) {
      int spDay = getDayOfYear(locDateTime) - getDayOfYear(dateTime);
      return spDay == 1;
    } else {
      return ((locDateTime.year - dateTime.year == 1) &&
          dateTime.month == 12 &&
          locDateTime.month == 1 &&
          dateTime.day == 31 &&
          locDateTime.day == 1);
    }
  }

  /// get day of year.
  /// 在今年的第几天.
  static int getDayOfYearByMillis(int millis, {bool isUtc = false}) {
    return getDayOfYear(
        DateTime.fromMillisecondsSinceEpoch(millis, isUtc: isUtc));
  }

  /// get day of year.
  /// 在今年的第几天.
  static int getDayOfYear(DateTime dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    int days = dateTime.day;
    for (int i = 1; i < month; i++) {
      days = days + MONTH_DAY[i];
    }
    if (isLeapYearByYear(year) && month > 2) {
      days = days + 1;
    }
    return days;
  }

  /// year is equal.
  /// 是否同年.
  static bool yearIsEqualByMillis(int millis, int locMillis) {
    return yearIsEqual(DateTime.fromMillisecondsSinceEpoch(millis),
        DateTime.fromMillisecondsSinceEpoch(locMillis));
  }

  /// year is equal.
  /// 是否同年.
  static bool yearIsEqual(DateTime dateTime, DateTime locDateTime) {
    return dateTime.year == locDateTime.year;
  }

  /// is today.
  /// 是否是当天.
  static bool isToday(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  /// is Week.
  /// 是否是本周.
  static bool isWeek(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds <= 0) {
      return false;
    }
    DateTime _old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime _now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    DateTime old =
        _now.millisecondsSinceEpoch > _old.millisecondsSinceEpoch ? _old : _now;
    DateTime now =
        _now.millisecondsSinceEpoch > _old.millisecondsSinceEpoch ? _now : _old;
    return (now.weekday >= old.weekday) &&
        (now.millisecondsSinceEpoch - old.millisecondsSinceEpoch <=
            7 * 24 * 60 * 60 * 1000);
  }
}
