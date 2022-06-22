import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/reservation_model.dart';
import 'package:ecuaventure/src/widgets/reservation_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MantenimientosFirebaseList extends StatefulWidget {
  const MantenimientosFirebaseList({Key? key}) : super(key: key);

  @override
  State<MantenimientosFirebaseList> createState() =>
      _MantenimientosFirebaseListState();
}

class _MantenimientosFirebaseListState
    extends State<MantenimientosFirebaseList> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(Object context) {
    final Stream<QuerySnapshot> _mantenimientoStrem = FirebaseFirestore.instance
        .collection('reservations')
        .where('iduser', isEqualTo: user!.uid)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _mantenimientoStrem,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child:
                SizedBox(child: Text('Error al consultar los reservaciones.')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
          child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Reservation model =
                Reservation.fromJson(document.data() as Map<String, dynamic>);
            return ReservationCard(model: model);
          }).toList()),
        );
      },
    );
  }
}
