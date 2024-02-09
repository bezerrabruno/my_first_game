import 'package:flutter/material.dart';
import 'package:my_first_game/app/core/Utils/date_format.dart';
import 'package:my_first_game/app/home/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    controller.initGame();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('Bem Vindo ${controller.game?.name}'),
          ),
          bottomNavigationBar: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: size.width / 4, vertical: 16),
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () => controller.updateCoin(),
                child: const Text('Ganhar Moedas'),
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'primeiro acesso: ${DateFormat.basicFormat(controller.game?.firstGame)}',
                    style: const TextStyle(fontSize: 8, color: Colors.purple),
                  ),
                  Text(
                    'ultimo acesso: ${DateFormat.basicFormat(controller.game?.lastGame)}',
                    style: const TextStyle(fontSize: 8, color: Colors.purple),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Nivel: ${controller.game?.level}',
                        style:
                            const TextStyle(fontSize: 48, color: Colors.purple),
                      ),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.game == null) return;

                            if (controller.game!.coin >=
                                100 * controller.getLevel()) {
                              controller.updateLevel();
                            }
                          },
                          child: Text(
                              'Upar: Custo (${100 * controller.getLevel()})'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Moedas: ${controller.game?.coin}',
                    style: const TextStyle(fontSize: 48, color: Colors.purple),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
