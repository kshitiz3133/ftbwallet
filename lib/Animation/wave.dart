import 'package:flutter/material.dart';
import 'dart:math';

class MyClipPath extends AnimatedWidget {
  final Animation<double> animation;

  MyClipPath(this.animation)
      : super(listenable: animation);

  final Color backgroundColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 180 * (pi / 180),
      child: Container(
        height: 190,
        width: MediaQuery.of(context).size.width,
        child: Stack(
            children: [Positioned(
              top: 20,
              right: animation.value,
              child: ClipPath(
                clipper: BottomWaveClipper(),
                child: Opacity(
                  opacity: 1,
                  child: Container(
                    color: backgroundColor,
                    width: 2000,
                    height: 200,
                  ),
                ),
              ),
            ),]
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, 40.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40.0);

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            0.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 120,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      }
    }

    path.lineTo(0.0, 40.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {

  late final Animation<double> animation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 3),
        vsync: this)..repeat();

    animation = Tween<double>(begin: -500, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyClipPath(
        animation
    );
  }
}