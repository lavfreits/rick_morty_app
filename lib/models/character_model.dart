class Info {
  int count;
  int pages;
  String next;
  dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });

  factory Info.fromMap(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );
}

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final String url;


  CharacterModel.fromMap(Map<String, dynamic> json):
    id = json["id"],
    name = json["name"],
    status = json["status"],
    species = json["species"],
    gender = json["gender"],
    origin = Location.fromMap(json["origin"]),
    location = Location.fromMap(json["location"]),
    image = json["image"],
    url = json["url"];
  }

class Location {
  final String name;
  final String url;

   Location.fromMap(Map<String, dynamic> json):
    name = json["name"],
    url = json["url"];
}
