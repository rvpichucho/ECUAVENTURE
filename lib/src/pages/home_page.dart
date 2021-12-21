import 'package:ecuaventure/src/widgets/motorcycle_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: const MotorcycleWidget(),
    );
  }
}

class Motos extends StatelessWidget {
  const Motos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title: const Text("Listado de motos")) ,body: const HomePage());
    
  }
}


