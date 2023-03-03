import 'package:appreciation_and_thanks/core/extensions/list_extension.dart';
import 'package:appreciation_and_thanks/core/extensions/num_extensions.dart';
import 'package:appreciation_and_thanks/core/extensions/string_extension.dart';
import 'package:appreciation_and_thanks/core/init/injection_container.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_icon_dto.dart';
import 'package:appreciation_and_thanks/feature/home/viewmodel/home_viewmodel.dart';

class BadgeDto {
  final int? id;
  late String? title;
  late BadgeIconDto? badgeIcon;
  final int? lookupId;
  int? count;
  int totalScore = 0;

  BadgeDto({
    this.id,
    this.title,
    this.badgeIcon,
    this.lookupId,
  });

  factory BadgeDto.fromMap(Map<String, dynamic> map) {
    BadgeDto badge = BadgeDto(
      id: map['Id'],
      title: map['Title'],
      badgeIcon: map['BadgeIcon'] != null ? BadgeIconDto.fromMap(map['BadgeIcon']) : null,
      lookupId: map['lookupId'],
    );

    if (badge.title.getValueOrDefault.isEmpty && badge.lookupId.isNotNull) {
      var badgeList = serviceLocator<HomeViewModel>().badgeState.data.getValueOrDefault;
      BadgeDto tempBadge = badgeList.singleWhere((element) => element.id == badge.lookupId);
      badge.title = tempBadge.title;
      badge.badgeIcon = tempBadge.badgeIcon;
    }

    return badge;
  }

  double get averageScore => totalScore / (count ?? 1);
}
