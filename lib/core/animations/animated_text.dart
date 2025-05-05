import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;

  const AnimatedText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 100),
  });

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  String _displayedText = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() async {
    while (_currentIndex < widget.text.length) {
      await Future.delayed(widget.duration);
      setState(() {
        _displayedText += widget.text[_currentIndex];
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(_displayedText, style: widget.style);
  }
}
