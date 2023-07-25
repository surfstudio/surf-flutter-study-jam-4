import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/presentation/ball_screen/magic_ball_screen.dart';
import 'package:surf_practice_magic_ball/services/shake_service.dart';
import 'package:surf_practice_magic_ball/utils/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // create container for use in scope
  final container = ProviderContainer();

  // initialize service for listen shake device before runApp
  if (Platform.isAndroid || Platform.isIOS) {
    container.read(shakeServiceProvider);
  }

  // wrap with [ProviderScope] for riverpod work
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

/// App,s main widget.
class MyApp extends ConsumerWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider); // listen theme changes
    return MaterialApp(
      theme: lightColorScheme,
      darkTheme: darkColorScheme,
      themeMode: themeMode,
      home: const MagicBallScreen(),
    );
  }
}
