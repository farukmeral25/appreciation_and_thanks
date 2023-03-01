import 'dart:math';

import 'package:appreciation_and_thanks/core/constants/app_constants.dart';
import 'package:appreciation_and_thanks/core/keys/global_key.dart';
import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();
  ScreenSize._init();

  factory ScreenSize() {
    return _instance;
  }

  late Size screenSize;

  double getHeight(num heightNum) {
    double height = (screenSize.height * heightNum) / AppConstants.designDeviceSize.height;
    return height;
  }

  double getWidth(num widthNum) {
    double width = (screenSize.width * widthNum) / AppConstants.designDeviceSize.width;
    return width;
  }

  double getSp(num fontSize) => fontSize * _scaleText;

  double radius(num r) {
    return r * min((screenSize.width / AppConstants.designDeviceSize.width), (screenSize.height / AppConstants.designDeviceSize.height));
  }

  double get sizeRatio => screenSize.aspectRatio / AppConstants.designDeviceSize.aspectRatio;

  double get viewInsetsBottom => MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!).viewInsets.bottom;
  double get viewPaddingBottom => MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!).viewPadding.bottom;
  double get viewPaddingTop => MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!).viewPadding.top;

  double get _scaleText => min(_scaleWidth, _scaleHeight);

  double get _scaleWidth => screenSize.width / AppConstants.designDeviceSize.width;

  double get _scaleHeight => screenSize.height / AppConstants.designDeviceSize.height;

  double get viewBody => screenSize.height - viewPaddingBottom - viewPaddingTop - AppBar().preferredSize.height;
}
