import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/presentation/ball_screen/magic_ball_widgets/animation_ball_controller.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/presentation/ball_screen/magic_ball_widgets/magic_ball_controller.dart';
import 'package:surf_practice_magic_ball/gen/assets.gen.dart';
import 'package:surf_practice_magic_ball/utils/theme_controller.dart';

/// Widget for show and controll Magic Ball functions
class MagicBall extends ConsumerStatefulWidget {
  const MagicBall({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MagicBallState();
}

// func for animate bounce ball
double shake(double value) => (0.5 - Curves.bounceIn.transform(value)).abs();

class _MagicBallState extends ConsumerState<MagicBall>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // init and get settings for animation controller
    final animateController = ref.watch(animationBallController(this));
    return GestureDetector(
      onTap: () {
        // check for escape many request while loading data
        if (ref.read(timeoutProvider.notifier).state) {
          ref.read(responseBallControllerProvider.notifier).getBallResponse();
        }
      },
      child: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: animateController,
            builder: (context, child) => Transform.translate(
              offset: Offset(0, 100 * shake(animateController.value)),
              child: child,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 98, 190, 221)
                        .withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ref.watch(themeModeProvider) == ThemeMode.light
                      ? Assets.images.ballLight.image(height: 400, width: 400)
                      : Assets.images.ballDark.image(height: 400, width: 400),
                  AnimatedSwitcher(
                    // switcher for fade effect when change state
                    duration: const Duration(milliseconds: 1000),
                    child: ref.watch(responseBallControllerProvider).when(
                          // watch for all states
                          data: (data) => data != null
                              ? Text(data.reading)
                              : stars(errorState: false),
                          error: (error, _) => stars(errorState: true),
                          loading: () =>
                              ref.watch(themeModeProvider) == ThemeMode.light
                                  ? Assets.images.ballLoadingLight.image(
                                      height: 350,
                                      width: 350,
                                    )
                                  : Assets.images.ballLoadingDark.image(
                                      height: 350,
                                      width: 350,
                                    ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // mini helpfull boilerplate widget
  stars({required bool errorState}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (errorState) Assets.images.ballError.image(height: 350, width: 350),
        Assets.images.smallStar.image(height: 400, width: 400),
        Assets.images.bigStars.image(height: 300, width: 300),
      ],
    );
  }
}
