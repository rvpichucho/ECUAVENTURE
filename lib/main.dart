import 'package:ecuaventure/src/pages/login_page.dart';
//import 'package:ecuaventure/src/pages/menu_page.dart';
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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false, //PARA QUITAR EL DEBUG DE LA APP
        title: 'ecuadventure',
        home: LoginPage(),
      ),
    );
  }
}
