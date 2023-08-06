import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 25, left: 15),
      child: Text(
          text,
        style: const TextStyle(
          color: Color(0xFF8E8E93),
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
      ),
    );
  }
}
