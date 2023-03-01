import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/json_manager/entity/app_endpoint.dart';
import 'package:dartz/dartz.dart';

abstract class IJsonManager {
  Future<Either<Failure, dynamic>> readJson({required AppEndpoint endpoint});
}
