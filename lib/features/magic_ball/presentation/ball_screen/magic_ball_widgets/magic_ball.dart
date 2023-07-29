import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/presentation/ball_screen/magic_ball_widgets/magic_ball_controller.dart';
import 'package:surf_practice_magic_ball/gen/assets.gen.dart';
import 'package:surf_practice_magic_ball/utils/theme_controller.dart';

const floatingAnimationDuration = Duration(milliseconds: 1000);
const shakingAnimationDuration = Duration(milliseconds: 100);
const floatingTweenEnd = Offset(0, .05);
const shakingTweenEnd = Offset(.03, 0);

/// Widget for show and controll Magic Ball functions
class MagicBallAnimate extends HookConsumerWidget {
  const MagicBallAnimate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: floatingAnimationDuration,
    )..repeat(reverse: true);
    final tween = Tween<Offset>(
      begin: Offset.zero,
      end: floatingTweenEnd,
    );
    final animate = tween.animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    ref.listen(responseBallControllerProvider, (_, state) {
      final model = ref.watch(responseBallControllerProvider);
      if (model is AsyncLoading) {
        controller.duration = shakingAnimationDuration;
        tween.end = shakingTweenEnd;
      } else {
        controller.duration = floatingAnimationDuration;
        tween.end = floatingTweenEnd;
      }

      controller.repeat(reverse: true);
    });

    return GestureDetector(
      onTap: () {
        // check for escape many request while loading data
        if (ref.read(timeoutProvider.notifier).state) {
          ref.read(responseBallControllerProvider.notifier).getBallResponse();
        }
      },
      child: Column(
        children: <Widget>[
          SlideTransition(
            position: animate,
            child: const MagicBall(),
          )
        ],
      ),
    );
  }
}

class MagicBall extends ConsumerWidget {
  const MagicBall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightThemeMode = ref.watch(themeModeProvider) == ThemeMode.light;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 98, 190, 221).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 30,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          lightThemeMode
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
                  loading: () => lightThemeMode
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
