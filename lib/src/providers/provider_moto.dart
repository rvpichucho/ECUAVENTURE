import 'package:flutter/material.dart';

class MotoProvider with ChangeNotifier{
  String _moto = 'Motos';

  String get moto {
    return _moto;
  }

  set moto (String nombre){
    this._moto=nombre;
    notifyListeners();
  }


}
