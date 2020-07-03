import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
class NetView extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    //View绘制
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //是否重绘
    return oldDelegate!=this;
  }

}

class SpiderView extends CustomPainter{
  Paint mPaint;
  // 覆盖物画笔
  Paint mCoverPaint;

  // 文本画笔
  Paint mTextPaint;

  Path mPath;

  // 绘制边数默认为6
  int mEdgeSize = 6;

  final double CIRCLE_ANGLE = 360;

  // 整个绘制区域的中点坐标
  double mCenterX = 0;
  double mCenterY = 0;


  SpiderView(this.mEdgeSize){
    mPaint=Paint();
    mPaint.color=randomRGB();
    mPaint.isAntiAlias=true;
    mPaint.style=PaintingStyle.stroke;
    mPath=Path();

    mCoverPaint=Paint();
    mCoverPaint.isAntiAlias=true;
    mCoverPaint.style=PaintingStyle.fill;
    mCoverPaint.color=randomARGB();

    mTextPaint=Paint();
    mTextPaint.isAntiAlias=true;
    mTextPaint.style=PaintingStyle.fill;
    mTextPaint.color=Colors.blue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    mCenterX = size.width / 2;
    mCenterY = size.height / 2;

    // 图层 防止刷新属性结构
    canvas.save();
    drawSpiderEdge(canvas);
    drawCover(canvas);
    drawText(canvas);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

  /**
   * @return 获取到随机颜色值
   */
  Color randomARGB() {
    Random random = Random();
    return Color.fromARGB(
        125, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  Color randomRGB() {
    Random random = Random();
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  /**
   * 绘制边线
   */
  void drawSpiderEdge(Canvas canvas) {
    double angle = CIRCLE_ANGLE / mEdgeSize;
    double radius = 0;
    double radiusMaxLimit = mCenterX > mCenterY ? mCenterX : mCenterY;
    for (int i = 0; i < mEdgeSize; i++) {
      mPath.reset();
      radius = radiusMaxLimit / mEdgeSize * (i + 1);
      for (int j = 0; j < mEdgeSize + 1; j++) {
        // 移动
        if (j == 0) {
          mPath.moveTo(mCenterX + radius, mCenterY);
        } else {
          double x = mCenterX + radius * cos(degToRad(angle * j));
          double y = mCenterY + radius * sin(degToRad(angle * j));
          mPath.lineTo(x, y);
        }
      }
      mPath.close();
      canvas.drawPath(mPath, mPaint);
    }
    drawSpiderAxis(canvas, radiusMaxLimit, angle);
  }

  /**
   * 绘制轴线
   */
  void drawSpiderAxis(Canvas canvas, double radius, double angle) {
    for (int i = 0; i < mEdgeSize; i++) {
      mPath.reset();
      mPath.moveTo(mCenterX, mCenterX);
      double x = mCenterX + radius * cos(degToRad(angle * i));
      double y = mCenterY + radius * sin(degToRad(angle * i));
      mPath.lineTo(x, y);
      canvas.drawPath(mPath, mPaint);
    }
  }

  num degToRad(num deg) => deg * (pi / 180.0);

  num radToDeg(num rad) => rad * (180.0 / pi);

  /**
   * 绘制覆盖区域
   */
  void drawCover(Canvas canvas) {
    mPath.reset();
    Random random = Random();

    double angle = CIRCLE_ANGLE / mEdgeSize;
    double radiusMaxLimit = min(mCenterY, mCenterY);
    for (int i = 0; i < mEdgeSize; i++) {
      double value = (random.nextInt(10) + 1) / 10;
      double x = mCenterX + radiusMaxLimit * cos(degToRad(angle * i)) * value;
      double y = mCenterY + radiusMaxLimit * sin(degToRad(angle * i)) * value;
      if (i == 0) {
        mPath.moveTo(x, mCenterY);
      } else {
        mPath.lineTo(x, y);
      }
    }
    mPath.close();
    canvas.drawPath(mPath, mCoverPaint);
  }

  /***
   * 绘制文本
   */
  void drawText(Canvas canvas) {

  }
}