import 'package:ecuaventure/src/widgets/buggy_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;

class BuggyPage extends StatefulWidget {
  const BuggyPage({Key? key}) : super(key: key);

  @override
  _BuggyPageState createState() => _BuggyPageState();
}

class _BuggyPageState extends State<BuggyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: color_const.blueC,
          centerTitle: true,
          title: const Text(
            "Buggys",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
      body: const BuggyWidget(),
    );
  }
}
