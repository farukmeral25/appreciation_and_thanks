import 'package:appreciation_and_thanks/core/utils/ui_state.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/domain/usecase/fetch_badges_usecase.dart';
import 'package:appreciation_and_thanks/feature/home/domain/usecase/fetch_list_usecase.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final FetchBadgesUsecase fetchBadgesUsecase;
  final FetchListUsecase fetchListUsecase;

  HomeViewModel({required this.fetchBadgesUsecase, required this.fetchListUsecase});

  PageController pageController = PageController();

  UIState<List<BadgeDto>> badgeState = UIState.idle();
  UIState<int> listState = UIState.idle();

  Future<void> fetchBadges() async {
    badgeState = UIState.loading();
    notifyListeners();
    final fetchBadgesEither = await fetchBadgesUsecase(NoParams());

    fetchBadgesEither.fold((failure) {
      badgeState = UIState.error(failure.message);
    }, (data) {
      badgeState = UIState.success(data);
    });
    notifyListeners();
  }

  Future<void> fetchListData() async {
    listState = UIState.loading();
    final fetchBadgesEither = await fetchListUsecase(NoParams());

    fetchBadgesEither.fold((failure) {
      listState = UIState.error(failure.message);
    }, (data) {
      listState = UIState.success(1);
    });
  }
}
