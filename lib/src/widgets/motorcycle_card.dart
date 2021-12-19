import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';

import 'package:flutter/material.dart';

class MotorcyclesCard extends StatelessWidget {
  const MotorcyclesCard({Key? key,required this.model}) : super(key: key);
  final Motorcycles model;
  @override
  Widget build(BuildContext context) {
    //final url=model.thumb!;
    var textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5.0),
        ),
      child:  IntrinsicHeight(
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             Container(
              margin: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10.0),
              child:  const CircleAvatar(
                backgroundImage:  AssetImage(
                  'assets/Destacado.png'
                ),
                radius: 30.0,
              ),
            ),
            Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(model.name ?? ""),
                  Text(model.model?? ""),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                child: const Icon(Icons.play_arrow, size: 40.0),
                onTap: () {
                  // TODO(implement)
                },
              ),
            ),
           Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.favorite, size: 25.0),
                    Text(""),
                  ],
                ),
                onTap: () {
                  // TODO(implement)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  
