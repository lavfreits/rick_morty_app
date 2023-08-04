import 'package:flutter/material.dart';
import 'package:untitled/data/data_fetch_location.dart';

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
  List<LocationModel> locations = [];

  @override
  void initState() {
    requestApiLocation();
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
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.black),
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

          // Text(location.name),

          // Column(
          //   children: [
          //     Text('Type'),
          //    // Text(location.type),
          //   ],
          // ),
          // Column(
          //   children: [
          //     Text('Dimension'),
          //    // Text(location.dimension),
          //   ],
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 30, bottom: 25, left: 15),
          //   child: Text(
          //     'Redidents',
          //     style: TextStyle(
          //       color: Color(0xFF8E8E93),
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //       letterSpacing: 0.15,
          //     ),
          //   ),
          // ),

        ],
      ),
    );
  }

  void requestApiLocation() async {
     locations = await fetchDataLocations(widget.page);
    setState(() {});
  }
}
