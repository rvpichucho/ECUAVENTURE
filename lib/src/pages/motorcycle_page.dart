import 'package:ecuaventure/src/widgets/motorcycle_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class MotorcyclePage extends StatefulWidget {
  const MotorcyclePage({Key? key}) : super(key: key);

  @override
  _MotorcyclePageState createState() => _MotorcyclePageState();
}

class _MotorcyclePageState extends State<MotorcyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: const Text(
            "Motos",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const MotorcycleWidget(),
    );
  }
}
