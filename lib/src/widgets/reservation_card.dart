import 'package:ecuaventure/src/models/reservation_model.dart';
import 'package:ecuaventure/src/pages/ruta_page.dart';
import 'package:ecuaventure/src/widgets/check_entrega_reserv.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReservationCard extends StatefulWidget {
  const ReservationCard({Key? key, required this.model}) : super(key: key);
  final Reservation model;

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  String mensajeEntregar = '';

  @override
  Widget build(BuildContext context) {
    bool isVisible = false;
    //condiciones para mostrar mensaje de estado de reservacion
    if (widget.model.state == 1) {
      mensajeEntregar = 'Entregar';
      isVisible = true;
    } else if (widget.model.state == 2) {
      mensajeEntregar = 'Entregado';
      isVisible = false;
    }

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
                    child: Text(
                        AppLocalizations.of(context)!.detail_reservation,
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.hour),
                        subtitle: Text(widget.model.hour!.toString()),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.cost),
                        subtitle: Text(widget.model.totalValue.toString() +
                            ' ' +
                            AppLocalizations.of(context)!.dollar),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.date),
                        subtitle: Text(widget.model.date.toString()),
                      ),
                      ListTile(
                        title: const Text("Vehículos"),
                        subtitle: Text(widget.model.vehicles
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", "")),
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
                      const ListTile(
                        title: Text("Estado"),
                      ),
                      Text(mensajeEntregar.toString(),
                          style: Theme.of(context).textTheme.subtitle1),
                      Visibility(
                        visible: isVisible,
                        child: CheckEntregaReservacion(
                            uid: widget.model.idreservation),
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
