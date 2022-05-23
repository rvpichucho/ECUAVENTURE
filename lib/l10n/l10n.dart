import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    //const Locale('ar'),
    //const Locale('hi'),
    const Locale('es'),
    const Locale('pt'),
    const Locale('zh'),
    //const Locale('de'),
  ];

  static String getFlag(String code) {
    switch (code) {
      //case 'ar':
      //return '🇦🇪';
      //case 'hi':
      //return '🇮🇳';
      case 'zh':
        return 'CN';
      case 'pt':
        return 'BR';
      case 'es':
        return '🇪🇸';
      //case 'de':
      //return '🇩🇪';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
