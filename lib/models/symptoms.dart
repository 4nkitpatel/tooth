import 'dart:convert';

List<Symptoms> symptomsFromJson(String str) =>
    List<Symptoms>.from(json.decode(str).map((x) => Symptoms.fromJson(x)));

String symptomsToJson(List<Symptoms> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Symptoms {
  Symptoms({
    this.id,
    this.name,
    this.desc,
  });

  int id;
  String name;
  String desc;

  factory Symptoms.fromJson(Map<String, dynamic> json) => Symptoms(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
      };
}
