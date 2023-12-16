import 'package:get_it/get_it.dart';
import 'package:side_project/services/game_service/game_service.dart';
import 'package:side_project/services/game_service/game_service_implementation.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<GameService>(() => GameServiceImpl());
}
