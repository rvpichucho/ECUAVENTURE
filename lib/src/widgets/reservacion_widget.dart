import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/pages/reservation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class ReservacionWidget extends StatefulWidget {
  const ReservacionWidget({Key? key}) : super(key: key);

  @override
  _ReservacionWidgetState createState() => _ReservacionWidgetState();
}

class _ReservacionWidgetState extends State<ReservacionWidget> {
  CollectionReference derailsReservation =
      FirebaseFirestore.instance.collection('reservations');

  final hour = TextEditingController();
  DateTime date = DateTime.now();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    hour.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
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
                      textInputAction: TextInputAction.next,
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
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text("Ingresar la fecha",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  DatePickerWidget(
                      lastDate: DateTime.now().add(const Duration(days: 90)),
                      looping: false, // default is not looping
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DatePicker.localeFromString('es'),
                      onChange: (DateTime newDate, _) {
                        date = newDate;
                      }),
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
                    _confirmar(context, hour.text, date);
                    hour.clear();
                    //date.clear();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _confirmar(BuildContext context, String hora, DateTime fecha) {
    var num = int.parse(hora) * 3;
    String num1 = num.toString();
    Widget okButton = TextButton(
      child: const Text("Guardar"),
      onPressed: () {
        derailsReservation.add({
          'iduser': user!.uid,
          'hour': hora,
          'total': num1,
          'fecha': fecha.toString(),
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
