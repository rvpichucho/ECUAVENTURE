// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

Reservation reservationFromJson(String str) =>
    Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    this.idreservation,
    this.hour,
    this.total,
    this.fecha,
  });

  String? idreservation;
  String? hour;
  String? total;
  String? fecha;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        idreservation: json["idreservation"],
        hour: json["hour"],
        total: json["total"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "idreservation": idreservation,
        "hour": hour,
        "total": total,
        "fecha": fecha,
      };
}
