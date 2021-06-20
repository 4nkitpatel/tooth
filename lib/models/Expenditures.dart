import 'dart:convert';

List<Expenditures> expendituresFromJson(String str) => List<Expenditures>.from(
    json.decode(str).map((x) => Expenditures.fromJson(x)));

String expendituresToJson(List<Expenditures> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Expenditures {
  Expenditures({
    this.id,
    this.labName,
    this.price,
    this.paymentMode,
    this.state,
    this.time,
    this.date,
  });

  int id;
  String labName;
  String price;
  String paymentMode;
  String state;
  String time;
  String date;

  factory Expenditures.fromJson(Map<String, dynamic> json) => Expenditures(
        id: json["id"],
        labName: json["labName"],
        price: json["price"],
        paymentMode: json["paymentMode"],
        state: json["state"],
        time: json["time"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "labName": labName,
        "price": price,
        "paymentMode": paymentMode,
        "state": state,
        "time": time,
        "date": date,
      };
}
