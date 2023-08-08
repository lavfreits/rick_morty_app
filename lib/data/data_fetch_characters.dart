import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

Future<(int,List<CharacterModel>)> fetchDataCharacters(int page) async {
  final url = Uri.parse('https://rickandmortyapi.com/api/character?page=$page');
  final response = await http.get(url);

  final jsonData = json.decode(response.body);
  final characters = <CharacterModel>[];
  for(Map<String, dynamic> json in jsonData['results']! as List){
    characters.add(CharacterModel.fromMap(json));
  }
  final pagesCount = jsonData['info']['pages'] as int;
  return (pagesCount, characters);
}
