import 'dart:convert';

List<Patients> patientsFromJson(String str) =>
    List<Patients>.from(json.decode(str).map((x) => Patients.fromJson(x)));

String patientsToJson(List<Patients> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patients {
  Patients({
    this.id,
    this.imageUrl,
    this.date,
    this.name,
  });

  int id;
  String imageUrl;
  String date;
  String name;

  factory Patients.fromJson(Map<String, dynamic> json) => Patients(
        id: json["id"],
        imageUrl: json["imageUrl"],
        date: json["date"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "date": date,
        "name": name,
      };
}
