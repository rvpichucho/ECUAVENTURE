import 'dart:convert';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
  Foto({this.url, this.date, this.observation, this.idvehicles, this.iduser});
  String? url;
  DateTime? date;
  String? observation;
  String? idvehicles;
  String? iduser;

  factory Foto.created(String value) =>
      Foto(idvehicles: value, date: DateTime.now());

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        url: json["url"],
        date: DateTime.parse(json["date"]),
        observation: json["observation"],
        idvehicles: json["idvehicles"],
        iduser: json["iduser"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "date": date!.toString(),
        "observation": observation,
        "idvehicles": idvehicles,
        "iduser": iduser,
      };
}
