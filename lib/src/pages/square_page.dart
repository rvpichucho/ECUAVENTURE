import 'package:ecuaventure/src/widgets/square_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SquarePage extends StatefulWidget {
  const SquarePage({Key? key}) : super(key: key);

  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: Text(
              AppLocalizations.of(context)!.quad,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const SquareWidget(),
    );
  }
}
