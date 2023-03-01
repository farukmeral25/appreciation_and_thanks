import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';

enum AppTextStyles {
  headline1,
  headline2,
  headline3,
  headline4,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelMedium,
  labelSmall,
}

extension AppTextStylesExtension on AppTextStyles {
  TextStyle get getTextStyle {
    switch (this) {
      case AppTextStyles.headline1:
        return TextStyle(
          fontSize: 24.sp,
          height: .58,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyles.headline2:
        return TextStyle(
          fontSize: 14.sp,
          height: 1,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyles.headline3:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.16,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );

      case AppTextStyles.headline4:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.16,
          color: AppColors.black,
          fontWeight: FontWeight.w300,
        );
      case AppTextStyles.bodyLarge:
        return TextStyle(
          fontSize: 22.sp,
          height: .63,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyles.bodyMedium:
        return TextStyle(
          fontSize: 14.sp,
          height: 1,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );

      case AppTextStyles.bodySmall:
        return TextStyle(
          fontSize: 13.sp,
          height: 1.1,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );

      case AppTextStyles.labelMedium:
        return TextStyle(
          fontSize: 12.sp,
          height: 1.6,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyles.labelSmall:
        return TextStyle(
          fontSize: 10.sp,
          height: 1.4,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    }
  }
}
