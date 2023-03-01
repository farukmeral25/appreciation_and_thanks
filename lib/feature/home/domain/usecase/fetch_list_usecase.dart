import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:appreciation_and_thanks/feature/home/domain/service/i_home_service.dart';
import 'package:dartz/dartz.dart';

class FetchListUsecase implements Usecase<void, NoParams> {
  final IHomeService _homeService;

  FetchListUsecase(this._homeService);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _homeService.fetchListData();
  }
}
