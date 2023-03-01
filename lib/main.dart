import 'package:appreciation_and_thanks/core/init/injection_container.dart' as locator;
import 'package:appreciation_and_thanks/feature/home/view/page/home_page.dart';
import 'package:appreciation_and_thanks/feature/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  locator.init();

  runApp(
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appreciation And Thanks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Gotham",
      ),
      home: const HomePage(),
    );
  }
}
