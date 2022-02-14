// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

Ruta reservationFromJson(String str) => Ruta.fromJson(json.decode(str));

String reservationToJson(Ruta data) => json.encode(data.toJson());

class Ruta {
  Ruta({
    this.name,
    this.description,
    this.image,
  });

  String? name;
  String? description;
  String? image;

  factory Ruta.fromJson(Map<String, dynamic> json) => Ruta(
        name: json["name"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
      };
}
