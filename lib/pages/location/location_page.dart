import 'package:flutter/material.dart';
import 'package:untitled/data/data_fetch_location.dart';
import 'package:untitled/pages/widgets/text_title.dart';

import '../../data/data_fetch_characters.dart';
import '../../models/character_model.dart';
import '../../models/location_model.dart';
import '../character/character.dart';
import '../home/widgets/character_tile.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key, required this.page});

  final String page;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationModel? location;
  List<CharacterModel> characters = [];
  List<String> listResidents = [];
  List<CharacterModel> filteredCharacters = [];

  @override
  void initState() {
    getResidents();
    requestApiLocation();
    requestApiCharacters();
    filtering();
    super.initState();
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
          if (location != null) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 15),
              child: Text(
                location!.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF081F32),
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Type',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        location!.type,
                        style: const TextStyle(
                          color: Color(0xFF6E798C),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dimension',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        location!.dimension,
                        style: const TextStyle(
                          color: Color(0xFF6E798C),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const TextTitle(text: 'Residents'),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredCharacters.length,
                itemBuilder: (context, index) {
                  final character = filteredCharacters[index];
                  return CharacterTile(
                    character: character,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CharacterInfo(),
                          settings: RouteSettings(arguments: character),
                        ),
                      );
                    },
                  );
                }),
          ] else ...[
            const Padding(
              padding: EdgeInsets.all(300),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                  //color: Colors.blue,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> requestApiLocation() async {
    location = await fetchDataLocations(widget.page);
    setState(() {});
  }

  Future<void> getResidents() async {
    for (var id in location!.residents) {
      listResidents.add(id);
    }
  }

  Future<List<CharacterModel>> filtering() async {
    for (var resident in listResidents) {
      // filteredCharacters = characters.where((char) => listResidents.contains(char.id)).toList();
      filteredCharacters =
          characters.where((char) => char.id == resident).toList();
    }
    return filteredCharacters;
  }

  void requestApiCharacters() async {
    // characters = await fetchDataCharacters();
    setState(() {});
  }
}
