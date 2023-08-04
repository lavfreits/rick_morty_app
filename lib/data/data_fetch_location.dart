import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location_model.dart';

Future<List<LocationModel>> fetchDataLocations(String page) async {
  final url = Uri.parse(page);
  final response = await http.get(url);

  final jsonData = json.decode(response.body);
  final locations = <LocationModel>[];

  for(Map<String, dynamic> json in jsonData['residents'] as List){
    locations.add(LocationModel.fromMap(json));
  }
  return locations;
}
