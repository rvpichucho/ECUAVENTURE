import 'package:ecuaventure/src/widgets/reservacion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class DetailsReservationPage extends StatefulWidget {
  const DetailsReservationPage({Key? key}) : super(key: key);

  @override
  _DetailsReservationPageState createState() => _DetailsReservationPageState();
}

class _DetailsReservationPageState extends State<DetailsReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.reservationD,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const ReservacionWidget(),
    );
  }
}
