import 'package:flutter/material.dart';

import '../../../models/model.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 5,
          color: Colors.white,
          child: LayoutBuilder(builder: (_, constraints) {
            const ratio = 260 / 310;
            final imgHeight = constraints.maxWidth * ratio;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  child: Image.network(
                    character.image,
                    width: constraints.maxWidth,
                    height: imgHeight,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    character.name,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.87),
                      fontSize: 20 * ratio,
                      fontWeight: FontWeight.w500,
                      height: 30 / 20 * ratio,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    character.species,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14 * ratio,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 21 / 14 * ratio,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            );
          })),
    );
  }
}
