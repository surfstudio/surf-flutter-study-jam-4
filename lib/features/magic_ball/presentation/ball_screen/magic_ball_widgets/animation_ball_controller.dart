import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animationBallController =
    StateProvider.family<AnimationController, dynamic>((ref, vs) {
  final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: vs,
  )..repeat();
  ref.onDispose(() => controller.dispose());
  return controller;
});
