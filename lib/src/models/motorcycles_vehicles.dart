// To parse this JSON data, do
//
//     final motorcycles = motorcyclesFromJson(jsonString);

import 'dart:convert';

Motorcycles motorcyclesFromJson(String str) =>
    Motorcycles.fromJson(json.decode(str));

String motorcyclesToJson(Motorcycles data) => json.encode(data.toJson());

class Motorcycles {
  Motorcycles({
    this.idmotorcycle,
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

  String? idmotorcycle;
  String? iduser;
  String? name;
  String? model;
  String? description;
  String? image;
  int? priority;
  String? price;
  double? lat;
  double? lng;
  factory Motorcycles.fromJson(Map<String, dynamic> json) => Motorcycles(
      idmotorcycle: json["idmotorcycle"],
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
        "idmotorcycle": idmotorcycle,
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
