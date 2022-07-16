import 'package:ecuaventure/bloc/login_bloc.dart';
import 'package:ecuaventure/src/pages/home_page.dart';
import 'package:ecuaventure/src/widgets/language_picker_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc bloc;
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  String? errorMessage;
  bool _obscureText = true;

  @override
  void initState() {
    bloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //email field

    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.email_outlined,
            color: Theme.of(context).primaryColorDark),
        hintText: 'usuario@usuario.com',
        labelText: AppLocalizations.of(context)!.email,
        //labelText: AppLocalizations.of(context)!.name,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return (AppLocalizations.of(context)!.email);
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return (AppLocalizations.of(context)!.valido);
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    // password field
    final passwordField = StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) => TextFormField(
        autofocus: false,
        obscureText: _obscureText,
        onChanged: bloc.changePassword,
        controller: passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: IconButton(
              onPressed: () {
                _obscureText = !_obscureText;
                setState(() {});
              },
              icon: _obscureText
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          errorText: snapshot.error?.toString(),
          icon: Icon(Icons.lock_outline,
              color: Theme.of(context).primaryColorDark),
          labelText: AppLocalizations.of(context)!.password,
        ),
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return (AppLocalizations.of(context)!.password);
          }
          if (!regex.hasMatch(value)) {
            return (AppLocalizations.of(context)!.password_valid);
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
      ),
    );

    //boton login
    final loginButton = MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: color_const.blueC,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Text(
          AppLocalizations.of(context)!.sing_in,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      onPressed: () {
        signIn(emailController.text, passwordController.text);
      },
    );

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return ListView(
            padding: const EdgeInsets.only(top: 10),
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
              Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(children: [
                      //AUI ES DONDE CAMBIA EL IDIOMA
                      AppBar(
                        title: const Text("Idiomas"),
                        centerTitle: true,
                        actions: const [
                          LanguagePickerWidget(),
                          SizedBox(width: 12),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(AppLocalizations.of(context)!.language,
                            style: Theme.of(context).textTheme.headline3),
                      ),
                      const SizedBox(height: 25.0),
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        elevation: 4,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: emailField,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),

                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        elevation: 4,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: passwordField,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      loginButton,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.account),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/singUp");
                              },
                              child:
                                  Text(AppLocalizations.of(context)!.register)),
                        ],
                      ),
                      //DISEÑO PARA VER CUANDO SE CAMBIA DE IDIOMA
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        elevation: 4,
                        child: Column(children: <Widget>[
                          const LanguageWidget(),
                          const SizedBox(height: 32),
                          Text(
                            AppLocalizations.of(context)!.language,
                            style: const TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context)!.helloWorld,
                            style: const TextStyle(fontSize: 36),
                          ),
                        ]),
                      ),
                      const SizedBox(height: 25.0),
                    ]),
                  )),
            ],
          );
        },
      ),
    );
  }

  // funcion para iniciar sesion
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!.exitoso),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = AppLocalizations.of(context)!.valido;

            break;
          case "wrong-password":
            errorMessage = AppLocalizations.of(context)!.password_required;
            break;
          case "user-not-found":
            errorMessage = AppLocalizations.of(context)!.noexiste;
            break;
          case "user-disabled":
            errorMessage = AppLocalizations.of(context)!.deshabilitado;
            break;
          case "too-many-requests":
            errorMessage = AppLocalizations.of(context)!.solicitudes;
            break;
          case "operation-not-allowed":
            errorMessage = AppLocalizations.of(context)!.empawnohab;
            break;
          default:
            errorMessage = AppLocalizations.of(context)!.errorindefinido;
        }
        Fluttertoast.showToast(msg: errorMessage!);
        // ignore: avoid_print
        print(error.code);
      }
    }
  }
}

/*void saveName() {
    //var _controller = TextEditingController();
    String name = emailController.text;
    saveNamePreference(name).then((bool commit) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }*/

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

/*Future<bool> saveNamePreference(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  // ignore: deprecated_member_use
  return prefs.commit();
}

Future<String?> getNamePreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString("name");
  return name;
}*/
