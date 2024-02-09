import 'package:my_first_game/app/db/box_db/object_box.dart';
import 'package:my_first_game/app/db/entities/game_entity.dart';

class GameBox {
  late final ObjectBox _objectBox;

  GameBox(this._objectBox);

  Future<GameEntity> get() async {
    final store = await _objectBox.getStore();
    final box = store.box<GameEntity>();

    final game = box.getAll();

    if (game.isEmpty) {
      final GameEntity game = GameEntity(
        name: 'Jogador',
        level: 1,
        firstGame: DateTime.now(),
        lastGame: DateTime.now(),
        coin: 0,
      );

      box.put(game);

      return game;
    }

    return game.first;
  }

  Future<void> update(entity) async {
    entity as GameEntity;

    final store = await _objectBox.getStore();
    final box = store.box<GameEntity>();

    box.put(entity);
  }
}
