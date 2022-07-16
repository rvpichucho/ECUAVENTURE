import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/ruta_model.dart';
import 'package:ecuaventure/src/widgets/Card/ruta_card.dart';
import 'package:flutter/material.dart';

class RutaFirebaseList extends StatefulWidget {
  const RutaFirebaseList({Key? key}) : super(key: key);

  @override
  State<RutaFirebaseList> createState() => _RutaFirebaseListState();
}

class _RutaFirebaseListState extends State<RutaFirebaseList> {
  final Stream<QuerySnapshot> _rutaslist =
      FirebaseFirestore.instance.collection('routes').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _rutaslist,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(child: Text('Error al consultar rutas sugeridad.')),
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
            Ruta model = Ruta.fromJson(document.data() as Map<String, dynamic>);
            return RutaCard(model: model);
          }).toList()),
        );
      },
    );
  }
}
