// To parse this JSON data, do
//
//     final squares = squaresFromJson(jsonString);

import 'dart:convert';

Squares squaresFromJson(String str) => Squares.fromJson(json.decode(str));

String squaresToJson(Squares data) => json.encode(data.toJson());

class Squares {
  Squares({
    this.idsquare,
    this.name,
    this.model,
    this.description,
    this.image,
  });

  String? idsquare;
  String? name;
  String? model;
  String? description;
  String? image;

  factory Squares.fromJson(Map<String, dynamic> json) => Squares(
        idsquare: json["idsquare"],
        name: json["name"],
        model: json["model"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "idsquare": idsquare,
        "name": name,
        "model": model,
        "description": description,
        "image": image,
      };
}
