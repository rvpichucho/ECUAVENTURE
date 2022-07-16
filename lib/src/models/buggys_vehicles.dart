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
    this.priority,
    this.price,
  });

  String? idbuggy;
  String? iduser;
  String? name;
  String? model;
  String? description;
  String? image;
  int? priority;
  String? price;

  factory Buggys.fromJson(Map<String, dynamic> json) => Buggys(
      idbuggy: json["idbuggy"],
      iduser: json["iduser"],
      name: json["name"],
      model: json["model"],
      description: json["description"],
      image: json["image"],
      priority: json["priority"],
      price: json["price"]);

  get background => null;

  Map<String, dynamic> toJson() => {
        "idbuggy": idbuggy,
        "iduser": iduser,
        "name": name,
        "model": model,
        "description": description,
        "image": image,
        "priority": priority,
        "price": price,
      };
}
