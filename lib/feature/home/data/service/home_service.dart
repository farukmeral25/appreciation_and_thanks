import 'package:appreciation_and_thanks/core/utils/json_manager/entity/app_endpoint.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:dartz/dartz.dart';

import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/json_manager/domain/usecase/read_json_usecase.dart';
import 'package:appreciation_and_thanks/feature/home/domain/service/i_home_service.dart';

class HomeService implements IHomeService {
  final ReadJsonUsecase _readJsonUsecase;

  HomeService(this._readJsonUsecase);

  @override
  Future<Either<Failure, List<BadgeDto>>> fetchBadges() async {
    try {
      final badgesEither = await _readJsonUsecase(AppEndpoint.badge);
      return badgesEither.fold(
        (failure) => Left(failure),
        (data) {
          List<BadgeDto> result = (data["value"] as List).map((e) => BadgeDto.fromMap(e)).toList();

          return Right(result);
        },
      );
    } catch (_) {
      return Left(ServiceFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostDto>>> fetchPosts() async {
    try {
      final listEither = await _readJsonUsecase(AppEndpoint.list);
      return listEither.fold(
        (failure) => Left(failure),
        (data) {
          List<PostDto> result = (data["Row"] as List).map((e) => PostDto.fromMap(e)).toList();

          return Right(result);
        },
      );
    } catch (_) {
      return Left(ServiceFailure());
    }
  }
}
