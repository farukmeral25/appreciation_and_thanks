import 'package:appreciation_and_thanks/core/constants/theme/app_colors.dart';
import 'package:appreciation_and_thanks/core/constants/theme/app_gradients.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:appreciation_and_thanks/core/functions/edge_insets_functions.dart';
import 'package:appreciation_and_thanks/core/init/injection_container.dart';
import 'package:appreciation_and_thanks/core/shared/app_scaffold.dart';
import 'package:appreciation_and_thanks/core/shared/app_text.dart';
import 'package:appreciation_and_thanks/core/utils/screen_size.dart';
import 'package:appreciation_and_thanks/feature/home/view/page/widget/post_card.dart';
import 'package:appreciation_and_thanks/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

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
            ElevatedButton(onPressed: serviceLocator<HomeViewModel>().fetchBadges, child: AppText.bodyMedium("Fetch Badge")),
            ElevatedButton(onPressed: serviceLocator<HomeViewModel>().fetchListData, child: AppText.bodyMedium("Fetch List")),
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
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 49.w,
                            decoration: BoxDecoration(
                              gradient: AppGradients.blueGradient(),
                            ),
                            child: AppText.headline1(
                              "4,5",
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText.bodyMedium(
                                "Tüm Rozetlerde",
                                color: AppColors.dark,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 100.w,
                                    color: AppColors.blue,
                                  ),
                                  SizedBox(width: 2.5.w),
                                  AppText.labelSmall(
                                    "32 Adet",
                                    color: AppColors.black.withOpacity(.3),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
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
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => const PostCard(),
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 12.h,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
