import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color),
    );
  }
}
