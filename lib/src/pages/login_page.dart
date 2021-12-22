import 'package:ecuaventure/src/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:shared_preferences/shared_preferences.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('Ingresar el nombre para que el SharedPreferences guarde el dato ',
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              margin: const EdgeInsets.only(left: 12, right: 12),
              elevation: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person,
                            color: Theme.of(context).primaryColorDark),
                        /*hintText: 'nombre@gmail.com',
                        labelText: 'Ingrese su correro electrónico',*/
                        hintText: 'Nombre Apellido',
                        labelText: 'Ingrese su nombre',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*const SizedBox(height: 25.0),
            Card(
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
            ),*/
            const SizedBox(height: 25.0),
            Container(
              alignment: AlignmentDirectional.center,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin: const EdgeInsets.only(left: 15, right: 15),
                elevation: 4,
                child: MaterialButton(
                  color: color_const.blueC,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    child: const Text(
                      'INGRESAR',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  
                  onPressed: () {
                    saveName();
                    //Navigator.push(context,
                    //MaterialPageRoute(builder: (context) => const Menu()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveName() {
    //var _controller = TextEditingController();
    String name = emailController.text;
    saveNamePreference(name).then((bool commit) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Menu()));
    });
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

Future<bool> saveNamePreference(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<String?> getNamePreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString("name");
  return name;
}
