import 'package:flutter/material.dart';

class SizeResponsize {
  static double sizeScreenWidth = 0;
  static double sizeScreenHeigth = 0;

  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  
  static double _safeBlockHorizontal = 0;
  static double _safeBlockVertical = 0;

  SizeResponsize(BuildContext context) {
    var mediaQueryContext = MediaQuery.of(context);

    sizeScreenWidth = mediaQueryContext.size.width;
    sizeScreenHeigth = mediaQueryContext.size.height;

    _blockSizeHorizontal = sizeScreenWidth / 100;
    _blockSizeVertical = sizeScreenHeigth / 100;

    _safeAreaHorizontal = mediaQueryContext.padding.left + mediaQueryContext.padding.right;
    _safeAreaVertical = mediaQueryContext.padding.top + mediaQueryContext.padding.bottom;

    _safeBlockHorizontal = (sizeScreenWidth - _safeAreaHorizontal) / 100;
    _safeBlockVertical = (sizeScreenHeigth - _safeAreaVertical) / 100;
  }

  static double blockSizeHorizontal (double percentage) => _blockSizeHorizontal * percentage;

  static double blockSizeVertical (double percentage) => _blockSizeVertical * percentage;

  static double safeBlockHorizontal (double percentage) => _safeBlockHorizontal * percentage;

  static double safeBlockVertical (double percentage) => _safeBlockVertical * percentage;

  static double textSize (double percentage) => _blockSizeHorizontal * percentage;
}