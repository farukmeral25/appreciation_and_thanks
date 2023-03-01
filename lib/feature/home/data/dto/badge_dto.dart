import 'dart:convert';

class BadgeDto {
  final String odataId;
  final String odataType;
  final String odataEtag;
  final String odataEditLink;
  final int id;
  final String title;

  BadgeDto({
    required this.id,
    required this.title,
    required this.odataId,
    required this.odataType,
    required this.odataEtag,
    required this.odataEditLink,
  });

  factory BadgeDto.fromMap(Map<String, dynamic> map) {
    return BadgeDto(
      id: map['Id'],
      title: map['Title'],
      odataId: map['odata.id'],
      odataType: map['odata.type'],
      odataEtag: map['odata.etag'],
      odataEditLink: map['odata.editLink'],
    );
  }
}
