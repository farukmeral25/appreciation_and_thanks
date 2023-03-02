import 'package:appreciation_and_thanks/core/constants/app_constants.dart';

class BadgeIconDto {
  final String assetPath;

  BadgeIconDto({required this.assetPath});

  factory BadgeIconDto.fromMap(Map<String, dynamic> map) {
    return BadgeIconDto(
      assetPath: "${AppConstants.imagesRoute}${map['fileName']}",
    );
  }
}
