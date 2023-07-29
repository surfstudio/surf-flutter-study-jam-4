import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/presentation/ball_screen/magic_ball_widgets/magic_ball.dart';
import 'package:surf_practice_magic_ball/utils/theme_controller.dart';

/// Widget for show page with MagicBall
class MagicBallScreen extends ConsumerWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const ChangeThemeIcon(),
        backgroundColor: Colors.transparent,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MagicBallAnimate(),
              SizedBox(height: 50),
              Text(
                'Нажмите на шар \n или потрясите телефон',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Button widget for change color scheme
class ChangeThemeIcon extends ConsumerWidget {
  const ChangeThemeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeProvider);
    return IconButton(
      onPressed: () {
        ref.read(themeModeProvider.notifier).state =
            theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      },
      icon: Icon(
        theme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
      ),
    );
  }
}
