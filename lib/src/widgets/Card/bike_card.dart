import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter/material.dart';

class BikeCard extends StatelessWidget {
  const BikeCard({Key? key, required this.model}) : super(key: key);
  final Bikes model;
  @override
  Widget build(BuildContext context) {
    //final url=model.image!;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
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
                    ],
                  ),
                ),
              ),
            ),
            const FractionalTranslation(
              translation: Offset(0.0, -0.4),
              child: Align(
                child: CircleAvatar(
                  radius: 50.0,
                  //backgroundImage: AssetImage('assets/Destacado.png'),
                  backgroundImage:NetworkImage("https://moto.suzuki.es/assets/images/listado_motos/2021/GSX-S1000%20GT/GSX-S1000GT_M2_YSF_Right%20(1).jpg"),
                  backgroundColor: color_const.ligthBlueC,
                ),
                alignment: FractionalOffset(0.5, 0.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
