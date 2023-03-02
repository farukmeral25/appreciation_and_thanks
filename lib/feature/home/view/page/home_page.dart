import 'package:appreciation_and_thanks/core/constants/app_asset_paths.dart';
import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';
import 'package:appreciation_and_thanks/core/extensions/list_extension.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:appreciation_and_thanks/core/functions/edge_insets_functions.dart';
import 'package:appreciation_and_thanks/core/shared/app_image.dart';
import 'package:appreciation_and_thanks/core/shared/app_scaffold.dart';
import 'package:appreciation_and_thanks/core/shared/app_text.dart';
import 'package:appreciation_and_thanks/core/shared/app_widget_state_builder.dart';
import 'package:appreciation_and_thanks/core/utils/screen_size.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:appreciation_and_thanks/feature/home/view/page/widget/post_card.dart';
import 'package:appreciation_and_thanks/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: REdgeInsets.all(16),
                height: 258.h,
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
                    SizedBox(
                      height: 62.w,
                      child: Consumer<HomeViewModel>(
                        builder: (BuildContext context, HomeViewModel homeViewModel, Widget? child) {
                          return Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const AppImage(
                                    AssetPaths.flagIcon,
                                  ),
                                  AppWidgetByStateBuilder<String>(
                                    response: homeViewModel.avarageScoreOfBadge,
                                    builder: (avarage) {
                                      return AppText.headline1(
                                        avarage,
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
                                    AppWidgetByStateBuilder<List<PostDto>>(
                                      response: homeViewModel.postsState,
                                      builder: (posts) {
                                        return Row(
                                          children: [
                                            Container(
                                              height: 20.h,
                                              width: 100.w,
                                              color: AppColors.blue,
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
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            width: 100,
                            color: index == 1 ? AppColors.dark : AppColors.black,
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    const Text("Slider"),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 17.h),
            Consumer<HomeViewModel>(
              builder: (BuildContext context, HomeViewModel homeViewModel, Widget? child) {
                return AppWidgetByStateBuilder<List<PostDto>>(
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
            ),
          ],
        ),
      ),
    );
  }
}
