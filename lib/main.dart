
import 'package:ecuaventure/src/pages/home_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //PARA QUITAR EL DEBUG DE LA APP
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home:Scaffold(
        appBar:AppBar(title: const Text("Motos")) ,body: const HomePage()),
    
    );
  }
}


  