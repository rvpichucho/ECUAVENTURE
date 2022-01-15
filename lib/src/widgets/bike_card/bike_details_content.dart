import 'package:ecuaventure/src/models/bikes_vehicles.dart';
//import 'package:ecuaventure/src/widgets/reservation_priority.dart';
import 'package:flutter/material.dart';

//import 'package:timeago/timeago.dart' as timeago;
class BikeDetailsContentWidget extends StatelessWidget {
  const BikeDetailsContentWidget({Key? key, required this.reservation})
      : super(key: key);
  final Bikes reservation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
                title: const Text("Modelo:"),
                subtitle: Text(reservation.model ?? "")),
            ListTile(
                title: const Text("Descripción:"),
                subtitle: Text(reservation.description ?? "")),
            //ListTile(title: const Text("Registrado:"), subtitle: Text(created)),
          ],
        ),
      ),
    );
  }
}
