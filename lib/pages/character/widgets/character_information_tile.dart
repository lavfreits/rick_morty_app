import 'package:flutter/material.dart';

class CharacterInfoTile extends StatelessWidget {
  const CharacterInfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF081F32),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF6E798C),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
        ),
        const Divider(height: 20)
      ],
    );
  }
}
