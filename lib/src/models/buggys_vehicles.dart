// To parse this JSON data, do
//
//     final buggys = buggysFromJson(jsonString);

import 'dart:convert';

Buggys buggysFromJson(String str) => Buggys.fromJson(json.decode(str));

String buggysToJson(Buggys data) => json.encode(data.toJson());

class Buggys {
  Buggys({
    this.idbuggy,
    this.iduser,
    this.name,
    this.model,
    this.description,
    this.image,
    this.prioridad,
    this.precio,
  });

  String? idbuggy;
  String? iduser;
  String? name;
  String? model;
  String? description;
  String? image;
  int? prioridad;
  String? precio;

  factory Buggys.fromJson(Map<String, dynamic> json) => Buggys(
      idbuggy: json["idbuggy"],
      iduser: json["iduser"],
      name: json["name"],
      model: json["model"],
      description: json["description"],
      image: json["image"],
      prioridad: json["prioridad"],
      precio: json["precio"]);

  get background => null;

  Map<String, dynamic> toJson() => {
        "idbuggy": idbuggy,
        "iduser": iduser,
        "name": name,
        "model": model,
        "description": description,
        "image": image,
        "prioridad": prioridad,
        "precio": precio,
      };
}
