import 'package:flutter/material.dart';
import 'package:untitled/pages/widgets/text_title.dart';

import 'location_controller.dart';
import '../character/character.dart';
import '../home/widgets/character_tile.dart';
import '../../models/character_model.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final locationController = LocationController();

  @override
  void initState() {
    super.initState();
    locationController.initializeData(
        widget.location.url, widget.location.name);
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
          ),
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
          if (locationController.location != null)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 15),
                  child: Text(
                    locationController.location!.name,
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
                            locationController.location!.type,
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
                            locationController.location!.dimension,
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
                const Align(
                    alignment: Alignment.centerLeft,
                    child: TextTitle(text: 'Residents')),
                ListenableBuilder(
                  listenable: locationController,
                  builder: (context, _) {
                    if (locationController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black54),
                        ),
                      );
                    }
                    if (locationController.hasError) {
                      return const Center(child: Icon(Icons.restart_alt));
                    }
                    return Column(
                      children: locationController.filteredCharacters
                          .map((character) => CharacterTile(
                                character: character,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CharacterInfo(),
                                      settings:
                                          RouteSettings(arguments: character),
                                    ),
                                  );
                                },
                              ))
                          .toList(),
                    );
                  },
                ),
              ],
            )
        ],
      ),
    );
  }
}
