import 'package:ecuaventure/src/pages/bike_page.dart';
import 'package:ecuaventure/src/widgets/bike_card/bike_priority.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class BikeCard extends StatelessWidget {
  const BikeCard({Key? key, required this.model}) : super(key: key);
  final Bikes model;

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    final url = model.image!;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ListTile(
        onTap: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BikePage(reservation: model),
            ),
          );
        },
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Stack(
            children: <Widget>[
              Card(
                color: color_const.skyColorC,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: ListTile(
                    title: Center(
                      child: Text(model.name.toString(),
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    subtitle: Column(
                      children: [
                        ListTile(
                          title: const Text('Modelo'),
                          subtitle: Text(model.model.toString()),
                        ),
                        ListTile(
                          title: const Text('Descripción'),
                          subtitle: Text(model.description.toString()),
                        ),
                        ListTile(
                          title: const Text('Estado'),
                          subtitle: model.prioridad == null ||
                                  model.prioridad == 0
                              ? null
                              : BikePriorityWidget(priority: model.prioridad),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FractionalTranslation(
                translation: const Offset(0.0, -0.4),
                child: Align(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(url),
                    backgroundColor: color_const.ligthBlueC,
                  ),
                  alignment: const FractionalOffset(0.5, 0.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
