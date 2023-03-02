import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/domain/service/i_home_service.dart';
import 'package:dartz/dartz.dart';

class FetchBadgesUsecase implements Usecase<List<BadgeDto>, NoParams> {
  final IHomeService _homeService;

  FetchBadgesUsecase(this._homeService);

  @override
  Future<Either<Failure, List<BadgeDto>>> call(NoParams params) async {
    return await _homeService.fetchBadges();
  }
}
