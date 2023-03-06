import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:appreciation_and_thanks/feature/home/data/dto/post/post_dto.dart';
import 'package:appreciation_and_thanks/feature/home/domain/service/i_home_service.dart';
import 'package:dartz/dartz.dart';

class FetchPostsUsecase implements Usecase<List<PostDto>, NoParams> {
  final IHomeService _homeService;

  FetchPostsUsecase(this._homeService);

  @override
  Future<Either<Failure, List<PostDto>>> call(NoParams params) async {
    return await _homeService.fetchPosts();
  }
}
