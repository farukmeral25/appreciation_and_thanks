import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.assetPath, {
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final String assetPath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double imageHeight = height ?? 64.w;
    double imageWidth = width ?? 64.w;
    if (assetPath.endsWith(".svg")) {
      return SvgPicture.asset(
        assetPath,
        height: imageHeight,
        width: imageWidth,
      );
    } else {
      return Image.asset(
        assetPath,
        height: imageHeight,
        width: imageWidth,
      );
    }
  }
}
