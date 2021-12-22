import 'package:ecuaventure/src/providers/provider_moto.dart';
import 'package:ecuaventure/src/widgets/super_floatingaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final motoinfo = Provider.of<MotoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(motoinfo.moto),
      ),
      floatingActionButton: const BotonMoto(),
    );
  }
}

Future<bool> saveNamePreference(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  // ignore: deprecated_member_use
  return prefs.commit();
}
