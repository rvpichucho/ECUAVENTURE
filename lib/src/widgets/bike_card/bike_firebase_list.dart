import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/widgets/bike_card/bike_card.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BikeFirebaseList extends StatefulWidget {
  const BikeFirebaseList({Key? key}) : super(key: key);

  @override
  State<BikeFirebaseList> createState() => _BikeFirebaseListState();
}

class _BikeFirebaseListState extends State<BikeFirebaseList> {
  final Stream<QuerySnapshot> _mantenimientoStrem =
      FirebaseFirestore.instance.collection('bikes').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.bicycles,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: StreamBuilder<QuerySnapshot>(
        stream: _mantenimientoStrem,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child:
                  SizedBox(child: Text('Error al consultar los bicicletas.')),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator()),
            );
          }

          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
            child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Bikes model =
                  Bikes.fromJson(document.data() as Map<String, dynamic>);
              return BikeCard(model: model);
            }).toList()),
          );
        },
      ),
    );
  }
}
