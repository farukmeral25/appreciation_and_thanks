import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_icon_dto.dart';

class BadgeDto {
  final int id;
  final String title;
  final BadgeIconDto badgeIcon;
  final String odataId;
  final String odataType;
  final String odataEditLink;

  BadgeDto({
    required this.id,
    required this.title,
    required this.badgeIcon,
    required this.odataId,
    required this.odataType,
    required this.odataEditLink,
  });

  factory BadgeDto.fromMap(Map<String, dynamic> map) {
    return BadgeDto(
      id: map['Id'],
      title: map['Title'],
      badgeIcon: BadgeIconDto.fromMap(map['BadgeIcon']),
      odataId: map['odata.id'],
      odataType: map['odata.type'],
      odataEditLink: map['odata.editLink'],
    );
  }
}
