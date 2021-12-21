
//import 'package:ecuaventure/src/pages/home_page.dart';
//import 'package:ecuaventure/src/pages/inicio_page.dart';
import 'package:ecuaventure/src/pages/menu_page.dart';
import 'package:ecuaventure/src/providers/provider_moto.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>MotoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //PARA QUITAR EL DEBUG DE LA APP
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {
          'home':(context)=> const Menu()
        },
       //home:Scaffold(
          //appBar:AppBar(title: const Text("Motos")) ,body: const Menu()),
      
      ),
    );
  }
}



  