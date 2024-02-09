import 'package:flutter/material.dart';
import 'package:my_first_game/app/db/boxes/game_box.dart';
import 'package:my_first_game/app/db/entities/game_entity.dart';

class HomeController extends ChangeNotifier {
  final GameBox gameBox;

  HomeController(this.gameBox);

  /// Vars
  GameEntity? _game;

  /// Uses
  GameEntity? get game => _game;

  /// funcs
  Future<void> initGame() async {
    _game = await gameBox.get();

    updateDate();
  }

  int getLevel() {
    return _game?.level ?? 1;
  }

  void updateDate() {
    _game!.lastGame = DateTime.now();

    gameBox.update(_game);
    notifyListeners();
  }

  void updateName(String name) {
    _game!.name = name;

    gameBox.update(_game);
    notifyListeners();
  }

  void updateLevel() {
    _game!.coin -= getLevel() * 100;
    _game!.level += 1;

    gameBox.update(_game);
    notifyListeners();
  }

  void updateCoin() {
    _game!.coin += 1 * _game!.level;

    gameBox.update(_game);
    notifyListeners();
  }
}
