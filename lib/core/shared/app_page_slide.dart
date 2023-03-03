import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:appreciation_and_thanks/core/functions/edge_insets_functions.dart';
import 'package:flutter/material.dart';

class AppPageSlide extends StatelessWidget {
  const AppPageSlide({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: REdgeInsets.symmetric(horizontal: 4),
      height: 8.h,
      width: 8.h,
      decoration: BoxDecoration(
        color: isActive ? AppColors.grey : AppColors.grey.withOpacity(.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
