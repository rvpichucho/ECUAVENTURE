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
    this.name,
    this.model,
    this.description,
    this.image,
    this.prioridad,
    this.lat,
    this.lng,
  });

  String? idmotorcycle;
  String? name;
  String? model;
  String? description;
  String? image;
  int? prioridad;
  double? lat;
  double? lng;
  factory Motorcycles.fromJson(Map<String, dynamic> json) => Motorcycles(
      idmotorcycle: json["idmotorcycle"],
      name: json["name"],
      model: json["model"],
      description: json["description"],
      image: json["image"],
      prioridad: json["prioridad"],
      lat: json["lat"],
      lng: json["lng"]);
      
  Map<String, dynamic> toJson() => {
        "idmotorcycle": idmotorcycle,
        "name": name,
        "model": model,
        "description": description,
        "image": image,
        "prioridad": prioridad,
        "lat": lat,
        "lng": lng,
      };
}
