// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class GameEntity {
  int id = 0;

  String name;
  int level;
  int coin;

  @Property(type: PropertyType.date)
  DateTime firstGame;

  @Property(type: PropertyType.date)
  DateTime lastGame;

  GameEntity({
    required this.name,
    required this.level,
    required this.firstGame,
    required this.coin,
    required this.lastGame,
  });
}
