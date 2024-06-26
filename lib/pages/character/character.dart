import 'package:flutter/material.dart';
import 'package:untitled/pages/widgets/text_title.dart';

import '../../models/character_model.dart';
import 'character_controller.dart';
import 'widgets/character_information_tile.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({super.key});

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  final characterPageController = CharacterController();

  @override
  void didChangeDependencies() {
    characterPageController.character ??=
        ModalRoute.of(context)!.settings.arguments! as CharacterModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: Colors.black87,
              padding: const EdgeInsets.all(18.0),
            )
          ],
          leading: IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/logo.png'),
              color: Colors.black,
              size: 60,
            ),
          ),
          leadingWidth: 90,
          toolbarHeight: 60,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Row(
                children: [
                  Icon(Icons.arrow_back),
                  Text(
                    '  GO BACK',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 146,
              height: 148,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(characterPageController.character!.image),
                ),
              ),
            ),
            Text(
              characterPageController.character!.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF081F32),
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
            const TextTitle(text: 'Informations'),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  CharacterInfoTile(
                      title: 'Gender',
                      value: characterPageController.character!.gender),
                  CharacterInfoTile(
                      title: 'Status',
                      value: characterPageController.character!.status),
                  CharacterInfoTile(
                      title: 'Specie',
                      value: characterPageController.character!.species),
                  CharacterInfoTile(
                      title: 'Origin',
                      value: characterPageController.character!.origin.name),
                  CharacterInfoTile(
                      title: 'Location',
                      value: characterPageController.character!.location.name,
                      onTap: () {}),
                ],
              ),
            ),
          ],
        ));
  }
}
