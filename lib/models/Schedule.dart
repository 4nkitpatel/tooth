import 'dart:convert';

List<Schedule> scheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  Schedule(
      {this.id,
      this.name,
      this.treatment,
      this.visit,
      this.state,
      this.time,
      this.insuredStatus,
      this.addressName});

  String id;
  String name;
  String treatment;
  String visit;
  String state;
  String time;
  String insuredStatus;
  String addressName;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
      id: json["id"],
      name: json["name"] ?? "",
      treatment: json["treatment"] ?? "",
      visit: json["visit"] ?? "",
      state: json["state"] ?? "",
      time: json["time"] ?? "",
      insuredStatus: json["insuredStatus"] ?? "",
      addressName: json["addressName"] ?? "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "treatment": treatment,
        "visit": visit,
        "state": state,
        "time": time,
        "insuredStatus": insuredStatus,
        "addressName": addressName
      };
}
