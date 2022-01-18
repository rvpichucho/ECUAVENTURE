import 'package:ecuaventure/src/models/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class ReservationCard extends StatelessWidget {
  const ReservationCard({Key? key, required this.model}) : super(key: key);
  final Reservation model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          children: <Widget>[
            Card(
              color: color_const.skyColorC,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ListTile(
                  title: Center(
                    child: Text('Final',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  subtitle: Column(
                    children: [
                      ListTile(
                        title: const Text('Horas'),
                        subtitle: Text(model.hour.toString()),
                      ),
                      ListTile(
                        title: const Text('Costo final'),
                        subtitle: Text(model.total.toString() + ' dólares'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
