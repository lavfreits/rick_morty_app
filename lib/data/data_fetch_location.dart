import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location_model.dart';

Future<LocationModel> fetchDataLocations(String page) async {
  final url = Uri.parse(page);
  final response = await http.get(url);

  final jsonData = json.decode(response.body);

 // List<LocationModel> locations = [];

    LocationModel location = LocationModel.fromMap(jsonData);


  return location;
}
