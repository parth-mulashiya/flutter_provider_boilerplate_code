import 'package:flutter/material.dart';

class FadeInWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const FadeInWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(opacity: 1, duration: duration, child: child);
  }
}
