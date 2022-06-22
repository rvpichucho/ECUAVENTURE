import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

User? user = FirebaseAuth.instance.currentUser;
Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
  Foto({this.url, this.fecha, this.observacion, this.idvehicles, this.iduser});
  String? url;
  DateTime? fecha;
  String? observacion;
  String? idvehicles;
  String? iduser;

  factory Foto.created(String value) =>
      Foto(idvehicles: value, iduser: user!.uid, fecha: DateTime.now());

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        url: json["url"],
        fecha: DateTime.parse(json["fecha"]),
        observacion: json["observacion"],
        idvehicles: json["idvehicles"],
        iduser: json["iduser"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "fecha": fecha!.toString(),
        "observacion": observacion,
        "idvehicles": idvehicles,
        "iduser": iduser,
      };
}
