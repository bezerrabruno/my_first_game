import 'package:flutter/material.dart';
import 'package:my_first_game/app/core/app_widget.dart';
import 'package:my_first_game/app/db/box_db/object_box.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initApp();

  runApp(const AppWidget());
}

Future<void> initApp() async {
  appBox = ObjectBox();
}
