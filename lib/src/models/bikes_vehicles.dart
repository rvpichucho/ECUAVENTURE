// To parse this JSON data, do
//
//     final bikes = bikesFromJson(jsonString);

import 'dart:convert';

Bikes bikesFromJson(String str) => Bikes.fromJson(json.decode(str));

String bikesToJson(Bikes data) => json.encode(data.toJson());

class Bikes {
  Bikes({
    this.idbike,
    this.name,
    this.model,
    this.description,
    this.image,
    this.prioridad,
  });

  String? idbike;
  String? name;
  String? model;
  String? description;
  String? image;
  int? prioridad;

  factory Bikes.fromJson(Map<String, dynamic> json) => Bikes(
      idbike: json["idbike"],
      name: json["name"],
      model: json["model"],
      description: json["description"],
      image: json["image"],
      prioridad: json["prioridad"]);

  get background => null;

  Map<String, dynamic> toJson() => {
        "idbike": idbike,
        "name": name,
        "model": model,
        "description": description,
        "image": image,
        "prioridad": prioridad,
      };
}
