import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/widgets/buggy_card/buggy_card.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class BuggyFirebaseList extends StatefulWidget {
  const BuggyFirebaseList({Key? key}) : super(key: key);

  @override
  State<BuggyFirebaseList> createState() => _BuggyFirebaseListState();
}

class _BuggyFirebaseListState extends State<BuggyFirebaseList> {
  final Stream<QuerySnapshot> _mantenimientoStrem =
      FirebaseFirestore.instance.collection('buggys').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: const Text(
            "Buggys",
            style: TextStyle(
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
              Buggys model =
                  Buggys.fromJson(document.data() as Map<String, dynamic>);
              return BuggyCard(model: model);
            }).toList()),
          );
        },
      ),
    );
  }
}
