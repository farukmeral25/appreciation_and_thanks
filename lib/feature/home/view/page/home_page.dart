import 'package:appreciation_and_thanks/core/constants/app_asset_paths.dart';
import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';
import 'package:appreciation_and_thanks/core/extensions/list_extension.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:appreciation_and_thanks/core/functions/edge_insets_functions.dart';
import 'package:appreciation_and_thanks/core/init/injection_container.dart';
import 'package:appreciation_and_thanks/core/shared/app_image.dart';
import 'package:appreciation_and_thanks/core/shared/app_page_slide.dart';
import 'package:appreciation_and_thanks/core/shared/app_scaffold.dart';
import 'package:appreciation_and_thanks/core/shared/app_text.dart';
import 'package:appreciation_and_thanks/core/shared/app_widget_state_builder.dart';
import 'package:appreciation_and_thanks/core/utils/screen_size.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:appreciation_and_thanks/feature/home/view/page/widget/mini_praise_card.dart';
import 'package:appreciation_and_thanks/feature/home/view/page/widget/post_card.dart';
import 'package:appreciation_and_thanks/feature/home/view/page/widget/rating_bar.dart';
import 'package:appreciation_and_thanks/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    serviceLocator<HomeViewModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size;
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 4,
        bottomOpacity: .08,
        title: AppText.headline2(
          "TAKDIR & TEŞEKKÜR",
          color: AppColors.dark,
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: REdgeInsets.all(16),
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
                child: Consumer<HomeViewModel>(
                  builder: (BuildContext context, HomeViewModel homeViewModel, Widget? child) {
                    return Column(
                      children: [
                        _buildGeneralPraiseRating(homeViewModel),
                        SizedBox(height: 26.h),
                        _buildPersonBadgeInformation(homeViewModel),
                        SizedBox(height: 30.h),
                        _buildPageSlide(homeViewModel),
                        SizedBox(height: 16.h),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 17.h),
            _buildAuthorComments(),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralPraiseRating(HomeViewModel homeViewModel) {
    return SizedBox(
      height: 62.w,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const AppImage(
                AssetPaths.flagIcon,
              ),
              AppWidgetBuilderByState<String>(
                response: homeViewModel.avarageScoreOfBadge,
                builder: (average) {
                  return AppText.headline1(
                    average,
                    color: AppColors.white,
                  );
                },
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText.bodyMedium(
                  "Tüm Rozetlerde",
                  color: AppColors.dark,
                  overflow: TextOverflow.ellipsis,
                ),
                AppWidgetBuilderByState<List<PostDto>>(
                  response: homeViewModel.postsState,
                  builder: (posts) {
                    return Row(
                      children: [
                        AppWidgetBuilderByState<String>(
                          response: homeViewModel.avarageScoreOfBadge,
                          builder: (average) {
                            double praiseRaiting = double.tryParse(average) ?? 0;
                            return RatingBarWidget(praiseRaiting: praiseRaiting);
                          },
                        ),
                        SizedBox(width: 2.5.w),
                        Expanded(
                          child: AppText.labelSmall(
                            "${posts.itemCount} Adet",
                            color: AppColors.black.withOpacity(.3),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonBadgeInformation(HomeViewModel homeViewModel) {
    return SizedBox(
      height: 116.h,
      child: AppWidgetBuilderByState<List<BadgeDto>>(
        response: homeViewModel.badgeState,
        builder: (badges) {
          return PageView.builder(
            controller: homeViewModel.pageController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var end = (4 * (index + 1)) > (badges.itemCount) ? (badges.itemCount) : (4 * (index + 1));
              List<BadgeDto> list = badges.sublist(4 * index, end);

              return GridView.builder(
                padding: REdgeInsets.symmetric(horizontal: 14),
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 2.w,
                  maxCrossAxisExtent: 52.w,
                  mainAxisExtent: 160.w,
                ),
                itemBuilder: (context, index) => MiniPraiseCard(
                  badge: badges[index],
                ),
                itemCount: list.itemCount,
              );
            },
            onPageChanged: (_) {
              homeViewModel.refreshView();
            },
            itemCount: (badges.itemCount / 4).ceil(),
          );
        },
      ),
    );
  }

  Widget _buildPageSlide(HomeViewModel homeViewModel) {
    return AppWidgetBuilderByState<List<BadgeDto>>(
      response: homeViewModel.badgeState,
      builder: (badges) {
        return SizedBox(
          height: 12.h,
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AppPageSlide(isActive: homeViewModel.pageController.page.getValueOrDefault.round() == index);
              },
              itemCount: (badges.itemCount / 4).ceil(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAuthorComments() {
    return Consumer<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel homeViewModel, Widget? child) {
        return AppWidgetBuilderByState<List<PostDto>>(
          response: homeViewModel.postsState,
          builder: (posts) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => PostCard(post: posts[index]),
              itemCount: posts.itemCount,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 12.h,
                );
              },
            );
          },
        );
      },
    );
  }
}
