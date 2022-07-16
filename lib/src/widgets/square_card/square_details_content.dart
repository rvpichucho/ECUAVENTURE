import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:ecuaventure/src/widgets/square_card/square_check_reserv.dart';
import 'package:ecuaventure/src/widgets/square_card/square_priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SquareDetailsContentWidget extends StatelessWidget {
  const SquareDetailsContentWidget({Key? key, required this.reservation})
      : super(key: key);
  final Squares reservation;
  @override
  Widget build(BuildContext context) {
    bool isVisible = false;
    //condiciones para mostrar el check
    if (reservation.priority == 3) {
      isVisible = true;
    } else if (reservation.priority == 2) {
      isVisible = false;
    } else if (reservation.priority == 1) {
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
                  child: SquarePriorityWidget(
                      priority: reservation.priority,
                      uid: reservation.idsquare),
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: CheckReservarSquare(uid: reservation.idsquare),
            )
          ],
        ),
      ),
    );
  }
}





/*import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:ecuaventure/src/widgets/square_card/square_check_reserv.dart';
import 'package:ecuaventure/src/widgets/square_card/square_priority.dart';
import 'package:flutter/material.dart';

class SquareDetailsContentWidget extends StatelessWidget {
  const SquareDetailsContentWidget({Key? key, required this.reservation})
      : super(key: key);
  final Squares reservation;

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
                      : SquarePriorityWidget(priority: reservation.prioridad),
                ),
              ),
            ),
            CheckReservarSquare(uid: reservation.idsquare),
            //ListTile(title: const Text("Registrado:"), subtitle: Text(created)),
          ],
        ),
      ),
    );
  }
}*/
