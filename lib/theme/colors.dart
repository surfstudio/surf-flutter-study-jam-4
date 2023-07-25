import 'package:flutter/painting.dart';

abstract final class AppColors {
  static const gradientDark = LinearGradient(
      colors: [Color(0x100C2CFF), Color(0x000002FF)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 1]);
}
