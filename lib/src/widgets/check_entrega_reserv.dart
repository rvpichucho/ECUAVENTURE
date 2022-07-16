import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/models/reservation_model.dart';
import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckEntregaReservacion extends StatefulWidget {
  CheckEntregaReservacion({Key? key, this.uid}) : super(key: key);
  String? uid;

  @override
  State<CheckEntregaReservacion> createState() =>
      _CheckEntregaReservacionState();
}

class _CheckEntregaReservacionState extends State<CheckEntregaReservacion> {
  //ocultar check entregar
  bool entregar = false;
  bool isVisible = true;
  //variables para actualizar prioridad
  Bikes bike = Bikes();
  Buggys buggy = Buggys();
  Motorcycles motorcycle = Motorcycles();
  Squares square = Squares();
  Reservation reservation = Reservation();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Text("Entregar", style: Theme.of(context).textTheme.subtitle1),
          Visibility(
            visible: isVisible,
            child: Checkbox(
              value: entregar,
              onChanged: (bool? value) {
                setState(() {
                  //consultas para actualizar estado de los vehiculos a reservado
                  //bikes
                  CollectionReference updateBike =
                      FirebaseFirestore.instance.collection('bikes');
                  updateBike
                      .where('iduser', isEqualTo: user!.uid)
                      .where('priority', isEqualTo: 1)
                      .get()
                      .then((querySnapshot) {
                    for (var doc in querySnapshot.docs) {
                      // doc.data() is never undefined for query doc snapshots
                      bike = Bikes.fromJson(doc.data() as Map<String, dynamic>);
                      updateBike
                          .doc(bike.idbike)
                          .update({'priority': 3, 'iduser': ''});
                    }
                  });
                  //buggys
                  CollectionReference updateBuggys =
                      FirebaseFirestore.instance.collection('buggys');
                  updateBuggys
                      .where('iduser', isEqualTo: user!.uid)
                      .where('priority', isEqualTo: 1)
                      .get()
                      .then((querySnapshot) {
                    for (var doc in querySnapshot.docs) {
                      // doc.data() is never undefined for query doc snapshots
                      buggy =
                          Buggys.fromJson(doc.data() as Map<String, dynamic>);
                      updateBuggys
                          .doc(buggy.idbuggy)
                          .update({'priority': 3, 'iduser': ''});
                    }
                  });
                  //motos
                  CollectionReference updateMotorcycles =
                      FirebaseFirestore.instance.collection('motorcycles');
                  updateMotorcycles
                      .where('iduser', isEqualTo: user!.uid)
                      .where('priority', isEqualTo: 1)
                      .get()
                      .then((querySnapshot) {
                    for (var doc in querySnapshot.docs) {
                      // doc.data() is never undefined for query doc snapshots
                      motorcycle = Motorcycles.fromJson(
                          doc.data() as Map<String, dynamic>);
                      updateMotorcycles
                          .doc(motorcycle.idmotorcycle)
                          .update({'priority': 3, 'iduser': ''});
                    }
                  });
                  //squares
                  CollectionReference updateSquares =
                      FirebaseFirestore.instance.collection('squares');
                  updateSquares
                      .where('iduser', isEqualTo: user!.uid)
                      .where('priority', isEqualTo: 1)
                      .get()
                      .then((querySnapshot) {
                    for (var doc in querySnapshot.docs) {
                      // doc.data() is never undefined for query doc snapshots
                      square =
                          Squares.fromJson(doc.data() as Map<String, dynamic>);
                      updateSquares
                          .doc(square.idsquare)
                          .update({'priority': 3, 'iduser': ''});
                    }
                  });
                  //reservaciones
                  CollectionReference updateReservacion =
                      FirebaseFirestore.instance.collection('reservations');
                  updateReservacion.doc(widget.uid).update({'state': 2});

                  //cambiar el estado
                  entregar = value!;
                  isVisible = !value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
