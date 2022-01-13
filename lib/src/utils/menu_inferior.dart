import 'package:ecuaventure/src/pages/cuenta_page.dart';
import 'package:ecuaventure/src/pages/menu_page.dart';
import 'package:ecuaventure/src/widgets/Card/sincronizacion_prueba.dart';
//import 'package:ecuaventure/src/widgets/reservacion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}

List<MenuItem> menuOptions = [
  MenuItem("Inicio", Icons.home),
  MenuItem("Reservación", Icons.book_online_outlined),
  MenuItem("Cuenta", Icons.person_outlined),
];

List<Widget> contentWidgets = [const Menu(), const Sincro(), CuentaPage()];
