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
    this.iduser,
    this.hour,
    this.totalValue,
    this.date,
    this.vehicles,
    this.state,
  });

  String? idreservation;
  String? iduser;
  String? hour;
  String? totalValue;
  DateTime? date;
  List<dynamic>? vehicles;
  int? state;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        idreservation: json["idreservation"],
        iduser: json["iduser"],
        hour: json["hour"],
        totalValue: json["totalValue"],
        date: DateTime.parse(json["date"]),
        vehicles: json["vehicles"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "idreservation": idreservation,
        "iduser": iduser,
        "hour": hour,
        "totalValue": totalValue,
        "date": date!.toString(),
        "vehicles": vehicles,
        "state": state,
      };
}
