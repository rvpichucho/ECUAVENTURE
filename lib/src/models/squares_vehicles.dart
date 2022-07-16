// To parse this JSON data, do
//
//     final squares = squaresFromJson(jsonString);

import 'dart:convert';

Squares squaresFromJson(String str) => Squares.fromJson(json.decode(str));

String squaresToJson(Squares data) => json.encode(data.toJson());

class Squares {
  Squares({
    this.idsquare,
    this.iduser,
    this.name,
    this.model,
    this.description,
    this.image,
    this.priority,
    this.price,
  });

  String? idsquare;
  String? iduser;
  String? name;
  String? model;
  String? description;
  String? image;
  int? priority;
  String? price;

  factory Squares.fromJson(Map<String, dynamic> json) => Squares(
      idsquare: json["idsquare"],
      iduser: json["iduser"],
      name: json["name"],
      model: json["model"],
      description: json["description"],
      image: json["image"],
      priority: json["priority"],
      price: json["price"]);

  Map<String, dynamic> toJson() => {
        "idsquare": idsquare,
        "iduser": iduser,
        "name": name,
        "model": model,
        "description": description,
        "image": image,
        "priority": priority,
        "price": price,
      };
}
