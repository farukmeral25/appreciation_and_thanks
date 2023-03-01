import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class REdgeInsets {
  static EdgeInsets all(double value) {
    return EdgeInsets.all(value.w);
  }

  static EdgeInsets symmetric({double vertical = 0, double horizontal = 0}) {
    return EdgeInsets.symmetric(
      vertical: vertical.h,
      horizontal: horizontal.w,
    );
  }

  static EdgeInsets only({
    double bottom = 0,
    double top = 0,
    double right = 0,
    double left = 0,
  }) {
    return EdgeInsets.only(
      bottom: bottom.h,
      top: top.h,
      right: right.w,
      left: left.w,
    );
  }
}
