class LocationModel {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final DateTime created;

  LocationModel.fromMap(Map<String, dynamic> json):
        id = json["id"],
        name = json["name"],
        type = json["type"],
        dimension = json["dimension"],
        residents = List<String>.from(json["residents"].map((x) => x)),
        created = DateTime.parse(json["created"]);
}
