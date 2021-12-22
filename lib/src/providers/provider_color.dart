import 'package:flutter/material.dart';
class ThemeChanger with ChangeNotifier{

  static const _beigeC = Color.fromRGBO(60, 195, 245, 1.0);

  get beigeC {
    return _beigeC;
  }

  set beigeC (colors){
    beigeC=colors;
    notifyListeners();
  }
}