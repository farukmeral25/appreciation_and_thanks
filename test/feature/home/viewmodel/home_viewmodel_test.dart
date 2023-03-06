import 'package:appreciation_and_thanks/core/utils/ui_state.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:appreciation_and_thanks/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../domain/mock_fetch_badges_usecase.dart';
import '../domain/mock_fetch_list_usecase.dart';

void main() {
  late HomeViewModel homeViewModel;
  late Usecase<List<BadgeDto>, NoParams> mockFetchBadgesUsecase;
  late Usecase<List<PostDto>, NoParams> mockFetchListUsecase;

  setUp(() {
    mockFetchBadgesUsecase = MockFetchBadgesUsecase();
    mockFetchListUsecase = MockFetchListUsecase();
    homeViewModel = HomeViewModel(
      fetchBadgesUsecase: mockFetchBadgesUsecase,
      fetchListUsecase: mockFetchListUsecase,
      isTest: true,
    );
  });

  test(
    "Initial values are correct",
    () {
      expect(homeViewModel.badgeState.status, UIStateStatus.idle);
      expect(homeViewModel.postsState.status, UIStateStatus.idle);
    },
  );

  test(
    "fetch badges using the HomeViewModel.fetchBadges method",
    () async {
      expect(homeViewModel.badgeState.status, UIStateStatus.idle);
      var future = homeViewModel.fetchBadges();
      expect(homeViewModel.badgeState.status, UIStateStatus.loading);
      await future;
      expect(homeViewModel.badgeState.status, UIStateStatus.success);
    },
  );

  test(
    "fetch badges using the mockFetchBadgeUsecase",
    () async {
      homeViewModel.badgeState = UIState.idle();
      var future = mockFetchBadgesUsecase.call(NoParams());
      homeViewModel.badgeState = UIState.loading();
      var either = await future;
      either.fold((failure) {
        homeViewModel.badgeState = UIState.error(failure.message);
        expect(homeViewModel.badgeState.isError, true);
      }, (data) {
        homeViewModel.badgeState = UIState.success(data);
        expect(homeViewModel.badgeState.data, badgeList);
      });
    },
  );

  test(
    "fetch ListData using the HomeViewModel.fetchListData method",
    () async {
      expect(homeViewModel.postsState.status, UIStateStatus.idle);
      var future = homeViewModel.fetchPosts();
      expect(homeViewModel.postsState.status, UIStateStatus.loading);
      await future;
      expect(homeViewModel.postsState.status, UIStateStatus.success);
    },
  );

  test(
    "fetch Posts using the mockFetchListUsecase",
    () async {
      homeViewModel.postsState = UIState.idle();
      var future = mockFetchListUsecase.call(NoParams());
      homeViewModel.postsState = UIState.loading();
      var either = await future;
      either.fold((failure) {
        homeViewModel.postsState = UIState.error(failure.message);
        expect(homeViewModel.postsState.isError, true);
      }, (data) {
        homeViewModel.postsState = UIState.success(data);
        expect(homeViewModel.postsState.data, postList);
      });
    },
  );
}

/*



// Test Code
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFetchBadgesUsecase extends Mock {
  Future<Either<Failure, List<Badge>>> call(NoParams params) async {
    return Right([]); // or Left(Failure('error message')); 
  }
}

void main() {

  group('fetchBadges', () {

    test('should set the state to loading', () async {

      // arrange 
      final fetchBadgesUsecase = MockFetchBadgesUsecase();

      // act 
      await fetchBadges(fetchBadgesUsecase);

      // assert 
      expect(badgeState, UIState.loading());

    });

    test('should set the state to success when data is returned', () async {

      // arrange 
      final fetchBadgesUsecase = MockFetchBadgesUsecase();

      // act 
      await fetchBadges(fetchBadgesUsecase);

      // assert 
      expect(badgeState, UIState.success([]));

    });

    test('should set the state to error when an error is returned', () async {

        // arrange 
        final fetchBadgesUsecase = MockFetchBadgesUsecase();   when(fetchBadgesUsecase.call(any)).thenAnswer((_) => Future.value(Left(Failure('error message'))));  

        // act   await fetchBadges(fetchBadgesUsecase);  

        // assert   expect(badgeState, UIState.error('error message'));     }); });
*/