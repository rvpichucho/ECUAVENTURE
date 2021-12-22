import 'package:flutter/material.dart';

class MotoProvider with ChangeNotifier{
  String _moto = 'MENU ECUAVENTURE';

  String get moto {
    return _moto;
  }

  set moto (String nombre){
    _moto=nombre;
    notifyListeners();
  }


}
