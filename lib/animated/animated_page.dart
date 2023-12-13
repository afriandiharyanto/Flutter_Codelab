import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:vector_math/vector_math_64.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  int xFlag = 0;
  int yFlag = 0;
  int zFlag = 0;

  @override
  void initState() {
    super.initState();
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    _animation = Tween(
      begin: 0,
      end: math.pi * 2,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    Color color1 = random();
    Color color2 = random();
    Color color3 = random();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: Listenable.merge([
            _xController,
            _yController,
            _zController,
          ]),
          builder: (context, child) {
            double xValue = _animation.evaluate(_xController);
            double yValue = _animation.evaluate(_yController);
            double zValue = _animation.evaluate(_zController);

            return Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(xValue)
                  ..rotateY(yValue)
                  ..rotateZ(zValue),
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color1,
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()
                        ..translate(Vector3(0.0, 0.0, 150.0)),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color2,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()
                        ..translate(Vector3(0.0, 0.0, -150.0)),
                      child: Container(
                        color: color3,
                        width: 150,
                        height: 150,
                      ),
                    ),
                    // Container(
                    //   color: Colors.blueAccent,
                    //   width: 100,
                    //   height: 100,
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Color random() => Color((math.Random().nextDouble() * 0xFFFFFFFF).toInt());
}
