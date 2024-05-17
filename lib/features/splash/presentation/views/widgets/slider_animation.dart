import 'package:flutter/material.dart';

class SliderAnimation extends StatelessWidget {
  const SliderAnimation({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Read Free Books',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
