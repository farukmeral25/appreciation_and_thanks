import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({Key? key, required this.praiseRaiting, this.itemSize}) : super(key: key);
  final double praiseRaiting;
  final double? itemSize;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: praiseRaiting,
      itemCount: 5,
      itemSize: itemSize ?? 20.w,
      physics: const BouncingScrollPhysics(),
      unratedColor: AppColors.dark.withOpacity(.2),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.amber,
      ),
    );
  }
}
