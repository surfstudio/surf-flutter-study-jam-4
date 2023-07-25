import 'dart:developer';

import 'package:flutter/material.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 211, 211, 255)],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 44.0,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    log('Ball pressed!');
                  },
                  child: Image.asset(
                    'assets/images/ball.png',
                    height: 644,
                    width: 644,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 80.0),
                child: Text(
                  'Press the magic ball or shake your phone',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 108, 105, 140),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
