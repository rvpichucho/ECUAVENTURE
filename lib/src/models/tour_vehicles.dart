// To parse this JSON data, do
//
//     final tour = tourFromJson(jsonString);

import 'dart:convert';

Tour tourFromJson(String str) => Tour.fromJson(json.decode(str));

String tourToJson(Tour data) => json.encode(data.toJson());

class Tour {
    Tour({
        this.id,
        this.title,
        this.name,
        this.description,
        this.direction,
        this.image,
    });

    int? id;
    String? title;
    String? name;
    String? description;
    String? direction;
    String? image;

    factory Tour.fromJson(Map<String, dynamic> json) => Tour(
        id: json["id"],
        title: json["title"],
        name: json["name"],
        description: json["description"],
        direction: json["direction"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "name": name,
        "description": description,
        "direction": direction,
        "image": image,
    };
}