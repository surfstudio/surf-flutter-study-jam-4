import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/core/dark_theme_colors.dart';

class RulesForBallWidget extends StatelessWidget {
  const RulesForBallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Drag the Magic 8-Ball around\n'
      'while concentrating on\n'
      'the question you most\n'
      'want answered.\n\n'
      'Let go, and the oracle will\n'
      'give you an answer - of sorts!',
      style: TextStyle(color: DarkThemeColors.textColor),
    );
  }
}
