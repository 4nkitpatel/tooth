// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';

List<Schedule> scheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  Schedule({
    this.id,
    this.name,
    this.treatment,
    this.visit,
    this.state,
    this.time,
    this.insuredStatus,
    this.addressName,
    this.drDetails,
  });

  String id;
  String name;
  String treatment;
  String visit;
  String state;
  String time;
  String insuredStatus;
  String addressName;
  List<DrDetail> drDetails;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        treatment: json["treatment"] ?? "",
        visit: json["visit"] ?? "",
        state: json["state"] ?? "",
        time: json["time"] ?? "",
        insuredStatus: json["insuredStatus"] ?? "",
        addressName: json["addressName"] ?? "",
        drDetails: json["DrDetails"] == null
            ? null
            : List<DrDetail>.from(
                json["DrDetails"].map((x) => DrDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "treatment": treatment,
        "visit": visit,
        "state": state,
        "time": time,
        "insuredStatus": insuredStatus,
        "addressName": addressName,
        "DrDetails": drDetails == null
            ? null
            : List<dynamic>.from(drDetails.map((x) => x.toJson())),
      };
}

class DrDetail {
  DrDetail({
    this.drName,
    this.imageUrl,
  });

  String drName;
  String imageUrl;

  factory DrDetail.fromJson(Map<String, dynamic> json) => DrDetail(
        drName: json["drName"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "drName": drName,
        "imageUrl": imageUrl,
      };
}









// import 'dart:convert';

// List<Schedule> scheduleFromJson(String str) =>
//     List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

// String scheduleToJson(List<Schedule> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Schedule {
//   Schedule(
//       {this.id,
//       this.name,
//       this.treatment,
//       this.visit,
//       this.state,
//       this.time,
//       this.insuredStatus,
//       this.addressName,
//       this.drDetails});

//   String id;
//   String name;
//   String treatment;
//   String visit;
//   String state;
//   String time;
//   String insuredStatus;
//   String addressName;
//   List drDetails;

//   factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
//       id: json["id"],
//       name: json["name"] ?? "",
//       treatment: json["treatment"] ?? "",
//       visit: json["visit"] ?? "",
//       state: json["state"] ?? "",
//       time: json["time"] ?? "",
//       insuredStatus: json["insuredStatus"] ?? "",
//       addressName: json["addressName"] ?? "",
//       drDetails: json["drDetails"] ?? []);

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "treatment": treatment,
//         "visit": visit,
//         "state": state,
//         "time": time,
//         "insuredStatus": insuredStatus,
//         "addressName": addressName,
//         "drDetails": drDetails,
//       };
// }
