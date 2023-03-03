import 'package:appreciation_and_thanks/core/utils/json_manager/data/service/json_manager.dart';
import 'package:appreciation_and_thanks/core/utils/json_manager/domain/service/i_json_manager.dart';
import 'package:appreciation_and_thanks/core/utils/json_manager/domain/usecase/read_json_usecase.dart';
import 'package:appreciation_and_thanks/feature/home/data/service/home_service.dart';
import 'package:appreciation_and_thanks/feature/home/domain/service/i_home_service.dart';
import 'package:appreciation_and_thanks/feature/home/domain/usecase/fetch_badges_usecase.dart';
import 'package:appreciation_and_thanks/feature/home/domain/usecase/fetch_list_usecase.dart';
import 'package:appreciation_and_thanks/feature/home/viewmodel/home_viewmodel.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //* Core
  //*Json Manager
  serviceLocator.registerLazySingleton<IJsonManager>(() => JsonManager());
  //*Json Manager Usecase
  serviceLocator.registerLazySingleton<ReadJsonUsecase>(() => ReadJsonUsecase(serviceLocator()));
  //*Feature
  //*Home
  //*Home Service
  serviceLocator.registerLazySingleton<IHomeService>(() => HomeService(serviceLocator()));
  //*Home Usecases
  serviceLocator.registerLazySingleton<FetchBadgesUsecase>(() => FetchBadgesUsecase(serviceLocator()));
  serviceLocator.registerLazySingleton<FetchListUsecase>(() => FetchListUsecase(serviceLocator()));
  //*Home Viewmodel
  serviceLocator.registerLazySingleton<HomeViewModel>(
      () => HomeViewModel(fetchBadgesUsecase: serviceLocator<FetchBadgesUsecase>(), fetchListUsecase: serviceLocator<FetchListUsecase>()));
}
