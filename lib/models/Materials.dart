import 'dart:convert';

List<Materials> materialsFromJson(String str) =>
    List<Materials>.from(json.decode(str).map((x) => Materials.fromJson(x)));

String materialsToJson(List<Materials> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Materials {
  Materials({
    this.id,
    this.materialName,
    this.price,
    this.paymentMode,
    this.state,
    this.time,
  });

  int id;
  String materialName;
  String price;
  String paymentMode;
  String state;
  String time;

  factory Materials.fromJson(Map<String, dynamic> json) => Materials(
        id: json["id"],
        materialName: json["materialName"],
        price: json["price"],
        paymentMode: json["paymentMode"],
        state: json["state"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "materialName": materialName,
        "price": price,
        "paymentMode": paymentMode,
        "state": state,
        "time": time,
      };
}
