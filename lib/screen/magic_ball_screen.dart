import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/screen/view/magic_ball_view.dart';

import 'model/magic_ball.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  MagicBallScreenState createState() => MagicBallScreenState();
}

class MagicBallScreenState extends State<MagicBallScreen> {
  final MagicBall magicBall = MagicBall(MagicBallState.waiting);

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
                  onTap: _askMagicBall,
                  child: MagicBallView(
                      state: magicBall.state, reading: magicBall.reading),
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

  void _askMagicBall() {
    setState(() {
      if(magicBall.state == MagicBallState.waiting) {
        magicBall.state = MagicBallState.reading;
        magicBall.reading =
        "I'm concerned that you might not have loved yourself enough today";
        log('${magicBall.state}');
      } else {
        magicBall.state = MagicBallState.waiting;
        magicBall.reading = null;
        log('${magicBall.state}');
      }
    });
  }
}
