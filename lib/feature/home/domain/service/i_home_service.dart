import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/badge/badge_dto.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeService {
  Future<Either<Failure, List<BadgeDto>>> fetchBadges();
  Future<Either<Failure, List<PostDto>>> fetchPosts();
}
