import 'package:flutter/material.dart';

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
    final innerShadowWidth = lightSource.distance * 0.1;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: const [Color(0x661F1F1F), Colors.black],
          stops: [1 - innerShadowWidth, 1],
        ),
      ),
      child: child,
    );
  }
}
