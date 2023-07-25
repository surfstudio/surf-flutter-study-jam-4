import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lightColorScheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromARGB(255, 217, 193, 255),
);

final darkColorScheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  primarySwatch: Colors.deepPurple,
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromARGB(255, 67, 11, 156),
);

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.dark;
});
