import 'package:flutter/material.dart';

class FadingText extends StatelessWidget {
  final String text;

  const FadingText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}
