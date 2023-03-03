import 'package:appreciation_and_thanks/core/init/injection_container.dart' as locator;
import 'package:appreciation_and_thanks/feature/home/viewmodel/home_viewmodel.dart';
import 'package:appreciation_and_thanks/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main() {
  Future<void> pumpMyApp(WidgetTester tester) async {
    locator.init();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>(
            create: (context) => locator.serviceLocator(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }

  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    testWidgets('Scrolling test', (tester) async {
      await pumpMyApp(tester);
      final scrollViewFinder = find.byType(SingleChildScrollView);
      final scroller = tester.widget<SingleChildScrollView>(scrollViewFinder).controller;
      await Future.delayed(const Duration(seconds: 1));
      await binding.watchPerformance(
        () async {
          await scroller?.animateTo(
            3000,
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
          );
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await scroller?.animateTo(
            -3000,
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
          );

          await tester.pumpAndSettle();
        },
        reportKey: 'scrolling_summary',
      );
    });
    /*
    testWidgets('Page Scroll testing', (tester) async {
      final pageViewFinder = find.byType(PageView);
      final pageController = tester.widget<PageView>(pageViewFinder).controller;
      //final pageController = locator.serviceLocator<HomeViewModel>().pageController;
      await Future.delayed(const Duration(seconds: 1));
      await binding.watchPerformance(
        () async {
          await pageController.nextPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 1));
          await pageController.previousPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );

          await tester.pumpAndSettle();
        },
        reportKey: 'page_controller_summary',
      );
    });
    */
  });
}
