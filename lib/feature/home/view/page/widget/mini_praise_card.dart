import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:appreciation_and_thanks/core/shared/app_image.dart';
import 'package:appreciation_and_thanks/core/shared/app_text.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/view/page/widget/rating_bar.dart';
import 'package:flutter/material.dart';

class MiniPraiseCard extends StatelessWidget {
  const MiniPraiseCard({Key? key, required this.badge}) : super(key: key);
  final BadgeDto badge;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          badge.badgeIcon!.assetPath,
          height: 52.w,
          width: 52.w,
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText.bodySmall(
                badge.title,
                overflow: TextOverflow.ellipsis,
              ),
              RatingBarWidget(
                praiseRaiting: badge.averageScore,
                itemSize: 14.w,
              ),
              AppText.labelSmall(
                "${badge.count.getValueOrDefault} Adet",
                color: AppColors.black.withOpacity(.3),
              ),
            ],
          ),
        )
      ],
    );
  }
}
