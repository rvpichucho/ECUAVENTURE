// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

Reservation reservationFromJson(String str) =>
    Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    this.iduser,
    this.hour,
    this.total,
    this.fecha,
  });

  String? iduser;
  String? hour;
  String? total;
  DateTime? fecha;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        iduser: json["iduser"],
        hour: json["hour"],
        total: json["total"],
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "hour": hour,
        "total": total,
        "fecha": fecha!.toString(),
      };
}
