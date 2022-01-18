import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/reservation_model.dart';
import 'package:ecuaventure/src/pages/reservation_page.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReservacionWidget extends StatefulWidget {
  const ReservacionWidget({Key? key}) : super(key: key);

  @override
  _ReservacionWidgetState createState() => _ReservacionWidgetState();
}

class _ReservacionWidgetState extends State<ReservacionWidget> {
  CollectionReference derailsReservation =
      FirebaseFirestore.instance.collection('reservations');

  final hour = TextEditingController();
  final date = TextEditingController();
  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    hour.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              margin: const EdgeInsets.only(left: 12, right: 12),
              elevation: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.schedule_outlined,
                            color: Theme.of(context).primaryColorDark),
                        labelText: AppLocalizations.of(context)!.rentalHours,
                      ),
                      controller: hour,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              margin: const EdgeInsets.only(left: 12, right: 12),
              elevation: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.insert_invitation_outlined,
                            color: Theme.of(context).primaryColorDark),
                        labelText: 'Ingrese la fecha de reservación',
                      ),
                      controller: date,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            Container(
              alignment: AlignmentDirectional.center,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin: const EdgeInsets.only(left: 15, right: 15),
                elevation: 4,
                child: MaterialButton(
                  color: color_const.blueC,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    child: Text(
                      AppLocalizations.of(context)!.confirm,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  onPressed: () {
                    _confirmar(context, hour.text, date.text);
                    hour.clear();
                    date.clear();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _confirmar(BuildContext context, String hora, String fecha) {
    var num = int.parse(hora) * 3;
    String num1 = num.toString();
    Widget okButton = TextButton(
      child: const Text("Guardar"),
      onPressed: () {
        derailsReservation.add({
          'hour': hora,
          'total': num1,
          'fecha': fecha,
        });
        Navigator.of(context).pop();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ReservationPage()));
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Total a pagar"),
      content: Text(num1 + ' dólares'),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
