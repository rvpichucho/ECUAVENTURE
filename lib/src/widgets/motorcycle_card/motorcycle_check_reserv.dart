import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CheckReservarMotorcycle extends StatefulWidget {
  CheckReservarMotorcycle({Key? key, this.uid}) : super(key: key);
  String? uid;

  @override
  _CheckReservarMotorcycleState createState() =>
      _CheckReservarMotorcycleState();
}

class _CheckReservarMotorcycleState extends State<CheckReservarMotorcycle> {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference collection =
      FirebaseFirestore.instance.collection('motorcycles');
  bool reservar = false;
  bool isVisible = true;
  final int valor = 2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.reserve,
              style: Theme.of(context).textTheme.subtitle1),
          Visibility(
            visible: isVisible,
            child: Checkbox(
              value: reservar,
              onChanged: (bool? value) {
                setState(() {
                  collection
                      .doc(widget.uid)
                      .update({'prioridad': valor, 'iduser': user!.uid});
                  reservar = value!;
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
