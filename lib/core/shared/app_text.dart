import 'package:appreciation_and_thanks/core/constants/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText._(
    this.text, {
    Key? key,
    this.color,
    this.textAlign,
    this.fontSize,
    this.height,
    this.maxLines,
    this.overflow,
    required AppTextStyles appTextStyles,
  }) : super(key: key) {
    _appTextStyles = appTextStyles;
  }

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? fontSize;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  late final AppTextStyles _appTextStyles;

  factory AppText.headline1(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.headline1,
    );
  }

  factory AppText.headline2(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.headline2,
    );
  }

  factory AppText.headline3(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.headline3,
    );
  }

  factory AppText.headline4(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.headline4,
    );
  }

  factory AppText.bodyLarge(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.bodyLarge,
    );
  }

  factory AppText.bodyMedium(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.bodyMedium,
    );
  }

  factory AppText.bodySmall(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.bodySmall,
    );
  }

  factory AppText.labelMedium(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.labelMedium,
    );
  }

  factory AppText.labelSmall(text, {Color? color, TextAlign? textAlign, int? maxLines, TextOverflow? overflow, double? fontSize, double? height}) {
    return AppText._(
      text,
      color: color,
      textAlign: textAlign,
      fontSize: fontSize,
      height: height,
      maxLines: maxLines,
      overflow: overflow,
      appTextStyles: AppTextStyles.labelSmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _appTextStyles.getTextStyle.copyWith(color: color, fontSize: fontSize),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
