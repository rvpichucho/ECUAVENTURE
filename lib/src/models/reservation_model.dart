// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

Reservation reservationFromJson(String str) =>
    Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    this.idreservacion,
    this.iduser,
    this.hour,
    this.total,
    this.fecha,
    this.vehicles,
    this.estado,
  });

  String? idreservacion;
  String? iduser;
  String? hour;
  String? total;
  DateTime? fecha;
  List<dynamic>? vehicles;
  int? estado;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        idreservacion: json["idreservacion"],
        iduser: json["iduser"],
        hour: json["hour"],
        total: json["total"],
        fecha: DateTime.parse(json["fecha"]),
        vehicles: json["vehicles"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "idreservacion": idreservacion,
        "iduser": iduser,
        "hour": hour,
        "total": total,
        "fecha": fecha!.toString(),
        "vehicles": vehicles,
        "estado": estado,
      };
}
