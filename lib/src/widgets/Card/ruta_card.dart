import 'package:ecuaventure/src/models/ruta_model.dart';
import 'package:ecuaventure/src/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class RutaCard extends StatelessWidget {
  const RutaCard({Key? key, required this.model}) : super(key: key);
  final Ruta model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          children: <Widget>[
            Card(
              color: color_const.skyColorC,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListTile(
                  title: Center(
                    child: Text(model.name.toString(),
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  subtitle: Column(
                    children: [
                      const SizedBox(height: 25.0),
                      Row(
                        children: [
                          Expanded(
                            child: Image(
                              image: NetworkImage(model.image.toString()),
                              height: 140,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      ListTile(
                        title: const Text('Descripción:'),
                        subtitle: Text(model.description.toString()),
                      ),
                      ListTile(
                        leading: Icon(Icons.map_outlined,
                            color: Theme.of(context).primaryColorDark),
                        title: const Text('Ver mapa'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MapaPage()));
                        },
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
