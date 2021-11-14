// import 'dart:convert';

// List<TodaysApp> todaysAppFromJson(String str) =>
//     List<TodaysApp>.from(json.decode(str).map((x) => TodaysApp.fromJson(x)));

// String todaysAppToJson(List<TodaysApp> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class TodaysApp {
//   TodaysApp({this.id, this.name, this.state, this.time, this.addressName});

//   String id;
//   String name;
//   String state;
//   String time;
//   String addressName;

//   factory TodaysApp.fromJson(Map<String, dynamic> json) => TodaysApp(
//       id: json["id"],
//       name: json["name"] ?? "",
//       state: json["state"] ?? "",
//       time: json["time"] ?? "",
//       addressName: json["addressName"] ?? "");

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "state": state,
//         "time": time,
//         "addressName": addressName
//       };
// }
