import 'package:flutter/material.dart';

import '../../data/data_fetch_characters.dart';
import '../../data/data_fetch_location.dart';
import '../../models/character_model.dart';
import '../../models/location_model.dart';

class LocationController extends ChangeNotifier {
  LocationModel? location;
  List<CharacterModel> characters = [];
  List<String> listResidents = [];
  List<CharacterModel> filteredCharacters = [];
  bool isLoading = false;
  bool hasError = false;

  Future<void> requestApiLocation(String locationUrl, String name) async {
    isLoading= true;
    notifyListeners();
    try {
      location = await fetchDataLocations(locationUrl);
      filtering(name);
      hasError = false;
    } catch (e) {
      hasError= true;
    }finally{
      isLoading = false;
      notifyListeners();
    }

  }

  Future<void> filtering(String location) async {

    // filteredCharacters = characters.where((character) {
    //   return character.location.name.toString() == location.toString();
    // }).toList();
  }

  Future<void> initializeData(String url, String name) async {
    await requestApiLocation(url, name);
  }
}
