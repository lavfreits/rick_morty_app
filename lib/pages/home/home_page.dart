import 'package:flutter/material.dart';
import '../../data/data_fetch.dart';
import '../../models/model.dart';
import 'widgets/character_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CharacterModel> characters = [];

  @override
  void initState() {
    requestApi();
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 24, top: 10, right: 24, bottom: 24),
            //alterei o padding top p rick e morty n ficar em baixo da appbar
            child: Container(
              height: 104,
              width: 360,
              margin: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/img.png'), fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return CharacterTile(
                    character: character,
                  );
                }),
          ),
        ],
      ),
    );
  }

  void requestApi() async {
    characters = await fetchData();
    setState(() {});
  }
}
