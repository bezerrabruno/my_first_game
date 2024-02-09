import 'package:flutter/material.dart';
import 'package:my_first_game/app/db/box_db/object_box.dart';
import 'package:my_first_game/app/db/boxes/game_box.dart';
import 'package:my_first_game/app/home/home_controller.dart';
import 'package:my_first_game/app/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game',
      home: HomePage(
        controller: HomeController(
          GameBox(appBox),
        ),
      ),
    );
  }
}
