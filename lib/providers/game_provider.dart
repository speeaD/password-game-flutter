import 'package:flutter/material.dart';
import 'package:side_project/services/game_service/game_service.dart';
import 'package:side_project/services/service_locator.dart';

class GameProvider extends ChangeNotifier {
  final GameService _gameService = serviceLocator<GameService>();

  bool _rule1 = false;

  bool get rule1 => _rule1;

  void setRule1(String text) {
    _gameService.rule1(text).then((value) {
      _rule1 = value;
      notifyListeners();
    });
  }
}
