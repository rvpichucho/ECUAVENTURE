import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/pages/buggy_page.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class BuggyCard extends StatelessWidget {
  const BuggyCard({Key? key, required this.model}) : super(key: key);
  final Buggys model;

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    final url = model.image!;
            

    return Card(
      elevation: 7,
      child: ListTile(
        onTap: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                 BuggyPage(reservation: model),
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
