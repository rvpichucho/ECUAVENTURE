import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/user_model.dart';
import 'package:ecuaventure/src/pages/reservation_page.dart';
import 'package:ecuaventure/src/providers/provider_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CuentaPage extends StatefulWidget {
  const CuentaPage({Key? key}) : super(key: key);

  @override
  State<CuentaPage> createState() => _CuentaPageState();
}

class _CuentaPageState extends State<CuentaPage> {
  User? user = FirebaseAuth.instance.currentUser;
  Usuario _model = Usuario();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      _model = Usuario.fromMap(value.data());
      setState(() {});
    });
  }

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
                child: const Text(
                  "Mi Cuenta",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
              SizedBox(
                child: Card(
                  child: ListTile(
                    leading: Text(
                      "${_model.displayName}",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    trailing: Text(
                      "${_model.email}",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
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
              SizedBox(
                child: Card(
                  child: ListTile(
                    title: const Text("Mis Reservaciones"),
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ReservationPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 120.0),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: color_const.blueC,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 16.0),
                  child: const Text(
                    "Salir",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _avatar() {
    return Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: color_const.blueC),
        child: ClipOval(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              // ignore: unnecessary_string_interpolations
              "${_model.displayName.toString().substring(0, 1)}",
              style: const TextStyle(
                fontSize: 50.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
