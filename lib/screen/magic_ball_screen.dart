// import 'dart:convert';
// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/theme/app_theme.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().screenWidth,
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
            SizedBox(
              height: 200.h,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/ball.png"),
                Image.asset("assets/images/small star.png"),
                Image.asset("assets/images/star.png"),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/Ellipse 7.png",
                ),
                Image.asset(
                  "assets/images/Ellipse 6.png",
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.h),
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
