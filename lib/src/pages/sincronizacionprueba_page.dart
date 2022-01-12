import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/widgets/Card/sincronizacion_prueba.dart';
import 'package:flutter/material.dart';

class PruebaPage extends StatefulWidget {
  const PruebaPage({Key? key}) : super(key: key);

  @override
  _PruebaPageState createState() => _PruebaPageState();
}

class _PruebaPageState extends State<PruebaPage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference bikes = FirebaseFirestore.instance.collection('bikes');
    return Scaffold(
      body: Sincro(currentMotocycle: bikes),
    );
  }
}
