import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class CheckDeleteSquare extends StatefulWidget {
  CheckDeleteSquare({Key? key, this.uid}) : super(key: key);
  String? uid;

  @override
  _CheckDeleteSquareState createState() => _CheckDeleteSquareState();
}

class _CheckDeleteSquareState extends State<CheckDeleteSquare> {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('squares');
  bool reservar = false;
  final int valor = 3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Borrar", style: Theme.of(context).textTheme.subtitle1),
          Checkbox(
            value: reservar,
            onChanged: (bool? value) {
              setState(() {
                collection
                    .doc(widget.uid)
                    .update({'priority': valor, 'iduser': ''});
                reservar = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
