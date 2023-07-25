// import 'dart:convert';
// import 'dart:math';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/constants/app_images.dart';
import 'package:surf_practice_magic_ball/theme/app_theme.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  List<String> answers = [
    "Да",
    "Нет",
    "Возможно",
    "Попробуй снова",
    "Не уверен",
    "Спроси позже",
  ];

  String currentAnswer = "";

  void shakeBall() {
    setState(() {
      int randomIndex = Random().nextInt(answers.length);
      currentAnswer = answers[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(16, 12, 44, 1),
              Color.fromRGBO(14, 10, 36, 1),
              Color.fromRGBO(1, 1, 3, 1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: shakeBall,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppImages.ball),
                  Image.asset(AppImages.smallStar),
                  Image.asset(AppImages.star),
                  Text(
                    currentAnswer,
                    style: const TextStyle(fontSize: 33, color: Colors.white),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppImages.innerCircle,
                ),
                Image.asset(
                  AppImages.outerCircle,
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: 100.h),
              child: Column(
                children: [
                  Text(
                    "Нажми на шар",
                    style: Theme.of(context).textTheme.ballCaption,
                  ),
                  Text(
                    "или потряси телефон",
                    style: Theme.of(context).textTheme.ballCaption,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
