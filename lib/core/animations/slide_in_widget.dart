import 'package:flutter/material.dart';

class SlideInWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Offset begin;

  const SlideInWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.begin = const Offset(1.0, 0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: Offset.zero),
      duration: duration,
      builder: (context, offset, child) {
        return Transform.translate(offset: offset * 200, child: child);
      },
      child: child,
    );
  }
}
