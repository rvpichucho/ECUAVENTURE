import 'package:ecuaventure/src/widgets/Card/fotos_datos_card.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class FotoPage extends StatelessWidget {
  const FotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: const Text(
            'Fotos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const ListDataFoto(),
    );
  }
}
