import 'package:flutter/material.dart';
import 'package:untitled/pages/home/home_page.dart';
import '../../data/data_fetch.dart';
import '../../models/model.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({super.key});

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  CharacterModel? character;

  @override
  void didChangeDependencies() {
    character ??= ModalRoute.of(context)!.settings.arguments! as CharacterModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => HomePage()));
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back),
                    Text(
                      '  GO BACK',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Karla',
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
                    image: NetworkImage(character!.image),
                  ),
                ),
              ),
              Text(
                character!.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF081F32),
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 25, left: 10),
                child: Text(
                  'Informations',
                  style: TextStyle(
                    color: Color(0xFF8E8E93),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(
                        color: Color(0xFF081F32),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.15,
                      ),
                    ),
                    Text(
                      character!.gender,
                      style: const TextStyle(
                        color: Color(0xFF6E798C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    const Text(
                      'Status',
                      style: TextStyle(
                        color: Color(0xFF081F32),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.15,
                      ),
                    ),
                    Text(
                      character!.status,
                      style: const TextStyle(
                        color: Color(0xFF6E798C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    const Text(
                      'Specie',
                      style: TextStyle(
                        color: Color(0xFF081F32),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.15,
                      ),
                    ),
                    Text(
                      character!.species,
                      style: const TextStyle(
                        color: Color(0xFF6E798C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    const Text(
                      'Origin',
                      style: TextStyle(
                        color: Color(0xFF081F32),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.15,
                      ),
                    ),
                    Text(
                      character!.origin.name,
                      style: const TextStyle(
                        color: Color(0xFF6E798C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    const Text(
                      'Location',
                      style: TextStyle(
                        color: Color(0xFF081F32),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.15,
                      ),
                    ),
                    Text(
                      character!.location.name,
                      style: const TextStyle(
                        color: Color(0xFF6E798C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
