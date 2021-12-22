import 'package:ecuaventure/src/models/buggys_vehicles.dart';
import 'package:ecuaventure/src/services/buggy_service.dart';
import 'package:ecuaventure/src/widgets/Card/buggy_card.dart';
import 'package:flutter/material.dart';

class BuggyWidget extends StatefulWidget {
  const BuggyWidget({Key? key}) : super(key: key);

  @override
  _BuggyWidgetState createState() => _BuggyWidgetState();
}

class _BuggyWidgetState extends State<BuggyWidget> {
  final ServiceBuggy _buggyService = ServiceBuggy();
  List<Buggys>? _listBuggy;

  @override
  void initState() {
    super.initState();
    _downloadContent();
  }

  @override
  Widget build(BuildContext context) {
    if (_listBuggy == null) {
      return const Center(
        child: SizedBox(
            height: 50.0, width: 50.0, child: CircularProgressIndicator()),
      );
    }
    if (_listBuggy!.isEmpty) {
      return const Center(
        child: SizedBox(child: Text('No hay datos dentro del servicio')),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
      child: ListView(
        children: _listBuggy!.map((e) => BuggyCard(model: e)).toList(),
      ),
    );
  }

  _downloadContent() {
    _buggyService.getBuggy().then((value) {
      _listBuggy = value;
      setState(() {});
    });
  }
}
