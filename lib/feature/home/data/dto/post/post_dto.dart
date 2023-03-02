import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/author_dto.dart';

class PostDto {
  final String id;
  final List<RelatedPersonDto> author;
  final List<RelatedPersonDto> relatedPerson;
  final String message;
  final List<BadgeDto> badges;
  final String created;
  final String praiseRating;

  PostDto({
    required this.id,
    required this.author,
    required this.relatedPerson,
    required this.message,
    required this.badges,
    required this.created,
    required this.praiseRating,
  });

  factory PostDto.fromMap(Map<String, dynamic> map) {
    return PostDto(
      id: map['ID'],
      author: List<RelatedPersonDto>.from(map['Author']?.map((x) => RelatedPersonDto.fromMap(x))),
      relatedPerson: List<RelatedPersonDto>.from(map['RelatedPerson']?.map((x) => RelatedPersonDto.fromMap(x))),
      message: map['Message'],
      badges: List<BadgeDto>.from(map['Badge']?.map((x) => BadgeDto.fromMap(x))),
      created: map['Created'],
      praiseRating: map['PraiseRating'],
    );
  }
}
