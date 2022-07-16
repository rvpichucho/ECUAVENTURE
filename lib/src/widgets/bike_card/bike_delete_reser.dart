import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CheckDeleteBike extends StatefulWidget {
  CheckDeleteBike({Key? key, this.uid}) : super(key: key);
  String? uid;

  @override
  _CheckDeleteBikeState createState() => _CheckDeleteBikeState();
}

class _CheckDeleteBikeState extends State<CheckDeleteBike> {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('bikes');
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
