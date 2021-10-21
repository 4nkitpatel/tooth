import 'dart:convert';

List<Address> addressFromJson(String str) =>
    List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address {
  Address({
    this.id,
    this.address,
    this.addressName,
    this.lat,
    this.long,
  });

  String id;
  String address;
  String addressName;
  String lat;
  String long;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"] ?? "",
        addressName: json["addressName"] ?? "",
        lat: json["lat"] ?? "",
        long: json["long"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "addressName": addressName,
        "lat": lat,
        "long": long,
      };
}
