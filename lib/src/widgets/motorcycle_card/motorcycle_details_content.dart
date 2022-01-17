import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/widgets/motorcycle_card/motorcycle_check_reserv.dart';
import 'package:ecuaventure/src/widgets/motorcycle_card/motorcycle_priority.dart';
import 'package:flutter/material.dart';

class MotorcycleDetailsContentWidget extends StatelessWidget {
  const MotorcycleDetailsContentWidget({Key? key, required this.reservation})
      : super(key: key);
  final Motorcycles reservation;

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
            ListTile(
              title: const Text('Estado'),
              subtitle: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 50.0),
                child: Center(
                  child: reservation.prioridad == null ||
                          reservation.prioridad == 0
                      ? null
                      : MotorcyclePriorityWidget(
                          priority: reservation.prioridad),
                ),
              ),
            ),
            CheckReservarMotorcycle(uid: reservation.idmotorcycle),

            //ListTile(title: const Text("Registrado:"), subtitle: Text(created)),
          ],
        ),
      ),
    );
  }
}
