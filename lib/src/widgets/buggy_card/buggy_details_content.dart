
import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:flutter/material.dart';
class BuggyDetailsContentWidget extends StatelessWidget {
  const BuggyDetailsContentWidget(
      {Key? key, required this.reservation})
      : super(key: key);
  final Buggys reservation;

  @override
  Widget build(BuildContext context) {
   

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
                title: const Text("Título:"),
                subtitle: Text(reservation.name ?? "")),
            ListTile(
                title: const Text("Descripción:"),
                subtitle: Text(reservation.model ?? "")),
            //ListTile(title: const Text("Registrado:"), subtitle: Text(created)),
           
            
          ],
        ),
      ),
    );
  }
}
