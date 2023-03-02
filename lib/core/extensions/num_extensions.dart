import 'package:appreciation_and_thanks/core/utils/screen_size.dart';

extension NumExtension on num {
  double get h => ScreenSize().getHeight(this);

  double get w => ScreenSize().getWidth(this);

  double get sp => ScreenSize().getSp(this);

  double get r => ScreenSize().radius(this);

  bool get isInt => (this % 1) == 0;
}

extension NumNullableExtension on num? {
  bool get isNotNull => this != null;
  num get getValueOrDefault => this ?? 0;
}
