import 'dart:convert';

List<Patients> patientsFromJson(String str) =>
    List<Patients>.from(json.decode(str).map((x) => Patients.fromJson(x)));

String patientsToJson(List<Patients> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patients {
  Patients({this.id, this.imageUrl, this.date, this.name, this.addressName});

  String id;
  String imageUrl;
  String date;
  String name;
  String addressName;

  factory Patients.fromJson(Map<String, dynamic> json) => Patients(
      id: json["id"],
      imageUrl: json["imageUrl"] ?? "",
      date: json["date"] ?? "",
      name: json["name"] ?? "",
      addressName: json["addressName"] ?? "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "date": date,
        "name": name,
        "addressName": addressName
      };
}
