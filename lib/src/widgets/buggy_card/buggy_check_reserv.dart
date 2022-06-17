import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CheckReservarBuggy extends StatefulWidget {
  CheckReservarBuggy({Key? key, this.uid}) : super(key: key);
  String? uid;

  @override
  _CheckReservarBuggyState createState() => _CheckReservarBuggyState();
}

class _CheckReservarBuggyState extends State<CheckReservarBuggy> {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('buggys');
  bool reservar = false;
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
