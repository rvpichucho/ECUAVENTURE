import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/bloc/login_bloc.dart';
import 'package:ecuaventure/src/models/user_model.dart';
import 'package:ecuaventure/src/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late LoginBloc bloc;
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final displayNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  bool _obscureText = true;

  @override
  void initState() {
    bloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //display name field
    final displayNameField = TextFormField(
      keyboardType: TextInputType.name,
      autofocus: false,
      controller: displayNameEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.person, color: Theme.of(context).primaryColorDark),
        hintText: AppLocalizations.of(context)!.name,
        //labelText: AppLocalizations.of(context)!.name,
      ),
      validator: (value) {
        RegExp regex = RegExp(r'^.{10,}$');
        if (value!.isEmpty) {
          return (AppLocalizations.of(context)!.name);
        }
        if (!regex.hasMatch(value)) {
          return (AppLocalizations.of(context)!.namecarac);
        }
        return null;
      },
      onSaved: (value) {
        displayNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    //email field
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailEditingController,
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
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return (AppLocalizations.of(context)!.valido);
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
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
        controller: passwordEditingController,
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
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
      ),
    );

    //boton sing up
    final singUpButton = MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: color_const.blueC,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Text(
          AppLocalizations.of(context)!.register,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      onPressed: () {
        signUp(emailEditingController.text, passwordEditingController.text);
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
                        child: Text(AppLocalizations.of(context)!.register,
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
                              child: displayNameField,
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
                      singUpButton,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.irlogin),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child:
                                  Text(AppLocalizations.of(context)!.regresar)),
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = AppLocalizations.of(context)!.valido;
            break;
          case "wrong-password":
            errorMessage = AppLocalizations.of(context)!.password;
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

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    Usuario _model = Usuario();

    // writing all the values
    _model.email = user!.email;
    _model.uid = user.uid;
    _model.displayName = displayNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(_model.toMap());
    Fluttertoast.showToast(msg: AppLocalizations.of(context)!.cuentacreada);

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
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
