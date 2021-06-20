// To parse this JSON data, do
//
//     final medication = medicationFromJson(jsonString);

import 'dart:convert';

List<Medication> medicationFromJson(String str) =>
    List<Medication>.from(json.decode(str).map((x) => Medication.fromJson(x)));

String medicationToJson(List<Medication> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medication {
  Medication({
    this.id,
    this.name,
    this.composition,
    this.rantinine,
  });

  int id;
  String name;
  String composition;
  String rantinine;

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        id: json["id"],
        name: json["name"],
        composition: json["composition"],
        rantinine: json["rantinine"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "composition": composition,
        "rantinine": rantinine,
      };
}
