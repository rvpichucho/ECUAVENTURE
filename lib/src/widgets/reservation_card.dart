import 'package:ecuaventure/src/models/reservation_model.dart';
import 'package:ecuaventure/src/pages/ruta_page.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ReservationCard extends StatelessWidget {
  const ReservationCard({Key? key, required this.model}) : super(key: key);
  final Reservation model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          children: <Widget>[
            Card(
              color: color_const.skyColorC,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListTile(
                  title: Center(
                    child: Text(AppLocalizations.of(context)!.detail_reservation,
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  subtitle: Column(
                    children: [
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.hour),
                        subtitle: Text(model.hour.toString()),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.cost),
                        subtitle: Text(model.total.toString() + ' ' +AppLocalizations.of(context)!.dollar),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.date),
                        subtitle: Text(model.fecha.toString()),
                      ),
                      ListTile(
                        leading: Icon(Icons.alt_route_outlined,
                            color: Theme.of(context).primaryColorDark),
                        title: Text(AppLocalizations.of(context)!.route),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RutaPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
