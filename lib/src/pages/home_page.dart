import 'package:ecuaventure/src/widgets/motorcycle_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
    CollectionReference motorcycles =
        FirebaseFirestore.instance.collection('motorcycles');
    // ignore: avoid_print
    print(motorcycles);
    return Scaffold(
        body: ListView(
      children: [
        //CarCard(model:e),
      ],
    ));
  }
}
