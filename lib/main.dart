import 'package:ecuaventure/src/components/menu_lateral.dart';
import 'package:ecuaventure/src/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as Colorconst;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //PARA QUITAR EL DEBUG DE LA APP
      title: 'ecuadventure',
      home: Menu(),
    );
  }
}
