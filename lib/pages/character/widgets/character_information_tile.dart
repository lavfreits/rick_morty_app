import 'package:flutter/material.dart';

class CharacterInfoTile extends StatelessWidget {
  const CharacterInfoTile({
    super.key,
    required this.title,
    required this.value,
    this.onTap
  });

  final String title;
  final String value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),
              ),
              if (onTap != null)
              const Padding(
                padding: EdgeInsets.only(right: 18),
                child: Icon(Icons.arrow_forward_ios_sharp,
                size: 16,),
              )
            ],
          ),
          const Divider(height: 20)
        ],
      ),
    );
  }
}