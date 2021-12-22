// To parse this JSON data, do
//
//     final buggys = buggysFromJson(jsonString);

import 'dart:convert';

Buggys buggysFromJson(String str) => Buggys.fromJson(json.decode(str));

String buggysToJson(Buggys data) => json.encode(data.toJson());

class Buggys {
  Buggys({
    this.idbuggy,
    this.name,
    this.model,
    this.description,
    this.image,
  });

  String? idbuggy;
  String? name;
  String? model;
  String? description;
  String? image;

  factory Buggys.fromJson(Map<String, dynamic> json) => Buggys(
        idbuggy: json["idbuggy"],
        name: json["name"],
        model: json["model"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "idbuggy": idbuggy,
        "name": name,
        "model": model,
        "description": description,
        "image": image,
      };
}
