import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:surf_practice_magic_ball/core/dark_theme_colors.dart';
import 'dart:math' as math;

import 'package:surf_practice_magic_ball/screen/components/WindowsOfOpportunityWidget.dart';
import 'package:surf_practice_magic_ball/screen/components/prediction_text_widget.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  static const lightSource = Offset(0, 0.75);
  static const restPosition = Offset(0, -0.15);
  String prediction = 'The MAGIC\n8-Ball';
  Offset tapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // print('ready in 3...');
    // await Future.delayed(const Duration(seconds: 1));
    // print('ready in 2...');
    // await Future.delayed(const Duration(seconds: 1));
    // print('ready in 1...');
    // await Future.delayed(const Duration(seconds: 1));
    // print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final windowPosition = tapPosition == Offset.zero ? restPosition : tapPosition;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            ShadowOfDoubtWidget(diameter: size.shortestSide),
            GestureDetector(
              onPanUpdate: (details) => _update(details.localPosition, size),
              child: Magic8BallWidget(
                diameter: size.shortestSide,
                lightSource: lightSource,
                child: Transform(
                  origin: size.center(Offset.zero),
                  transform: Matrix4.identity()
                    ..translate(windowPosition.dx * size.width / 2, windowPosition.dy * size.height / 2)
                    ..scale(1.0),
                  child: Center(
                    child: WindowOfOpportunityWidget(
                      lightSource: lightSource,
                      child: Center(child: PredictionTextWidget(text: prediction)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _update(Offset position, Size size) {
    Offset tapPosition = Offset((2 * position.dx / size.width) - 1, (2 * position.dy / size.height) - 1);
    setState(() => this.tapPosition = tapPosition);
  }
}

class Magic8BallWidget extends StatefulWidget {
  const Magic8BallWidget({
    Key? key,
    required this.diameter,
    required this.lightSource,
    required this.child,
  }) : super(key: key);

  final double diameter;
  final Offset lightSource;
  final Widget child;

  @override
  State<Magic8BallWidget> createState() => _Magic8BallWidgetState();
}

class _Magic8BallWidgetState extends State<Magic8BallWidget> {
  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    const lightSource = Offset(0, -0.75);
    return Container(
      decoration: BoxDecoration(
        color: DarkThemeColors.textColor,
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: const [DarkThemeColors.aroundBallColor, DarkThemeColors.backgroundColor],
          center: Alignment(lightSource.dx + 1, lightSource.dy),
          radius: 0.7,
        ),
      ),
      child: widget.child,
    );
  }
}

class ShadowOfDoubtWidget extends StatefulWidget {
  const ShadowOfDoubtWidget({
    Key? key,
    required this.diameter,
  }) : super(key: key);

  final double diameter;

  @override
  State<ShadowOfDoubtWidget> createState() => _ShadowOfDoubtWidgetState();
}

class _ShadowOfDoubtWidgetState extends State<ShadowOfDoubtWidget> {
  @override
  Widget build(BuildContext context) {
    // final size = Size.square(MediaQuery.of(context).size.shortestSide);
    return Transform(
      transform: Matrix4.identity()..rotateX(math.pi / 2.1),
      origin: const Offset(100, 1000),
      child: Container(
        decoration: BoxDecoration(
          // color: DarkThemeColors.textColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: DarkThemeColors.aroundBallColor.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
