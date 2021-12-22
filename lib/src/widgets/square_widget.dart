import 'package:ecuaventure/src/models/squares_vehicles.dart';
import 'package:ecuaventure/src/services/square_service.dart';
import 'package:ecuaventure/src/widgets/Card/square_card.dart';
import 'package:flutter/material.dart';

class SquareWidget extends StatefulWidget {
  const SquareWidget({Key? key}) : super(key: key);

  @override
  _SquareWidgetState createState() => _SquareWidgetState();
}

class _SquareWidgetState extends State<SquareWidget> {
  final ServiceSquare _squareService = ServiceSquare();
  List<Squares>? _listSquare;

  @override
  void initState() {
    super.initState();
    _downloadContent();
  }

  @override
  Widget build(BuildContext context) {
    if (_listSquare == null) {
      return const Center(
        child: SizedBox(
            height: 50.0, width: 50.0, child: CircularProgressIndicator()),
      );
    }
    if (_listSquare!.isEmpty) {
      return const Center(
        child: SizedBox(child: Text('No hay datos dentro del servicio')),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
      child: ListView(
        children: _listSquare!.map((e) => SquareCard(model: e)).toList(),
      ),
    );
  }

  _downloadContent() {
    _squareService.getSquare().then((value) {
      _listSquare = value;
      setState(() {});
    });
  }
}
