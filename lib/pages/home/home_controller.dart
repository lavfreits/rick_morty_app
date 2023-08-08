import 'package:flutter/material.dart';

import '../../data/data_fetch_characters.dart';
import '../../models/character_model.dart';

class HomeController extends ChangeNotifier{
  List<CharacterModel> characters = [];
  bool isLoading = false;
  int page = 1;
  int? pagesCount;

  void requestApiCharacters() async {
    if (isLoading) return;
    if (page == this.pagesCount) return;
    isLoading = true;

    final (pagesCount, newCharacters) = await fetchDataCharacters(page);
    page++;
    this.pagesCount = pagesCount;
    characters.addAll(newCharacters);
    isLoading = false;
    notifyListeners();
  }
}