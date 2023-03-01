import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static LinearGradient blueGradient({AlignmentGeometry begin = Alignment.topCenter, AlignmentGeometry end = Alignment.bottomCenter}) {
    return LinearGradient(
      colors: const [
        AppColors.blue,
        AppColors.darkBlue,
      ],
      begin: begin,
      end: end,
    );
  }
}
