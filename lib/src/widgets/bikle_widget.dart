import 'package:ecuaventure/src/models/bikes_vehicles.dart';
import 'package:ecuaventure/src/services/bike_service.dart';
import 'package:ecuaventure/src/widgets/Card/bike_card.dart';
import 'package:flutter/material.dart';

class BikeWidget extends StatefulWidget {
  const BikeWidget({Key? key}) : super(key: key);

  @override
  _BikeWidgetState createState() => _BikeWidgetState();
}

class _BikeWidgetState extends State<BikeWidget> {
  final ServiceBike _motorcycleService = ServiceBike();
  List<Bikes>? _listBike;

  @override
  void initState() {
    super.initState();
    _downloadContent();
  }

  @override
  Widget build(BuildContext context) {
    if (_listBike == null) {
      return const Center(
        child: SizedBox(
            height: 50.0, width: 50.0, child: CircularProgressIndicator()),
      );
    }
    if (_listBike!.isEmpty) {
      return const Center(
        child: SizedBox(child: Text('No hay datos dentro del servicio')),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
      child: ListView(
        children: _listBike!.map((e) => BikeCard(model: e)).toList(),
      ),
    );
  }

  _downloadContent() {
    _motorcycleService.getBike().then((value) {
      _listBike = value;
      setState(() {});
    });
  }
}
