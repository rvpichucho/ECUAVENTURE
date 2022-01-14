import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/widgets/bike_card/bike_card.dart';
import 'package:flutter/material.dart';

class BikeFirebaseList extends StatefulWidget {
  const BikeFirebaseList({Key? key}) : super(key: key);

  @override
  State<BikeFirebaseList> createState() =>
      _BikeFirebaseListState();
}

class _BikeFirebaseListState
    extends State<BikeFirebaseList> {
  final Stream<QuerySnapshot> _mantenimientoStrem =
      FirebaseFirestore.instance.collection('bikes').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _mantenimientoStrem,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child:
                SizedBox(child: Text('Error al consultar los mantenimientos.')),
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
            Bikes model =
                Bikes.fromJson(document.data() as Map<String, dynamic>);
            return BikeCard(model: model);
          }).toList()),
        );
      },
    );
  }
}
