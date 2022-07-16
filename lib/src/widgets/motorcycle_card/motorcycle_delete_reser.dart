import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CheckDeleteMotorcycle extends StatefulWidget {
  CheckDeleteMotorcycle({Key? key, this.uid}) : super(key: key);
  String? uid;

  @override
  _CheckDeleteMotorcycleState createState() => _CheckDeleteMotorcycleState();
}

class _CheckDeleteMotorcycleState extends State<CheckDeleteMotorcycle> {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('motorcycles');
  bool reservar = false;
  final int valor = 3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.delete,
              style: Theme.of(context).textTheme.subtitle1),
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
