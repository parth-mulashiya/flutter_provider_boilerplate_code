import 'package:flutter/material.dart';

enum SlideDirection { topToBottom, bottomToTop, leftToRight, rightToLeft }

class SlideFadeAnimation extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration duration;
  final Curve curve;
  final double offset;

  const SlideFadeAnimation({
    super.key,
    required this.child,
    this.direction = SlideDirection.bottomToTop,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeInOut,
    this.offset = 0.2,
  });

  @override
  State<SlideFadeAnimation> createState() => _SlideFadeAnimationState();
}

class _SlideFadeAnimationState extends State<SlideFadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    final beginOffset = _getOffsetFromDirection(
      widget.direction,
      widget.offset,
    );

    _offsetAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _controller.forward();
  }

  Offset _getOffsetFromDirection(SlideDirection direction, double offset) {
    switch (direction) {
      case SlideDirection.topToBottom:
        return Offset(0, -offset);
      case SlideDirection.bottomToTop:
        return Offset(0, offset);
      case SlideDirection.leftToRight:
        return Offset(-offset, 0);
      case SlideDirection.rightToLeft:
        return Offset(offset, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(position: _offsetAnimation, child: widget.child),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
