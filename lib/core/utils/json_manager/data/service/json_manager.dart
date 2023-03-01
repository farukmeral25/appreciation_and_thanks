import 'dart:convert';

import 'package:appreciation_and_thanks/core/failure/failure.dart';
import 'package:appreciation_and_thanks/core/utils/json_manager/domain/service/i_json_manager.dart';
import 'package:appreciation_and_thanks/core/utils/json_manager/entity/app_endpoint.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;

class JsonManager implements IJsonManager {
  @override
  Future<Either<Failure, dynamic>> readJson({required AppEndpoint endpoint}) async {
    try {
      String response = await rootBundle.loadString(endpoint.value);
      var jsonResult = json.decode(response);
      return Right(jsonResult);
    } catch (_) {
      return Left(NotFoundFailure());
    }
  }
}
