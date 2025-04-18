import 'dart:convert';

List<AdviceList> adviceListFromJson(String str) =>
    List<AdviceList>.from(json.decode(str).map((x) => AdviceList.fromJson(x)));

String adviceListToJson(List<AdviceList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdviceList {
  AdviceList({this.id, this.name, this.price, this.imageUrl});

  String id;
  String name;
  String price;
  String imageUrl;

  factory AdviceList.fromJson(Map<String, dynamic> json) => AdviceList(
      id: json["id"],
      name: json["name"] ?? "",
      price: json["price"] ?? "",
      imageUrl: json["imageUrl"] ?? "");

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "price": price, "imageUrl": imageUrl};
}
