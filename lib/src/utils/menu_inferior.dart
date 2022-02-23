import 'package:ecuaventure/src/pages/cuenta_page.dart';
import 'package:ecuaventure/src/pages/map_page.dart';
import 'package:ecuaventure/src/pages/menu_page.dart';
import 'package:ecuaventure/src/widgets/reservacion_firebase_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}

List<MenuItem> menuOptions = [
  MenuItem("", Icons.home),
  MenuItem("", Icons.book_online_outlined),
  MenuItem("", Icons.map_outlined),
  MenuItem("", Icons.person_outlined),
];

List<Widget> contentWidgets = [
  const Menu(),
  const VehiclesReservationList(),
  const MapaPage(),
  const CuentaPage()
];
