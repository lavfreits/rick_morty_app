import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location_model.dart';

Future<LocationModel> fetchDataLocations(String locationUrl) async {
  final url = Uri.parse(locationUrl);
  final response = await http.get(url);

  final jsonData = json.decode(response.body);

  return LocationModel.fromMap(jsonData);
}
