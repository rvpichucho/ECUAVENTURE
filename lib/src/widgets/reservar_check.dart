import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class CheckReservar extends StatefulWidget {
  CheckReservar({Key? key, this.uid}) : super(key: key);
  String? uid;
  @override
  _CheckReservarState createState() => _CheckReservarState();
}

class _CheckReservarState extends State<CheckReservar> {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('squares');
  bool reservar = false;
  final int valor = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Reservar", style: Theme.of(context).textTheme.subtitle1),
          Checkbox(
            value: reservar,
            onChanged: (bool? value) {
              setState(() {
                collection.doc(widget.uid).update({'prioridad': valor});
                reservar = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
