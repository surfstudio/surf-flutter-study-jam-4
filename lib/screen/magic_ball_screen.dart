// import 'dart:convert';
// import 'dart:math';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/constants/app_images.dart';
import 'package:surf_practice_magic_ball/theme/app_theme.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  String apiUrl = "https://eightballapi.com/api";
  String currentAnswer = "";
  bool isAnswerVisible = false;
  bool isAnimating = false;
  bool error = false;

  void shakeBall() {
    if (isAnimating) return; // Блокируем действия во время анимации

    setState(() {
      currentAnswer = "";
      isAnswerVisible = false;
      isAnimating = true;
    });

    // Выполняем GET-запрос к API для получения ответа
    http.get(Uri.parse(apiUrl)).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          currentAnswer = data["reading"];
          isAnswerVisible = true;
        });
      } else {
        // В случае ошибки от API показываем сообщение об ошибке
        setState(() {
          currentAnswer = "";
          error = true;
          isAnswerVisible = true;
        });
      }
    }).catchError((error) {
      // В случае ошибки при выполнении запроса показываем сообщение об ошибке
      setState(() {
        currentAnswer = "";
        error = true;
        isAnswerVisible = true;
      });
    }).whenComplete(() {
      // Завершаем анимацию
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isAnimating = false;
          isAnswerVisible = false;
        });
      });
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
                  Image.asset(
                    error ? AppImages.ballError : AppImages.ball,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    opacity: !isAnswerVisible ? 1.0 : 0,
                    child: Image.asset(AppImages.smallStar),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    opacity: isAnswerVisible ? 1.0 : 0,
                    child: Text(
                      currentAnswer,
                      style: Theme.of(context).textTheme.ballHeader,
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: !isAnswerVisible ? 1.0 : 0,
                    child: Image.asset(
                      error ? AppImages.starError : AppImages.star,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: !isAnswerVisible ? 1.0 : 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    error ? AppImages.innerCircleError : AppImages.innerCircle,
                  ),
                  Image.asset(
                    error ? AppImages.outerCircleError : AppImages.outerCircle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
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
