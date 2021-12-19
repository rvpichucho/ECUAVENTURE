// To parse this JSON data, do
//
//     final motorcycles = motorcyclesFromJson(jsonString);

import 'dart:convert';

Motorcycles motorcyclesFromJson(String str) => Motorcycles.fromJson(json.decode(str));

String motorcyclesToJson(Motorcycles data) => json.encode(data.toJson());

class Motorcycles {
    Motorcycles({
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

    factory Motorcycles.fromJson(Map<String, dynamic> json) => Motorcycles(
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