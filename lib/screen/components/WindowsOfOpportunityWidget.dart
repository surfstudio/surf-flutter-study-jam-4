import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:surf_practice_magic_ball/core/dark_theme_colors.dart';

class WindowOfOpportunityWidget extends StatelessWidget {
  const WindowOfOpportunityWidget({
    super.key,
    required this.lightSource,
    required this.child,
  });

  final Offset lightSource;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final innerShadowWidth = lightSource.distance * 0.05;
    // final outerShadowWidth = lightSource.distance / 4;
    final portalShadowOffset = Offset.fromDirection(math.pi / 2 - lightSource.direction, innerShadowWidth);
    return Container(
      height: size.shortestSide - 45.0,
      width: size.shortestSide - 45.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment(portalShadowOffset.dx, portalShadowOffset.dy),
          colors: const [Color(0x661F1F1F), DarkThemeColors.aroundBallColor],
          stops: [1 - innerShadowWidth, 1],
        ),
      ),
      child: child,
    );
  }
}
