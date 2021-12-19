// To parse this JSON data, do
//
//     final buggys = buggysFromJson(jsonString);

import 'dart:convert';

Buggys buggysFromJson(String str) => Buggys.fromJson(json.decode(str));

String buggysToJson(Buggys data) => json.encode(data.toJson());

class Buggys {
    Buggys({
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

    factory Buggys.fromJson(Map<String, dynamic> json) => Buggys(
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