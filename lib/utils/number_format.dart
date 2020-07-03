import 'dart:math';

class DataUtils{
  //以万,亿为单位,四舍五入
  static String formatNumber(int num,bool isRounding,int position) {
    String result;
    if(isRounding) {
      if (num >= 10000 && num < 100000000) {
        double value = num / 10000;
        result = value.toStringAsFixed(position) + "万";
      } else if (num < 10000) {
        result = num.toString();
      } else if (num > 100000000) {
        double value = num / 100000000;
        result = value.toStringAsFixed(position) + "亿";
      }
    }else{
      if (num >= 10000 && num < 100000000) {
        double value = num / 10000;
        if(position==0){
          result = value.toString().substring(0,value.toString().indexOf(".")) + "万";
        }else{
          result = value.toString().substring(0,value.toString().indexOf(".")+position+1) + "万";
        }
      } else if (num < 10000) {
        result = num.toString();
      } else if (num > 100000000) {
        double value = num / 100000000;
        if(position==0){
          result = value.toString().substring(0,value.toString().indexOf(".")) + "亿";
        }else{
          result = value.toString().substring(0,value.toString().indexOf(".")+position+1) + "亿";
        }
      }
    }
    return result;
  }
}