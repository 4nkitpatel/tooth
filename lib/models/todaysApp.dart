import 'dart:convert';

List<TodaysApp> todaysAppFromJson(String str) =>
    List<TodaysApp>.from(json.decode(str).map((x) => TodaysApp.fromJson(x)));

String todaysAppToJson(List<TodaysApp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodaysApp {
  TodaysApp({
    this.id,
    this.patientName,
    this.state,
    this.time,
  });

  String id;
  String patientName;
  String state;
  String time;

  factory TodaysApp.fromJson(Map<String, dynamic> json) => TodaysApp(
        id: json["id"],
        patientName: json["patientName"] ?? "",
        state: json["state"] ?? "",
        time: json["time"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patientName": patientName,
        "state": state,
        "time": time,
      };
}
