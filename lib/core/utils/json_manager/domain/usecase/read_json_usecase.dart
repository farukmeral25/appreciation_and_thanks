import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/json_manager/domain/service/i_json_manager.dart';
import 'package:appreciation_and_thanks/core/utils/json_manager/entity/app_endpoint.dart';
import 'package:appreciation_and_thanks/core/utils/usecase.dart';
import 'package:dartz/dartz.dart';

class ReadJsonUsecase implements Usecase<dynamic, AppEndpoint> {
  final IJsonManager _jsonManager;

  ReadJsonUsecase(this._jsonManager);

  @override
  Future<Either<Failure, dynamic>> call(AppEndpoint params) async {
    return await _jsonManager.readJson(endpoint: params);
  }
}
