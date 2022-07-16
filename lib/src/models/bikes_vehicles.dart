// To parse this JSON data, do
//
//     final bikes = bikesFromJson(jsonString);

import 'dart:convert';

Bikes bikesFromJson(String str) => Bikes.fromJson(json.decode(str));

String bikesToJson(Bikes data) => json.encode(data.toJson());

class Bikes {
  Bikes({
    this.idbike,
    this.iduser,
    this.name,
    this.model,
    this.description,
    this.image,
    this.priority,
    this.price,
    this.lat,
    this.lng,
  });

  String? idbike;
  String? iduser;
  String? name;
  String? model;
  String? description;
  String? image;
  int? priority;
  String? price;
  double? lat;
  double? lng;
  factory Bikes.fromJson(Map<String, dynamic> json) => Bikes(
      idbike: json["idbike"],
      iduser: json["iduser"],
      name: json["name"],
      model: json["model"],
      description: json["description"],
      image: json["image"],
      priority: json["priority"],
      price: json["price"],
      lat: json["lat"],
      lng: json["lng"]);
  get background => null;

  Map<String, dynamic> toJson() => {
        "idbike": idbike,
        "iduser": iduser,
        "name": name,
        "model": model,
        "description": description,
        "image": image,
        "priority": priority,
        "price": price,
        "lat": lat,
        "lng": lng,
      };
}
