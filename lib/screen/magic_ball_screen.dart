import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shake/shake.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Magic Ball'),
        ),
      ),
      body: Center(
        child: MagicBall(),
      ),
      backgroundColor: Colors.blueGrey,
      /*bottomNavigationBar: AppBar(
        title: Center(
          child: Text('       Нажмите на шар \nили потрясите телефон'),
        ),
      ),*/
    );
  }
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  // 9-ое задание
  final FlutterTts flutterTts = FlutterTts();

  void speakResponse(String response) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(response);
  }

  // Это чать для 2-ого задания которое возврощает ответы из мок данных
  /*final List<String> mockAnswers = [
    "Yes",
    "No",
    "Ask again later",
    "Cannot predict now",
    "Don't count on it",
    "Most likely",
    "Outlook good",
    "Reply hazy, try again",
  ];

  String currentAnswer = "";

  void showRandomAnswer() {
    setState(() {
      final random = Random();
      currentAnswer = mockAnswers[random.nextInt(mockAnswers.length)];
    });
  }
  */

  // задания 3: использования api
  String currentAnswer = "";
  final String apiUrl = 'https://www.eightballapi.com/api';

  Future<String> fetchAnswer() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body)['reading'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void showRandomAnswer() async {
    try {
      final answer = await fetchAnswer();
      setState(() {
        currentAnswer = answer;
      });
    } catch (e) {
      setState(() {
        currentAnswer = 'Error: Could not fetch answer';
      });
    }
  }

  // задание 4 тряска
  ShakeDetector? shakeDetector;
  @override
  void initState() {
    super.initState();
    shakeDetector = ShakeDetector.autoStart(onPhoneShake: showRandomAnswer);
  }

  @override
  void dispose() {
    flutterTts.stop();
    shakeDetector?.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Этот виджет возвращает ответы при нажатии на изоброжения шара
    return GestureDetector(
      onTap: () {
        showRandomAnswer();
        speakResponse(currentAnswer);
      },
      child: Container(
          child: Column(
        children: [
          Center(
            child: Image(
              image: AssetImage('images/magic_ball.png'),
            ),
          ),
          Text(
            currentAnswer,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
