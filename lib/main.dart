import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'tile.turtorial.dart';
import 'walk.tutorial.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Flame.device.fullScreen();
  // Flame.device.setLandscape();

  runApp(
    GameWidget(

      loadingBuilder: (_) => const Center(
        child: SizedBox(
          width: 200,
          child: LinearProgressIndicator(),
        ),
      ),

      // game: MySpriteTutorial(),
      game: TileTutorialGame(),

    ),
  );
}