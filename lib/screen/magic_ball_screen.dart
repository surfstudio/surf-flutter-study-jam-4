import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/di/di.dart';
import 'package:surf_practice_magic_ball/screen/cubit/ball_cubit.dart';
import 'package:surf_practice_magic_ball/screen/cubit/ball_state.dart';
import 'package:surf_practice_magic_ball/theme/colors.dart';
// import 'package:parallax/parallax.dart';

/// Основной экран приложения
class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MagicBallCubit(instance.get(), instance.get()),
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.gradientDark),
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 5),
                  Animate(
                    autoPlay: true,
                    onPlay: (controller) => controller.repeat(reverse: true),
                    effects: const [
                      MoveEffect(
                          begin: Offset(0, -10),
                          end: Offset(0, 10),
                          duration: Duration(milliseconds: 1500))
                    ],
                    child: const MagicBallWidget(),
                  ),
                  const Spacer(),
                  Animate(
                    autoPlay: true,
                    onPlay: (controller) => controller.repeat(reverse: true),
                    effects: const [
                      ScaleEffect(
                          end: Offset(1.1, 1),
                          begin: Offset(0.9, 1),
                          duration: Duration(milliseconds: 1500))
                    ],
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/Ellipse 6.png',
                          // color: Colors.white,
                          // colorBlendMode: BlendMode.multiply,
                        ),
                        Positioned.fill(
                            child: Image.asset(
                          'assets/images/Ellipse 7.png',
                          // color: Colors.white,
                          // colorBlendMode: BlendMode.multiply,
                        )),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  const FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Text('Click on the ball or shake the phone',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF727272)),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Виджет шара
class MagicBallWidget extends StatefulWidget {
  const MagicBallWidget({super.key});

  @override
  State<MagicBallWidget> createState() => _MagicBallWidgetState();
}

class _MagicBallWidgetState extends State<MagicBallWidget>
    with TickerProviderStateMixin {
  late final AnimationController _darkController;
  late final AnimationController _textController;

  @override
  void initState() {
    super.initState();
    _darkController = AnimationController(vsync: this);
    _textController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // список изображений для parallax-а
    // final List<String> listOfImages = [
    //   'assets/images/small star.png',
    //   'assets/images/star.png',
    // ];
    return BlocConsumer<MagicBallCubit, MagicBallState>(
      listener: (context, state) {
        if (state.loading) {
          _darkController.forward();
          _textController.reverse();
        } else {
          if (state.error == null) {
            _textController.forward();
          } else {
            _textController.reverse();
            _darkController.reverse();
          }
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: context.read<MagicBallCubit>().sendRequest,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Image.asset(
                'assets/images/ball.png',
                // color: Colors.red,
                // colorBlendMode: BlendMode.srcOut,
              ),
              // не получилось в parallax :C
              // Positioned.fill(
              //   child: Parallax(
              //     parallaxImages: listOfImages,
              //     circularBorder: true,
              //   ),

              Positioned.fill(child: Image.asset('assets/images/star.png')),
              Positioned.fill(
                  child: Image.asset('assets/images/small star.png')),
              Animate(
                autoPlay: false,
                controller: _darkController,
                effects: const [
                  FadeEffect(duration: Duration(milliseconds: 100))
                ],
                child: Positioned.fill(
                    child: Image.asset('assets/images/Group 3.png')),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Animate(
                    controller: _textController,
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 100)),
                      BlurEffect(begin: Offset(4, 4), end: Offset.zero),
                      ScaleEffect(begin: Offset(1.2, 1.2), end: Offset(1, 1)),
                    ],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.prediction,
                            style: const TextStyle(
                                fontSize: 32, color: Colors.white),
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
