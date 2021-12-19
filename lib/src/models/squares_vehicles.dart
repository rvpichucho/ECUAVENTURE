// To parse this JSON data, do
//
//     final squares = squaresFromJson(jsonString);

import 'dart:convert';

Squares squaresFromJson(String str) => Squares.fromJson(json.decode(str));

String squaresToJson(Squares data) => json.encode(data.toJson());

class Squares {
    Squares({
        this.idmotorcycle,
        this.name,
        this.model,
        this.description,
        this.img,
    });

    String? idmotorcycle;
    String? name;
    String? model;
    String? description;
    String? img;

    factory Squares.fromJson(Map<String, dynamic> json) => Squares(
        idmotorcycle: json["idmotorcycle"],
        name: json["name"],
        model: json["model"],
        description: json["description"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "idmotorcycle": idmotorcycle,
        "name": name,
        "model": model,
        "description": description,
        "img": img,
    };
}

