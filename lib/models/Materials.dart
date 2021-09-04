import 'dart:convert';

List<Materials> materialsFromJson(String str) =>
    List<Materials>.from(json.decode(str).map((x) => Materials.fromJson(x)));

String materialsToJson(List<Materials> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Materials {
  Materials({
    this.id,
    this.materialname,
    this.price,
    this.paymentmode,
    this.state,
    this.time,
  });

  String id;
  String materialname;
  int price;
  String paymentmode;
  String state;
  String time;

  factory Materials.fromJson(Map<String, dynamic> json) => Materials(
        id: json["id"],
        materialname: json["materialname"] ?? "",
        price: json["price"] ?? "",
        paymentmode: json["paymentmode"] ?? "",
        state: json["state"] ?? "",
        time: json["time"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "materialname": materialname,
        "price": price,
        "paymentmode": paymentmode,
        "state": state,
        "time": time,
      };
}
