import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:surf_practice_magic_ball/core/dark_theme_colors.dart';
import 'package:surf_practice_magic_ball/resources/resources.dart';
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
    // final windowPosition = tapPosition == Offset.zero ? restPosition : tapPosition;
    return Stack(
      children: [
        ShadowOfDoubtWidget(diameter: size.shortestSide),
        Magic8BallWidget(
          diameter: size.shortestSide,
          lightSource: lightSource,
          child: Transform(
            origin: size.center(Offset.zero),
            transform: Matrix4.identity()
              ..translate(restPosition.dx * size.width / 2, restPosition.dy * size.height / 2)
              ..scale(1.0),
            child: Center(
              child: WindowOfOpportunityWidget(
                lightSource: lightSource,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppImages.ballStars),
                    Image.asset(AppImages.smallStars),
                    PredictionTextWidget(text: prediction),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
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
    const lightSource = Offset(0, 0.75);
    return Container(
      // decoration: BoxDecoration(
      //   color: DarkThemeColors.textColor,
      //   shape: BoxShape.circle,
      //   gradient: RadialGradient(
      //     colors: const [DarkThemeColors.aroundBallColor, DarkThemeColors.backgroundColor],
      //     center: Alignment(lightSource.dx, lightSource.dy),
      //     radius: 1.0,
      //   ),
      // ),
      child: widget.child,
    );
  }
}

class ShadowOfDoubtWidget extends StatelessWidget {
  const ShadowOfDoubtWidget({
    Key? key,
    required this.diameter,
  }) : super(key: key);

  final double diameter;

  @override
  Widget build(BuildContext context) {
    // final size = Size.square(MediaQuery.of(context).size.shortestSide);
    return Transform(
      origin: Offset(0, diameter),
      transform: Matrix4.identity()..rotateX(math.pi / 1.85),
      child: Center(
        child: Container(
          height: diameter,
          width: 100,
          decoration: BoxDecoration(
            color: DarkThemeColors.aroundBallColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 25,
                color: DarkThemeColors.aroundBallColor.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
