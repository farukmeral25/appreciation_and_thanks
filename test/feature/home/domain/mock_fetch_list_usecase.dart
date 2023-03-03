import 'package:appreciation_and_thanks/core/constants/app_asset_paths.dart';
import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_icon_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/author_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

final List<PostDto> postList = [
  PostDto(
    id: "1",
    author: [RelatedPersonDto(id: "1", title: "Canberk ")],
    relatedPerson: [RelatedPersonDto(id: "1", title: "Hasan")],
    message: "Message",
    badges: [
      BadgeDto(id: 1, lookupId: 1, title: "Lider", badgeIcon: BadgeIconDto(assetPath: AssetPaths.liderIcon)),
    ],
    created: DateTime.now(),
    praiseRating: 4,
  ),
];

class MockFetchListUsecase extends Mock implements Usecase<List<PostDto>, NoParams> {
  @override
  Future<Either<Failure, List<PostDto>>> call(NoParams params) async {
    return Right(postList);
  }
}
