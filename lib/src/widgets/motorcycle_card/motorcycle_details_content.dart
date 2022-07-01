import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/widgets/motorcycle_card/motorcycle_check_reserv.dart';
import 'package:ecuaventure/src/widgets/motorcycle_card/motorcycle_priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MotorcycleDetailsContentWidget extends StatelessWidget {
  const MotorcycleDetailsContentWidget({Key? key, required this.reservation})
      : super(key: key);
  final Motorcycles reservation;

  @override
  Widget build(BuildContext context) {
    bool isVisible = false;
    //condiciones para mostrar el check
    if (reservation.prioridad == 3) {
      isVisible = true;
    } else if (reservation.prioridad == 2) {
      isVisible = false;
    } else if (reservation.prioridad == 1) {
      isVisible = false;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
                title: Text(AppLocalizations.of(context)!.model),
                subtitle: Text(reservation.model ?? "")),
            ListTile(
                title: Text(AppLocalizations.of(context)!.description),
                subtitle: Text(reservation.description ?? "")),
            ListTile(
              title: Text(AppLocalizations.of(context)!.state),
              subtitle: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 50.0),
                child: Center(
                  child: reservation.prioridad == null ||
                          reservation.prioridad == 0
                      ? null
                      : MotorcyclePriorityWidget(
                          priority: reservation.prioridad,
                          uid: reservation.idmotorcycle),
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: CheckReservarMotorcycle(uid: reservation.idmotorcycle),
            ),
          ],
        ),
      ),
    );
  }
}
