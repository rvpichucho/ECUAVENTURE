import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';

import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({Key? key, required this.model}) : super(key: key);
  final Motorcycles model;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(80, 10, 25, 0),
              title:
                  Text(model.color ?? "", style: const TextStyle(fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Name:", style: TextStyle(fontSize: 24)),
                Text(model.name ?? "", style: const TextStyle(fontSize: 20))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
