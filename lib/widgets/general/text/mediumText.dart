import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  const MediumText({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: color),
    );
  }
}
