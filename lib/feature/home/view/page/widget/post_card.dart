import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:appreciation_and_thanks/core/functions/edge_insets_functions.dart';
import 'package:appreciation_and_thanks/core/shared/app_image.dart';
import 'package:appreciation_and_thanks/core/shared/app_text.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final PostDto post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 16),
      padding: REdgeInsets.symmetric(horizontal: 16) + REdgeInsets.only(top: 12, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.16),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor: AppColors.blue,
              ),
              SizedBox(width: 11.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.headline3(
                      post.relatedPerson.first.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppText.headline4(
                      "Dün, 13:30’da Gönderdi",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              AppImage(post.badges.first.badgeIcon!.assetPath),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.bodyLarge(
                      post.badges.first.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 20.h,
                      width: 100.w,
                      color: AppColors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 11.h),
          Align(
            alignment: Alignment.centerLeft,
            child: AppText.labelMedium(
              post.message,
              color: AppColors.dark,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
