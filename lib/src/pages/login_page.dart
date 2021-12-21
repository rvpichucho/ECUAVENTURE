import 'package:ecuaventure/src/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as Colorconst;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 0),
            children: <Widget>[
              SafeArea(child: Container(height: 30.0)),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _avatar(),
                  Container(
                    width: 335.0,
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('Iniciar sesión',
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  const SizedBox(height: 25.0),
                  const EmailPaswordForm(),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}

class EmailPaswordForm extends StatefulWidget {
  const EmailPaswordForm({Key? key}) : super(key: key);

  @override
  _EmailPaswordFormState createState() => _EmailPaswordFormState();
}

class _EmailPaswordFormState extends State<EmailPaswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin: const EdgeInsets.only(left: 12, right: 12),
                elevation: 4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.email,
                              color: Theme.of(context).primaryColorDark),
                          hintText: 'nombre@gmail.com',
                          labelText: 'Ingrese su correro electrónico',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            Container(
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin: const EdgeInsets.only(left: 15, right: 15),
                elevation: 4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.lock_outline,
                              color: Theme.of(context).primaryColorDark),
                          labelText: 'Ingrese su contraseña',
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            Container(
              alignment: AlignmentDirectional.center,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin: const EdgeInsets.only(left: 15, right: 15),
                elevation: 4,
                child: MaterialButton(
                  color: Colorconst.BLUE,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    child: const Text(
                      'INGRESAR',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Menu()));
                  },
                ),
              ),
            ),
          ],
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
          borderRadius: BorderRadius.circular(100.0), color: Colorconst.BLUE),
      child: const ClipOval(
          child: Icon(
        Icons.person,
        color: Colors.white,
        size: 50,
      )));
}
