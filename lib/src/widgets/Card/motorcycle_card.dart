import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:ecuaventure/src/widgets/motorcycle_card/motorcycle_delete_reser.dart';
import 'package:ecuaventure/src/widgets/motorcycle_card/motorcycle_priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MotorcyclesCard extends StatelessWidget {
  const MotorcyclesCard({Key? key, required this.model}) : super(key: key);
  final Motorcycles model;
  @override
  Widget build(BuildContext context) {
    final url = model.image!;
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
                        title: Text(AppLocalizations.of(context)!.model),
                        subtitle: Text(model.model.toString()),
                      ),
                      /*ListTile(
                        title: const Text('Descripción'),
                        subtitle: Text(model.description.toString()), 
                      ),*/
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.precio),
                        subtitle: Text(model.price.toString() +
                            ' ' +
                            AppLocalizations.of(context)!.pagos),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.state),
                        subtitle: model.priority == null || model.priority == 0
                            ? null
                            : MotorcyclePriorityWidget(
                                priority: model.priority,
                                uid: model.idmotorcycle),
                      ),
                      CheckDeleteMotorcycle(uid: model.idmotorcycle),
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
    );
  }
}
