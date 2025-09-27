import 'package:flutter/material.dart';

class sliding_code extends StatelessWidget {
  const sliding_code({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slidingAnimation,
      child: const Text(
        'Read Free Books',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
