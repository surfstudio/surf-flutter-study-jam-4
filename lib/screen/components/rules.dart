import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/core/dark_theme_colors.dart';

class RulesForBallWidget extends StatelessWidget {
  const RulesForBallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Нажмите на шар\n'
      'или потрясите телефон\n',
      style: TextStyle(color: DarkThemeColors.textColor),
      textAlign: TextAlign.center,
    );
  }
}
