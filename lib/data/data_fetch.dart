import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';

Future<List<CharacterModel>> fetchData() async {
  final url = Uri.parse('https://rickandmortyapi.com/api/character');
  final response = await http.get(url);

  final jsonData = json.decode(response.body);
  final characters = <CharacterModel>[];
  for(Map<String, dynamic> json in jsonData['results']! as List){
    characters.add(CharacterModel.fromMap(json));
  }
  return characters;
}
