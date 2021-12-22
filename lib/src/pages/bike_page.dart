import 'package:ecuaventure/src/widgets/bikle_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class BikePage extends StatefulWidget {
  const BikePage({Key? key}) : super(key: key);

  @override
  _BikePageState createState() => _BikePageState();
}

class _BikePageState extends State<BikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: const Text(
            "Bicicletas",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const BikeWidget(),
    );
  }
}
