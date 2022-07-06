import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class TileTutorialGame extends FlameGame {
  late SpriteComponent girl;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    final homeMap = await TiledComponent.load(
      'practice_aa.tmx',
      Vector2.all(32),
    );

    girl = SpriteComponent()
      ..sprite = await loadSprite('girl.png')
      ..position = size / 2
      ..size = Vector2(91, 124);

    add(homeMap);
    add(girl);

    var map = homeMap.tileMap.map;
    double width = map.width.toDouble() * map.tileWidth;
    double height = map.height.toDouble() * map.tileWidth;

    camera.followComponent(
      girl,
      worldBounds: Rect.fromLTRB(0, 0, width, height),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    girl.position += Vector2.all(30 * dt);
  }
}
