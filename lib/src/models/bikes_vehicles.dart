// To parse this JSON data, do
//
//     final bikes = bikesFromJson(jsonString);

import 'dart:convert';

Bikes bikesFromJson(String str) => Bikes.fromJson(json.decode(str));

String bikesToJson(Bikes data) => json.encode(data.toJson());

class Bikes {
    Bikes({
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

    factory Bikes.fromJson(Map<String, dynamic> json) => Bikes(
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