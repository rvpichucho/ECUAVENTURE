import 'package:ecuaventure/src/models/motorcycles_vehicles.dart';
import 'package:ecuaventure/src/services/motorcycle_service.dart';
import 'package:ecuaventure/src/widgets/Card/motorcycle_card.dart';
import 'package:flutter/material.dart';

class MotorcycleWidget extends StatefulWidget {
  const MotorcycleWidget({Key? key}) : super(key: key);

  @override
  _MotorcycleWidgetState createState() => _MotorcycleWidgetState();
}

class _MotorcycleWidgetState extends State<MotorcycleWidget> {
  final ServiceMotorcycle _motorcycleService = ServiceMotorcycle();
  List<Motorcycles>? _listMotorcycle;

  @override
  void initState() {
    super.initState();
    _downloadContent();
  }

  @override
  Widget build(BuildContext context) {
    if (_listMotorcycle == null) {
      return const Center(
        child: SizedBox(
            height: 50.0, width: 50.0, child: CircularProgressIndicator()),
      );
    }
    if (_listMotorcycle!.isEmpty) {
      return const Center(
        child: SizedBox(child: Text('No hay datos dentro del servicio')),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
      child: ListView(
        children:
            _listMotorcycle!.map((e) => MotorcyclesCard(model: e)).toList(),
      ),
    );
  }

  _downloadContent() {
    _motorcycleService.getMotorcycle().then((value) {
      _listMotorcycle = value;
      setState(() {});
    });
  }
}
