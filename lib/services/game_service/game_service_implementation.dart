import 'package:side_project/services/game_service/game_service.dart';

class GameServiceImpl implements GameService {
  @override
  Future<bool> rule1(String text) {
    if (text.length < 5) {
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
