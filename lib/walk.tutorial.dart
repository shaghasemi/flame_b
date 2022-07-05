import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';

class MySpriteTutorial extends FlameGame {
  late SpriteAnimationComponent robotRunning;
  late SpriteAnimationComponent robotJumping;
  late SpriteAnimationComponent girlWalking;
  late SpriteComponent background;

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    final spriteSheetRun = await fromJSONAtlas(
      'robot_run.png',
      'robot_run.json',
    );
    final spriteSheetJump = await fromJSONAtlas(
      'robot_jump.png',
      'robot_jump.json',
    );
    final spriteSheetWalk = await fromJSONAtlas(
      'girl_walk.png',
      'girl_walk.json',
    );
    background = SpriteComponent()
      ..sprite = await loadSprite('girl_bg.jpg')
      ..size = size;
    add(background);
    SpriteAnimation run = SpriteAnimation.spriteList(
      spriteSheetRun,
      stepTime: 0.2,
    );
    SpriteAnimation jump = SpriteAnimation.spriteList(
      spriteSheetJump,
      stepTime: 0.25,
    );
    SpriteAnimation walk = SpriteAnimation.spriteList(
      spriteSheetWalk,
      stepTime: 0.05,
    );
    robotRunning = SpriteAnimationComponent()
      ..animation = run
      ..position = Vector2(100, 100)
      ..size = Vector2(200, 200);
    // add(robotRunning);

    robotJumping = SpriteAnimationComponent()
      ..animation = jump
      ..position = Vector2(200, 200)
      ..size = Vector2(150, 150);
    // add(robotJumping);

    girlWalking = SpriteAnimationComponent()
      ..animation = walk
      ..position = Vector2(40, size[1] - 170)
      ..size = Vector2(100, 100);
    add(girlWalking);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // girlWalking.y += dt * 10;
    girlWalking.x += dt * 20;
  }
}
