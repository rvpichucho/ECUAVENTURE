import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/widgets/buggy_card/buggy_check_reserv.dart';
import 'package:ecuaventure/src/widgets/buggy_card/buggy_priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuggyDetailsContentWidget extends StatelessWidget {
  const BuggyDetailsContentWidget({Key? key, required this.reservation})
      : super(key: key);
  final Buggys reservation;

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
                  child:
                      reservation.priority == null || reservation.priority == 0
                          ? null
                          : BuggyPriorityWidget(
                              priority: reservation.priority,
                              uid: reservation.idbuggy),
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: CheckReservarBuggy(uid: reservation.idbuggy),
            ),
          ],
        ),
      ),
    );
  }
}
