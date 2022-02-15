import 'package:ecuaventure/bloc/login_bloc.dart';
import 'package:ecuaventure/src/pages/home_page.dart';
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

  // string for displaying the error Message
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
        labelText: 'Ingrese su correro electrónico',
        //labelText: AppLocalizations.of(context)!.name,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Se requiere el correro electrónico");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("El correo electrónico no es válido");
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
          labelText: 'Ingrese su contraseña',
        ),
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Se requiere la contraseña");
          }
          if (!regex.hasMatch(value)) {
            return ("La contraseña debe tener al menos 5 caracteres");
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
                          const Text("¿No tiene una cuenta?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/singUp");
                              },
                              child: const Text("Registrarse")),
                        ],
                      ),
                    ]),
                  )),
            ],
          );
        },
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
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
