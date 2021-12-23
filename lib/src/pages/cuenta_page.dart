import 'package:ecuaventure/src/providers/provider_menu.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CuentaPage extends StatelessWidget {
  String title;
  CuentaPage({Key? key, this.title = "Mi Cuenta"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _avatar(),
                  Container(
                    width: 335.0,
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              const SizedBox(
                height: 100,
                child: Card(
                  child: ListTile(
                    title: Text("username"),
                    subtitle: Text("usuario@gmail.com"),
                  ),
                ),
              ),
              SizedBox.square(
                child: Card(
                  child: ListTile(
                    title: const Text("Modo Oscuro"),
                    trailing: Switch(
                        activeColor: color_const.blueC,
                        value: mainProvider.mode,
                        onChanged: (bool value) async {
                          mainProvider.mode = value;
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool("mode", value);
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_avatar() {
  return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0), color: color_const.blueC),
      child: const ClipOval(
          child: Icon(
        Icons.person,
        color: Colors.white,
        size: 50,
      )));
}
