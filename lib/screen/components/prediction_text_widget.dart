import 'package:flutter/material.dart';

class PredictionTextWidget extends StatelessWidget {
  const PredictionTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }
}
