import 'package:appreciation_and_thanks/core/extensions/list_extension.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:appreciation_and_thanks/core/utils/base_viewmodel.dart';
import 'package:appreciation_and_thanks/core/utils/ui_state.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final Usecase fetchBadgesUsecase;
  final Usecase fetchListUsecase;

  HomeViewModel({required this.fetchBadgesUsecase, required this.fetchListUsecase});

  PageController pageController = PageController();

  UIState<List<BadgeDto>> badgeState = UIState.idle();
  UIState<List<PostDto>> postsState = UIState.idle();
  UIState<String> avarageScoreOfBadge = UIState.idle();

  Future<void> init() async {
    await fetchBadges();
    await fetchListData();
    avarageBadges();
  }

  Future<void> fetchBadges() async {
    badgeState = UIState.loading();
    final fetchBadgesEither = await fetchBadgesUsecase(NoParams());

    fetchBadgesEither.fold((failure) {
      badgeState = UIState.error(failure.message);
    }, (data) {
      badgeState = UIState.success(data);
    });

    notifyListeners();
  }

  Future<void> fetchListData() async {
    postsState = UIState.loading();
    final fetchBadgesEither = await fetchListUsecase(NoParams());

    fetchBadgesEither.fold((failure) {
      postsState = UIState.error(failure.message);
    }, (data) {
      postsState = UIState.success(data);
    });

    notifyListeners();
  }

  void avarageBadges() {
    if (!(postsState.isSuccess && badgeState.isSuccess)) return;

    List<PostDto> posts = postsState.data.getValueOrDefault;
    List<BadgeDto> badges = badgeState.data.getValueOrDefault;

    int totalBadgeRatingScore = 0;

    for (var badge in badges) {
      badge.count = posts.where((post) => post.badges.first.lookupId == badge.id).length;

      posts.where((post) => post.badges.first.lookupId == badge.id).forEach((post) {
        badge.totalScore = badge.totalScore + (post.praiseRating.getValueOrDefault as int);
      });

      totalBadgeRatingScore = totalBadgeRatingScore + badge.totalScore;
    }

    var average = totalBadgeRatingScore / posts.itemCount;

    avarageScoreOfBadge = UIState.success(average.toStringAsFixed(1));
  }
}
