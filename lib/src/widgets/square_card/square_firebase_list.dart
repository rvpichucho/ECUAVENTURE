import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:ecuaventure/src/widgets/square_card/square_card.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SquareFirebaseList extends StatefulWidget {
  const SquareFirebaseList({Key? key}) : super(key: key);

  @override
  State<SquareFirebaseList> createState() => _SquareFirebaseListState();
}

class _SquareFirebaseListState extends State<SquareFirebaseList> {
  final Stream<QuerySnapshot> _mantenimientoStrem =
      FirebaseFirestore.instance.collection('squares').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.quad,
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
              child: SizedBox(
                  child: Text('Error al consultar los mantenimientos.')),
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
              Squares model =
                  Squares.fromJson(document.data() as Map<String, dynamic>);
              return SquareCard(model: model);
            }).toList()),
          );
        },
      ),
    );
  }
}
