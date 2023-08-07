import 'package:flutter/material.dart';
import 'dart:math' as math;

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
    final innerShadowWidth = lightSource.distance * 0.1;
    final portalShadowOffset =
    Offset.fromDirection(math.pi + lightSource.direction, innerShadowWidth);
    return Container(
      height: size.shortestSide - 50.0,
      width: size.shortestSide - 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment(portalShadowOffset.dx, portalShadowOffset.dy),
          colors: const [Color(0x661F1F1F), Colors.black],
          stops: [1 - innerShadowWidth, 1],
        ),
      ),
      child: child,
    );
  }
}
