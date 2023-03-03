import 'package:appreciation_and_thanks/core/constants/app_asset_paths.dart';
import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_icon_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

final List<BadgeDto> badgeList = [
  BadgeDto(id: 1, lookupId: 1, title: "Lider", badgeIcon: BadgeIconDto(assetPath: AssetPaths.liderIcon)),
  BadgeDto(id: 2, lookupId: 2, title: "Değer Katan", badgeIcon: BadgeIconDto(assetPath: AssetPaths.degerKatanIcon)),
  BadgeDto(id: 3, lookupId: 3, title: "Gelişime Açık", badgeIcon: BadgeIconDto(assetPath: AssetPaths.gelisimeAcikIcon)),
];

class MockFetchBadgesUsecase extends Mock implements Usecase<List<BadgeDto>, NoParams> {
  @override
  Future<Either<Failure, List<BadgeDto>>> call(NoParams params) async {
    return Right(badgeList);
  }
}
