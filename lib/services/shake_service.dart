import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/presentation/ball_screen/magic_ball_widgets/magic_ball_controller.dart';

final shakeServiceProvider = Provider<ShakeService>((ref) => ShakeService(ref));

/// usefull class for init something before runApp
class ShakeService {
  ShakeService(this.ref) {
    _init();
  }

  ShakeDetector? detector;

  final Ref ref;

  Future<void> _init() async {
    // create listener shake device
    detector = ShakeDetector.waitForStart(onPhoneShake: () async {
      if (ref.read(timeoutProvider.notifier).state) {
        ref.read(responseBallControllerProvider.notifier).getBallResponse();
      }
    });

    detector?.startListening();
  }

  dispose() => detector?.stopListening();
}
