import 'package:ecuaventure/src/widgets/Card/sincronizacion_prueba.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: const Text(
            'Reservación Completa',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const MantenimientosFirebaseList(),
    );
  }
}
