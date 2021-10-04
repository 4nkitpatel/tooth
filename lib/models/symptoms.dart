import 'dart:convert';

List<Symptoms> symptomsFromJson(String str) =>
    List<Symptoms>.from(json.decode(str).map((x) => Symptoms.fromJson(x)));

String symptomsToJson(List<Symptoms> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Symptoms {
  Symptoms({
    this.id,
    this.name,
    this.description,
  });

  String id;
  String name;
  String description;

  // we use this to make our instance accessable nai to its is instance of obj evu aavse
  // @override
  // toString() => name;

  factory Symptoms.fromJson(Map<String, dynamic> json) => Symptoms(
        id: json["id"].toLowerCase(),
        name: json["name"].toLowerCase() ?? "",
        description: json["description"].toLowerCase() ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
